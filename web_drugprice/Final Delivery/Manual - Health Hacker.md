# CS 6440 Project Manual


## Table of Contents
- [Team Name](#team-name)
- [Team Members](#team-members)
- [Project Name](#project-name)
- [Github Link](#github-link)
- [Introduction](#introduction)
- [App running environment](#app-running-environment)
- [How to use this web app](#how-to-use-this-web-app)
    - [Search (no login)](#search-(no-login))
    - [Search Results (no login)](#search-results-(no-login))
        - [Individual drug price](#individual-drug-price)
        - [Combined drug price](#combined-drug-price)
    - [Register](#register)
    - [Log in](#log-in)
    - [Search (logged in)](#search-(logged-in))
    - [Search Results (logged in)](#search-results-(logged-in))
    - [Account (logged in)](#account-(logged-in))
    - [Basic Information](#basic-information)
    - [Searched Medications](#searched-medications)
    - [Med History (logged in)](#med-history-(logged-in))

## Team Name
 - Health Hacker
 
## Team Members 
 - Ran Ran
 - Xing Xing
 - Pingling Hang
 - Sen Lin
 - Lu Sun
 - Jun Zhao
 
## Project Name
 - App for Consolidating and Comparing Prices on Different Discount Drug Programs

## GitHub link 
https://github.gatech.edu/gt-hit-spring2018/APP-FOR-CONSOLIDATING-AND-COMPARING-PRICES-ON-DIFFERENT-DISCOUNT-DRUG-PROGRAMS

## Introduction
A desktop web application where a user can compare drug prices among the major three pharmacies (Walmart, CVS, Walgreen) along GoodRx discount program. User can use this app either by signing in or not signing in. Once signing up with FHIR ID , users can also get access to their medical history stored in the FHIR server to get the information of their prescribed drugs. Besides, user can view their personal information and search history.

This document guides a user through the necessary steps to find the drug prices and get access to the account once signing up. 

## App running environment
For developers, see “Special Instructions - Health Hacker.md” for more information on how to run this app via Docker and Flask.

For users, the app is compatible with most desktop web browsers (Google Chrome, FireFox, Safari, Internet Explorer). 

Some limitations of this app, see "Limitations" in the file “Special Instructions - Health Hacker.md”.  

## How to use this web app 
### Search (no login)
User can search the drug without login required. 

#### Steps
- Under the input box, type drug’s name, then click the “Search” button (Figure 1)
- Three drop down lists will be shown and user can select drug form, dosage, and quantity, once confirmed, click the “Add” button (Figure 2). If the drug is not in our current database, a pop-up window shows the alert information: "sorry，we don’t have information for this drug" (Figure 3).
- The webpage will return a search list showing the drug user is looking for. User can search more than one drug by repeating step 1-2. User can also delete drug from the list (Figure 4).
- Click “Find the Lowest Price” and the search results would be shown.
### Example

Figure 1:
![alt text](https://github.com/nkjunzhao/Projects/blob/master/web_drugprice/Final%20Delivery/images/Figure1.png)

Figure 2:
![alt text](https://github.com/nkjunzhao/Projects/blob/master/web_drugprice/Final%20Delivery/images/Figure2.png)

Figure 3:
![alt text](https://github.com/nkjunzhao/Projects/blob/master/web_drugprice/Final%20Delivery/images/Figure3.png)

Figure 4:
![alt text](https://github.com/nkjunzhao/Projects/blob/master/web_drugprice/Final%20Delivery/images/Figure4.png)

## Search Results (no login)
If user searches for multiple drug prices, the search results will show separate drug prices from different stores and discounted drug prices. In addition, it also shows the combined price of drugs. The tab “Individual drug price” shows separate drug prices and the tab “Combined drug price” shows the summed price of drug from each store.
### Individual drug price
#### Steps
- Individual drug price is the default page once user click “Find the Lowest Price” button in the search page (Figure 5).
- User can click the either “Pharmacy”, “Original Price”, “with Coupon” to sort them ascending or descending (Figure 6).
#### Example 

Figure 5:
![alt text](https://github.com/nkjunzhao/Projects/blob/master/web_drugprice/Final%20Delivery/images/Figure5.png)

Figure 6:
![alt text](https://github.com/nkjunzhao/Projects/blob/master/web_drugprice/Final%20Delivery/images/Figure6.png)

### Combined drug price
#### Steps
- On the “Individual drug price” page, click the tab “Combined drug price”, a new window will show the summed prices of multiple drugs searched by user (Figure 7).
- User can click the either “Pharmacy”, “Original Price”, “with Coupon” to sort them ascending or descending (Figure 8).
#### Example 

Figure 7:
![alt text](https://github.com/nkjunzhao/Projects/blob/master/web_drugprice/Final%20Delivery/images/Figure7.png)

Figure 8:
![alt text](https://github.com/nkjunzhao/Projects/blob/master/web_drugprice/Final%20Delivery/images/Figure8.png)

## Register
User can sign up to enjoy more services from this app. Once user signs up and logs in, he/she will be able to see his/her own basic information, searched meds history, and medication history.
### Steps
- On the main page, click the link “Register”
- Input email address (required, if input wrong format, alert shows up)
- Input Birthday (if input wrong format, alert shows up)
- Input FHIR Patient ID (required)
- Create a password (required)
- Retype the password (required, if input different password, alert shows up))
- Click “Sign up” button (Figure 9)
- The webpage directs to the search page (logged in)
### Example 

Figure 9:
![alt text](https://github.com/nkjunzhao/Projects/blob/master/web_drugprice/Final%20Delivery/images/Figure9.png)

## Log in
### Steps
- On the main page, click the link “Log in”
- Enter email address
- Enter password
- Click the button “Login” (Figure 10) 
- The webpage directs to the search page (logged in). If user inputs invalid email/password, or wrong password, or there is no account in the database, alert shows up (Figure 11).
### Example 

Figure 10:
![alt text](https://github.com/nkjunzhao/Projects/blob/master/web_drugprice/Final%20Delivery/images/Figure10.png)

Figure 11:
![alt text](https://github.com/nkjunzhao/Projects/blob/master/web_drugprice/Final%20Delivery/images/Figure11.png)

## Search (logged in)
The functionality of search with logged in is similar to the search without logged in. Please reference to the steps in section “Search (no login)”. The main difference is there are two more tabs “Account” and “Med History” that user can get access to (Figure 12).

### Example
Figure 12:
![alt text](https://github.com/nkjunzhao/Projects/blob/master/web_drugprice/Final%20Delivery/images/Figure12.png)

## Search Results (logged in)
The functionality of search results with logged in is similar to the search results without logged in. Please reference to the steps in section “Search (no login)”. The main difference is user can click “Back to the main menu” to be directed to search page with logged in.

## Account (logged in)
Account contains two major parts. The default page is “Basic Information” which shows the user’s profile. The “Searched Medication” shows the search history.
### Basic Information
#### Steps
- It is the default page once user clicks the “Account” link.
- It shows the user’s name, birthday, email, and FHIR patient id (Figure 13).
- The webpage directs to the search page (logged in)
#### Example 

Figure 13:
![alt text](https://github.com/nkjunzhao/Projects/blob/master/web_drugprice/Final%20Delivery/images/Figure13.png)

### Searched Medications
#### Steps
- Under the “Account” page, click the tab “Searched Medications”
- The new page shows searched medication, date, best price, and store (Figure 14).
#### Example 

Figure 14:
![alt text](https://github.com/nkjunzhao/Projects/blob/master/web_drugprice/Final%20Delivery/images/Figure14.png)

## Med History (logged in)
### Steps
- Once user signs in, the tab “Med History” is shown on the navigation bar
- Click the tab “Med History”
- The page shows user’s medication history, status, dosage & usage (Figure 15). 

#### Example

Figure 15:
![alt text](https://github.com/nkjunzhao/Projects/blob/master/web_drugprice/Final%20Delivery/images/Figure15.png)
