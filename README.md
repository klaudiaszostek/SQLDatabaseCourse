# Flower shop

1.
The database serves as the foundation for an online flower shop 
(providing data management for the full functionality of the web-based store platform). ✅

The online platform allow customers to select compositions from the shop's offerings. 
When placing an order, customers must provide their data (identifier and password) - login
or register in the system if they are new customers (using the flower shop for the first time). 
Additionally, the customer must specify the delivery location and the recipient of the flowers. ✅

The database also serves as the foundation for managing the flower shop. 
It should store information about the current inventory (quantities of individual compositions) 
and automatically report requirements for resources that are running low. (inventory template) ✅

----------------------------------------------------------------------------------------------------------
The script creates tables for the "flower_shop" database in accordance with the project 
and description below (table and column names consistent with the logic of the database schema).

# Customers Table:
customer_id - character type, up to 10 characters, primary key
password (password hash) - character type, up to 10 characters, minimum 4 characters, required
name - character type, up to 40 characters, required
city - character type, up to 40 characters, required
postal_code - character type, exactly 6 characters, required
address - character type, up to 40 characters, required
email - character type, up to 40 characters
phone - character type, up to 16 characters, required
fax - character type, up to 16 characters
tax_id - character type, exactly 13 characters
company_id - character type, exactly 9 characters ✅

# Compositions Table:
composition_id - character type, exactly 5 characters, primary key
name - character type, up to 40 characters, required
description - character type, up to 100 characters
price - numeric type with 2 decimal precision, value not less than 10.00
minimum_quantity - integer type
stock - integer type ✅

# Recipients Table:
recipient_id - serial type, primary key
name - character type, up to 40 characters, required
city - character type, up to 40 characters, required
postal_code - character type, exactly 6 characters, required
address - character type, up to 40 characters, required ✅

# Orders Table:
order_id - integer type, primary key
customer_id - character type, up to 10 characters, foreign key, required
recipient_id - integer type, foreign key, required
composition_id - character type, exactly 5 characters, foreign key, required
date - date type, required
price - numeric type with 2 decimal precision
paid - boolean type
notes - character type, up to 200 characters ✅

# Requirements Table:
This table will manage the order of compositions needed for the flower shop's operations. ✅


2.
The data appropriately prepared in the file that creates the database and inserted into the corresponding tables 
(at least 20 rows in each table). ✅


3.
Definitions of references between tables using foreign keys in the script included. ✅


----------------------------------------------------------------------------------------------------------
Summary of Web Application Functionality

Login and Registration:
The customer can log in or register, and their data is saved in the customers table.

Placing an Order:
The customer selects a composition from a list.
The form automatically fills in:
Customer ID (readonly, from the session),
Recipient Name (default is the customer's name, but it can be changed),
Delivery Address (city, postal code, address – retrieved from the registration data, can be modified),
Price (based on the selected composition).
The customer can add notes.

Saving the Order:
The order (along with recipient and composition data) is saved in the database in the orders and recipients tables.
The stock of the composition in the compositions table is automatically updated (decreased by 1).

Viewing Orders:
The customer can view their orders (ID, composition, price, payment status, recipient details, and notes).

Stock Management:
Administrators can see a list of compositions with low stock levels (e.g., below 5).

Purpose of the Application: A simple online flower shop system with customer functionality (login, placing orders) and basic inventory management for administrators.
