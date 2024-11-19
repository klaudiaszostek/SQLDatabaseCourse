# SQLDatabaseCourse
Basic concepts and notions of relational databases, SQL basics, examples of database systems.

1.
The database serves as the foundation for an online flower shop (providing data management for the full functionality of the web-based store platform).

The online platform allow customers to select compositions from the shop's offerings. When placing an order, customers must provide their data (identifier and password) or register in the system if they are new customers (using the flower shop for the first time). Additionally, the customer must specify the delivery location and the recipient of the flowers.

The database also serves as the foundation for managing the flower shop. It should store information about the current inventory (quantities of individual compositions) and automatically report requirements for resources that are running low.

The script creates tables for the "flower_shop" database in accordance with the project and description below (table and column names consistent with the logic of the database schema).

Customers Table:
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
company_id - character type, exactly 9 characters

Compositions Table:
composition_id - character type, exactly 5 characters, primary key
name - character type, up to 40 characters, required
description - character type, up to 100 characters
price - numeric type with 2 decimal precision, value not less than 10.00
minimum_quantity - integer type
stock - integer type

Recipients Table:
recipient_id - serial type, primary key
name - character type, up to 40 characters, required
city - character type, up to 40 characters, required
postal_code - character type, exactly 6 characters, required
address - character type, up to 40 characters, required

Orders Table:
order_id - integer type, primary key
customer_id - character type, up to 10 characters, foreign key, required
recipient_id - integer type, foreign key, required
composition_id - character type, exactly 5 characters, foreign key, required
date - date type, required
price - numeric type with 2 decimal precision
paid - boolean type
notes - character type, up to 200 characters

Requirements Table:
This table will manage the order of compositions needed for the flower shop's operations.