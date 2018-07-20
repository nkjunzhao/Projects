from flask import Flask, g
from flask_mysqldb import MySQL
import os, re

db = MySQL()

app = Flask(__name__)

app.config.update(
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'Health_Hack',
    DEBUG = True,
    MYSQL_USER = 'cs6440',
    MYSQL_PASSWORD = 'cs6440',
    MYSQL_DB = 'cs6440',
    MYSQL_HOST = 'hhacker-mysql'
)

db.init_app(app)

def init_db():
    """Initializes the database."""
    cur = db.connection.cursor()
    exec_sql_file(cur, os.path.join(os.path.dirname(__file__), './db/schema.sql'))
    exec_sql_file(cur, os.path.join(os.path.dirname(__file__), './db/seed_data.sql'))

@app.cli.command('initdb')
def initdb_command():
    """Creates the database tables."""
    init_db()
    print('Initialized the database.')

def connect_db():
    try:
        con = db.connection
        return con
    except:
        print("localhost db connection")
        app.config.update(MYSQL_HOST = '')
        con = db.connection
        return con

@app.before_request
def before_request():
    g.db = connect_db()

def exec_sql_file(cursor, sql_file):
    print "\n[INFO] Executing SQL script file: '%s'" % (sql_file)
    statement = ""

    for line in open(sql_file):
        if re.match(r'--', line):  # ignore sql comment lines
            continue
        if not re.search(r'[^-;]+;', line):  # keep appending lines that don't end in ';'
            statement = statement + line
        else:  # when you get a line ending in ';' then exec statement and reset for next statement
            statement = statement + line
            print "\n\n[DEBUG] Executing SQL statement:\n%s" % (statement)
            try:
                cursor.execute(statement)
            except Exception as e:
                print "\n[WARN] MySQLError during execute statement \n\tArgs: '%s'" % (str(e.args))

            statement = ""
    db.connection.commit()

from app import routes
