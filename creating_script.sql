DROP DATABASE IF EXISTS flower_shop;
CREATE DATABASE IF NOT EXISTS flower_shop;
USE flower_shop;

SELECT 'CREATING DATABASE STRUCTURE' as 'INFO';

DROP TABLE IF EXISTS 
    customers,
    compositions,
    recipients,
    orders,
    requirements;

CREATE TABLE customers (
    customer_id VARCHAR(10) NOT NULL,
    password VARCHAR(10) NOT NULL CHECK (LENGTH(password) > 3),
    name VARCHAR(40) NOT NULL,
    city VARCHAR(40) NOT NULL,
    postal_code CHAR(6) NOT NULL,
    address VARCHAR(40) NOT NULL,
    email VARCHAR(40),
    phone VARCHAR(16) NOT NULL,
    fax VARCHAR(16),    
    tax_id CHAR(13),
    company_id CHAR(9),
    PRIMARY KEY (customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE compositions (
    composition_id CHAR(5) NOT NULL,
    name VARCHAR(40) NOT NULL,
    description VARCHAR(100),
    price NUMERIC(10,2) CHECK (price > 10.00),
    minimum_quantity INT,
    stock INT,
    PRIMARY KEY(composition_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE recipients (
    recipient_id SERIAL,
    name VARCHAR(40) NOT NULL,
    city VARCHAR(40) NOT NULL,
    postal_code CHAR(6) NOT NULL,
    address VARCHAR(40) NOT NULL,
    PRIMARY KEY(recipient_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE orders (
    order_id BIGINT NOT NULL,
    customer_id VARCHAR(10) NOT NULL,
    recipient_id BIGINT UNSIGNED NOT NULL,
    composition_id CHAR(5) NOT NULL,
    date DATE NOT NULL,
    price NUMERIC(10,2),
    paid BOOLEAN,
    notes VARCHAR(200),
    FOREIGN KEY (customer_id)  
        REFERENCES customers (customer_id) 
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (recipient_id)  
        REFERENCES recipients (recipient_id) 
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (composition_id)  
        REFERENCES compositions (composition_id) 
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY(order_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE requirements (
    composition_id CHAR(5) NOT NULL,
    quantity INT,
    price NUMERIC(10,2) CHECK (price > 10.00),
    FOREIGN KEY (composition_id)  
        REFERENCES compositions (composition_id) 
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY(composition_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
