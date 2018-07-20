# Introduction

A desktop web application where a user can compare drug prices among the major three pharmacies (Walmart, CVS, Walgreen) along GoodRx discount program. User can use this app either by signing in or not signing in. Once signing up with FHIR ID , users can also get access to their medical history stored in the FHIR server to get the information of their prescribed drugs. Besides, user can view their personal information and search history.

# Installation

## Run Application via Docker
Docker technology enables cross-platform deployment for the Flask application and MySQL database. More specifically, ```./Dockerfile``` defines the built environment for the Flask application. ```./app/db/.Dockerfile``` defines the version and the initial state of the database. ```./docker-compose.yml``` instantiates previous two Docker images via creating two Docker containers, and then defines the relationship of two containers.

1. Navigate to the project directory, and run the command ```docker-compose up```.
1. Access the site via [http://localhost:5000](http://localhost:5000).

## Run Application Locally
1. Run the command ```mysql -u root -p``` to connect with MySQL server.
1. From mysql, run the following commands to create the database.
```
CREATE database cs6440;
CREATE USER 'cs6440'@'localhost' IDENTIFIED BY 'cs6440';
GRANT ALL PRIVILEGES ON *.* TO 'cs6440'@'localhost';
```
3. Navigate to the project directory, and run following commands to start the application.
```
sudo pip install virtualenv
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
export FLASK_DEBUG=1
export FLASK_APP=run.py
flask initdb
flask run
```
4. Access the website via [http://127.0.0.1:5000/](http://127.0.0.1:5000/).
