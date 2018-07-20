from flask import request, make_response, jsonify, g, abort, render_template, flash, redirect,url_for,session
from app import app
from forms import LoginForm, RegisterForm
import json, os, urllib2, datetime

@app.route('/')
@app.route('/index')
def index():
    session.clear()
    return render_template('index.html')

@app.route('/logout')
def logout():
    print("Clear session --- ")
    session.clear()
    return render_template('index.html')

@app.route('/main')
def main():
    fullname = session.get('fullname')
    email = session.get('email')
    fhir_id = session.get('fhir_id')
    return render_template('index.html',fullname=fullname, email=email,fhir_id=fhir_id,login_success='True')

@app.route('/login', methods=['GET','POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        data = {'email': form.email.data, 'password': form.password.data}
        cmd = '''
                SELECT email, password, first_name, last_name, fhir_id
                FROM User
                WHERE email = "{}" AND password = "{}"
            '''.format(data['email'], data['password'])
        cur = g.db.cursor()
        cur.execute(cmd)
        res = cur.fetchone()
        if res:
            session['fullname'] = res[2] + ', ' + res[3]
            session['email'] = res[0]
            session['fhir_id'] = res[4]
            fullname = session['fullname']
            email = session['email']
            fhir_id = session['fhir_id']
            print("email = " + email + "fullname = " + fullname + "fhir_id = " + fhir_id)
            return redirect(url_for('main', fullname=fullname, email=email, fhir_id=fhir_id, login_success='True'))
        else:
            form.email.errors.append("Invalid email or password")
            form.password.errors.append("Invalid email or password")
    else:
        print("Login --- Invalid form input");

    return render_template('login.html',form=form)


@app.route('/registration', methods=['GET', 'POST'])
def registration():
    form = RegisterForm()
    if form.validate_on_submit():
        print("-----------Registration 1. verified -------- ")
        data = parseRegisterForm(form)
        col_names = ['fhir_id', 'email','password','birthday','first_name',
         'middle_name', 'last_name']

        cmd = '''
            INSERT INTO User ({})
            values ('{fhir_id}', '{email}', '{password}', '{birthday}', '{first_name}', '{middle_name}',
            '{last_name}');
            '''.format(', '.join(col_names), **data)
        cur = g.db.cursor()
        print(cmd)
        try:
            cur.execute(cmd)
            g.db.commit()
            session['fullname'] = form.first_name.data + ', ' + form.last_name.data
            session['email'] = form.email.data
            session['fhir_id'] = form.fhir_id.data
            #return render_template('main_menu.html',register_response=json.loads(register_response.data))
            fullname = session['fullname']
            email = session['email']
            fhir_id = session['fhir_id']
            return redirect(url_for('main', fullname=fullname, email=email, register_success='True', fhir_id=fhir_id))
        except:
            print("-----------Registration 3. DB ERROR with SQL-------")
            print(cmd)
            form.email.errors.append("This email is not available")

    return render_template('registration.html',form=form)

def parseRegisterForm(form):
    data = {'email' : form.email.data,
            'password' : form.password.data,
            'first_name' : form.first_name.data,
            'middle_name' : form.middle_name.data,
            'last_name' : form.last_name.data,
            'birthday' : form.birthday.data,
            'fhir_id' : form.fhir_id.data,
            }
    return data

@app.route('/find_lowest_price', methods=['GET', 'POST'])
def find_lowest_price():
    print("Find the lowest price ----- ")
    search_list = json.loads(request.form['search_list'])
    a = get_individual_drug_list(search_list)
    b = get_combined_drug_list(a)
    session['individual_drug_list'], session['combined_drug_list'] = a, b
    return jsonify(find_lowest_price_status='Success')

def get_individual_drug_list(search_list):
    individual_drug_list = []
    for si in search_list:
        cmd = '''
                Select price_value, is_coupon_price, store from Price_Association join Price on Price.price_id = Price_Association.price_id
                WHERE drug_name = "{}" AND form_type = "{}" AND dosage_value = "{}" AND quantity_value = "{}";
            '''.format(si['drug_name'], si['form_type'], si['dosage_value'], si['quantity_value'])

        cur = g.db.cursor()
        cur.execute(cmd)
        res_list = cur.fetchall()
        item = {}
        item['email'] = session.get('email')
        item['date'] = datetime.datetime.now().strftime('%Y-%b-%d')
        item['drug'] = si['drug_name'] + " " + si['form_type'] + " " + si['dosage_value'] + " " +  si['quantity_value']
        item['pharmacy'] = []
        item['best_price'] = float('inf')
        item['store'] = 'None'
        item['drug_name'] = si['drug_name']
        item['form_type'] = si['form_type']
        item['dosage_value'] = si['dosage_value']
        item['quantity_value'] = si['quantity_value']
        unique_stores = []
        for res in res_list:
            if str(res[2]) not in unique_stores:
                unique_stores.append(str(res[2]))
                p = {}
                p['name'] = str(res[2])
                if res[1] == 1:
                    p['withCoupon'] = res[0]
                elif res[1] == 0:
                    p['originalPrice'] = res[0]
                item['pharmacy'].append(p)

            elif str(res[2]) in unique_stores:
                for p in item['pharmacy']:
                    if (str(res[2]) == str(p['name'])):
                        if res[1] == 1:
                            p['withCoupon'] = res[0]
                        elif res[1] == 0:
                            p['originalPrice'] = res[0]
                            # p['withCoupon'] = "$" + str(res[0]) if res[0] > 0 else "NA"
            if res[0] > 0 and res[0] < item['best_price']:
                item['best_price'] = res[0]
                item['store'] = str(res[2])
        if res_list:
            log_search_history(item)
        else:
            print("Log Search History ERROR/Search --- Invalid SQL statement -- " + cmd)
        individual_drug_list.append(item)
    return individual_drug_list

def get_combined_drug_list(individual_drug_list):
    combined_drug_list = []
    unique_stores = []
    for item in individual_drug_list:
        for p in item['pharmacy']:
            if p['name'] not in unique_stores:
                unique_stores.append(str(p['name']))
                cd = {}
                cd['name'] = str(p['name'])
                cd['originalPrice'] = p['originalPrice']
                cd['withCoupon'] = p['withCoupon']
                combined_drug_list.append(cd)
            elif p['name'] in unique_stores:
                for cd in combined_drug_list:
                    if (p['name'] == str(cd['name'])):
                        cd['originalPrice'] = round(p['originalPrice'] + cd['originalPrice'], 2)
                        cd['withCoupon'] = round(p['withCoupon'] + cd['withCoupon'], 2)
    return combined_drug_list


def log_search_history(item):
    cur = g.db.cursor()
    insert_cmd = '''
                INSERT INTO Search_History (searched_medication, date, best_price, store, email)
                VALUES("{}", "{}", "{}", "{}", "{}");
            '''.format(item['drug'], item['date'], item['best_price'], item['store'], item['email'])
    try:
        cur.execute(insert_cmd)
        g.db.commit()
    except:
        print("----------- Log Search History ERROR/Insert ------ Most likely no email provided")
        print(insert_cmd)

@app.route('/search', methods=['GET', 'POST'])
def search():
    print("-------------------Search backend--------------")
    print(request.form['key'])
    key = json.loads(request.form['key'])
    data = []
    if 'type' in key and key['type'] == 'getDrugNames':
        data = getDrugNames(key)
    elif 'type' in key and key['type'] == 'getFormTypes':
        data = getFormTypes(key)
    elif 'type' in key and key['type'] == 'getDosageValues':
        data = getDosageValues(key)
    elif 'type' in key and key['type'] == 'getQuantityValues':
        data = getQuantityValues(key)
    print(data)
    return jsonify(key=key, search_success='True', data=data)

def getFormTypes(key):
    cmd = '''
            SELECT DISTINCT form_type
            FROM Price_Association
            WHERE drug_name like '%{}%'
            ORDER BY form_type DESC
        '''.format(key['drug_name'])
    print(cmd)
    cur = g.db.cursor()
    cur.execute(cmd)
    res = cur.fetchall()
    results = []
    if res:
        for item in res:
            obj = {}
            obj['form_type'] = item[0]
            results.append(obj)
        print("getFormTypes - SUCCESS with key = ")
        print(key)
    else:
        print("getFormTypes - ERROR with key = ")
        print(key)
    return results

def getDosageValues(key):
    cmd = '''
            SELECT DISTINCT dosage_value
            FROM Price_Association
            WHERE drug_name like '%{}%' AND form_type = '{}'
            ORDER BY cast(dosage_value as unsigned) DESC
        '''.format(key['drug_name'], key['form_type'])
    print(cmd)
    cur = g.db.cursor()
    cur.execute(cmd)
    res = cur.fetchall()
    results = []
    if res:
        for item in res:
            obj = {}
            obj['dosage_value'] = item[0]
            results.append(obj)
        print("getDosageValues - SUCCESS with key = ")
        print(key)
    else:
        print("getDosageValues - ERROR with key = ")
        print(key)
    return results

def getQuantityValues(key):
    cmd = '''
            SELECT DISTINCT quantity_value
            FROM Price_Association
            WHERE drug_name like '%{}%' AND form_type = '{}' AND dosage_value = '{}'
            ORDER BY cast(quantity_value as unsigned) DESC
        '''.format(key['drug_name'], key['form_type'], key['dosage_value'])
    print(cmd)
    cur = g.db.cursor()
    cur.execute(cmd)
    res = cur.fetchall()
    results = []
    if res:
        for item in res:
            obj = {}
            obj['quantity_value'] = item[0]
            results.append(obj)
        print("getQuantityValues - SUCCESS with key = ")
        print(key)
    else:
        print("getQuantityValues - ERROR with key = ")
        print(key)
    return results

def getDrugNames(key):
    cmd = '''
            SELECT DISTINCT drug_name
            FROM Price_Association
            WHERE drug_name like '%{}%'
            ORDER BY drug_name DESC
        '''.format(key['drug_name'])
    print(cmd)
    cur = g.db.cursor()
    cur.execute(cmd)
    res = cur.fetchall()
    results = []
    if res:
        for item in res:
            obj = {}
            obj['drug_name'] = item[0]
            results.append(obj)
        print("getDrugNames - SUCCESS with key = ")
        print(key)
    else:
        print("getDrugNames - ERROR with key = ")
        print(key)
    return results

def getDataByKeyWord(keyword):
     file = os.path.join(os.path.dirname(__file__), './data/individual_drug_price.json')
     db = json.load(open(file))
     res = []
     for drugData in db:
         found = False
         for key, value in drugData.iteritems():
             if str(key) == "drug" and str(value).find(keyword) != -1:
                 found = True
                 continue
         if found==True:
            res.append(drugData)
     return res

@app.route('/account', methods=['GET', 'POST'])
def account():
    fullname = session.get('fullname')
    email = session.get('email')
    data = {'email': email}
    cmd = '''
            SELECT email, password, first_name, middle_name, last_name, birthday, fhir_id
            FROM User
            WHERE email = "{}"
        '''.format(data['email'])
    cur = g.db.cursor()
    cur.execute(cmd)
    res = cur.fetchone()
    if res:
        account_response = jsonify(email=res[0],\
                                password=res[1],\
                                first_name=res[2],\
                                middle_name=res[3],\
                                last_name=res[4],\
                                fullname=res[2] + ', ' + res[4],\
                                birthday=res[5],\
                                fhir_id=res[6],\
                                get_account_success='True')
        print("account - SUCCESS getting account information with email = " + email)
        print(json.loads(account_response.data))
        return render_template("account_information.html", account_response=json.loads(account_response.data))
    else:
        print("account - ERROR getting account information with email = " + email)
        account_response = jsonify(email=email,fullname=fullname,get_account_success='False')
        return render_template("account_information.html", account_response=json.loads(account_response.data))

@app.route('/history')
def history():
    fullname = session.get('fullname')
    email = session.get('email')
    fhir_id = session.get('fhir_id')
    data = {'email': email}
    cmd = '''
            SELECT search_id, searched_medication, date, best_price, store, email
            FROM Search_History
            WHERE email = "{}"
            ORDER BY search_id DESC
        '''.format(data['email'])
    cur = g.db.cursor()
    cur.execute(cmd)
    res = cur.fetchall()
    history_list = []
    if res:
        for item in res:
            history = {}
            history['medication'] = item[1]
            history['date'] = item[2]
            history['price'] = item[3]
            history['store'] = item[4]
            history_list.append(history)
        print("History - SUCCESS getting search history with email = " + email)
    else:
        print("History - ERROR getting search history with email = " + email)
    history_list = jsonify(history_list).data
    print(history_list)
    return render_template("account_search_history.html", history_list=history_list, fullname=fullname, email=email,fhir_id=fhir_id)

@app.route('/med_history')
def med_history():
    fullname = session.get('fullname')
    email = session.get('email')
    fhir_id = session.get('fhir_id')
    med_history_list = []
    if len(fhir_id) > 0:
        url = str("http://hapi.fhir.org/baseDstu3/MedicationStatement?patient=" + fhir_id)
        contents = json.loads(urllib2.urlopen(url).read())
        print(contents)
        if contents is not None and 'entry' in contents:
            for e in contents['entry']:
                if 'resource' in e:
                    r = e['resource']
                    mh = {}
                    if 'status' in r:
                        mh['Status'] = r['status']
                    else:
                        mh['Status'] = 'N/A'
                    if ('dosage' in r and len(r['dosage']) > 0 and 'text' in r['dosage'][0]):
                        mh['DosageAndUsage'] = r['dosage'][0]['text']
                    else:
                        mh['DosageAndUsage'] = 'N/A'
                    if ('medicationCodeableConcept' in r and 'coding' in r['medicationCodeableConcept']):
                        mh['Medication'] = r['medicationCodeableConcept']['coding'][0]['display']
                        # mh['Medication'] = r['medicationCodeableConcept']['coding']['display']
                    if ('medicationCodeableConcept' in r and 'text' in r['medicationCodeableConcept']):
                        mh['Medication'] = r['medicationCodeableConcept']['text']
                    if ('medicationReference' in r and 'display' in r['medicationReference']):
                        mh['Medication'] = r['medicationReference']['display']
                    med_history_list.append(mh)
    print(med_history_list)
    med_history_list = jsonify(med_history_list).data
    return render_template('med_history.html', med_history_list=med_history_list, fullname=fullname, email=email, fhir_id=fhir_id)

@app.route('/search_result')
def search_result():
    a, b = session.get('individual_drug_list'), session.get('combined_drug_list')
    c = getCombined_drug_name(a)
    if session.get('fullname'):
        return render_template("search_result.html", individual_drug_list=jsonify(a).data, combined_drug_list=jsonify(b).data, combined_drug_name=c, fullname=session['fullname'], login_success='True')
    return render_template("search_result.html", individual_drug_list=jsonify(a).data, combined_drug_list=jsonify(b).data, combined_drug_name=c)

def getCombined_drug_name(list):
    name = ""
    i = 1
    for v in list:
        name = name + str(i) + ")" + v['drug'] + "  "
        i = i + 1
    return name
