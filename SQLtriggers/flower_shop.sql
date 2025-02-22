-- from flower_shop

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE compositions (
    composition_id CHAR(5) NOT NULL,
    name VARCHAR(40) NOT NULL,
    description VARCHAR(100),
    price NUMERIC(10,2) CHECK (price > 9.00),
    minimum_quantity INT,
    stock INT,
    PRIMARY KEY(composition_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE recipients (
    recipient_id SERIAL,
    name VARCHAR(40) NOT NULL,
    city VARCHAR(40) NOT NULL,
    postal_code CHAR(6) NOT NULL,
    address VARCHAR(40) NOT NULL,
    PRIMARY KEY(recipient_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE requirements (
    requirement_id SERIAL,
    composition_id CHAR(5) NOT NULL,
    quantity INT,
    price NUMERIC(10,2),
    FOREIGN KEY (composition_id)  
        REFERENCES compositions (composition_id) 
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY(requirement_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Fake data

INSERT INTO customers(customer_id, password, name, city, postal_code, address, email, phone, fax, tax_id, company_id) VALUES
('CUS52364', '&axSDrmz5v', 'Berger, Cole and Nunez', 'North Ericmouth', '60-256', '29428 Alyssa Walks', 'sandrablankenship@example.net', '+57107972433', '5535296e-fax.com', 'PL29319613680', '689562429'),
('CUS00767', ')9Prm9', 'Poole-Hunter', 'Barnesmouth', '09-469', '182 Laura Trace', 'webbedward@example.org', '+55144963398', '8707364e-fax.com', 'PL61691506223', '197850185'),
('CUS47615', 'O$5Zj', 'Fox-Lopez', 'Jamesberg', '93-246', '0596 Zachary Park', 'palmerjeremy@example.net', '+42412286403', '6827891e-fax.com', 'PL94197975251', '046127836'),
('CUS72578', '(2Wq', 'Nguyen-Le', 'New Brian', '55-033', '334 Rebecca Station Apt. 324', 'colebilly@example.org', '+89964471547', '583932e-fax.com', 'PL94045893445', '655954062'),
('CUS00999', '#8Ug2Z', 'Cline-Edwards', 'Amandaport', '63-398', '36479 Juarez Walk Apt. 798', 'michelle23@example.com', '+17274251216', '373761e-fax.com', 'PL24250955243', '486268505'),
('CUS98777', '&Sie3bQi', 'Bowen Ltd', 'Lake Robert', '91-262', '6400 Charles Extensions Apt. 795', 'charles02@example.com', '+49220645502', '124301e-fax.com', 'PL29431628578', '559072636'),
('CUS29096', '0G&2WUhKu&', 'Pacheco, Trujillo and Mckinney', 'South Samanthaburgh', '08-751', '2365 Roberts Knoll Suite 025', 'david47@example.org', '+83261545348', '5786338e-fax.com', 'PL75504204760', '225021456'),
('CUS20575', '@6WnFcffov', 'Clay, Rosales and Thompson', 'Lake Sonyafurt', '79-960', '3880 Watts Unions Apt. 663', 'dbanks@example.net', '+90616224995', '1766988e-fax.com', 'PL57224655627', '353789281'),
('CUS22440', '%2Xs', 'Johnson Inc', 'Dianafurt', '25-327', '47382 Joseph Wall', 'oaguilar@example.net', '+86530479528', '898270e-fax.com', 'PL57044440925', '722875061'),
('CUS09898', '$_5qEGw', 'Davis-Gonzalez', 'Andrewfurt', '61-619', '94063 King Flats Suite 434', 'susancrane@example.org', '+03453237396', '905733e-fax.com', 'PL96004754835', '479383341'),
('CUS05492', '46+6ZpU!y', 'Meza-Reynolds', 'Chanhaven', '79-650', '4165 Edward Motorway Apt. 616', 'tdavis@example.net', '+43984275320', '564220e-fax.com', 'PL98041687157', '680360163'),
('CUS29255', 'p0FkFv&u$', 'Moore LLC', 'Taraborough', '28-286', '16394 Perez Spring', 'wilsonmitchell@example.net', '+92819587980', '4843211e-fax.com', 'PL47852607308', '445233960'),
('CUS08471', '@3r3Me', 'Taylor-Bird', 'Nicolestad', '51-507', '46462 Mark Roads', 'murphyjennifer@example.org', '+65826064327', '774407e-fax.com', 'PL21208793275', '516274954'),
('CUS78062', ')2Gu3R', 'Mcintyre Inc', 'Ryanchester', '27-995', '4245 Lisa Groves', 'patelkathryn@example.org', '+89410220789', '808905e-fax.com', 'PL70945587190', '100226270'),
('CUS51733', '@8Eu', 'Freeman and Sons', 'Ramirezstad', '34-423', '67370 Theresa Field', 'louis00@example.net', '+76529563164', '255453e-fax.com', 'PL19977012660', '807169031'),
('CUS66494', '&*#fF*DCl7', 'Lewis PLC', 'Johnsonfurt', '00-096', '88806 Bolton Bypass Apt. 099', 'baileywilliam@example.com', '+55297209877', '5231108e-fax.com', 'PL04636276885', '451939728'),
('CUS76688', '&1Io', 'Mills Group', 'New Laura', '20-155', '94126 Webster Spur Suite 280', 'smithlaurie@example.org', '+99024219444', '637907e-fax.com', 'PL22189960049', '506546083'),
('CUS78113', '(6Ak', 'Ortega-Hughes', 'North Jillbury', '06-853', '8686 Soto Crossing', 'amandaelliott@example.net', '+39963736059', '752319e-fax.com', 'PL30305897040', '141508991'),
('CUS18538', 't!7l0WTyO', 'Perry, Casey and Harris', 'New Kevin', '76-074', '8328 Sullivan Haven Apt. 516', 'patrick46@example.net', '+12294561020', '1110936e-fax.com', 'PL59561577949', '963773489'),  
('CUS02659', 'CG6aLI*c&$', 'Vargas and Sons', 'Smithmouth', '32-499', '13630 Derek Isle', 'jorgeshort@example.net', '+11052395467', '5383459e-fax.com', 'PL28492162410', '589193838');

INSERT INTO compositions(composition_id, name, description, price, minimum_quantity, stock) VALUES
('CMP33', 'Ask', 'Southern play along result language.', 121.38, 8, 98),
('CMP87', 'Sit', 'Each executive reflect.', 22.1, 10, 49),
('CMP52', 'Turn', 'Thus on anything bag yourself.', 30.73, 1, 6),
('CMP22', 'Note', 'Behavior work must admit money weight.', 12.88, 2, 73),
('CMP50', 'Material', 'Term money discover.', 23.66, 2, 36),
('CMP21', 'Professional', 'Because state though rather sea environment.', 13.56, 4, 60),
('CMP62', 'Former', 'Personal until claim little traditional.', 79.15, 5, 71),
('CMP43', 'Dinner', 'Follow dog ready.', 121.62, 5, 9),
('CMP86', 'Perform', 'Ahead rest whole.', 99.72, 6, 79),
('CMP42', 'Game', 'Network both those bill.', 97.48, 9, 31),
('CMP30', 'Forward', 'Whole give her.', 83.3, 5, 23),
('CMP82', 'Teacher', 'Bed reflect wall.', 130.64, 7, 45),
('CMP92', 'Recently', 'Three win box environment someone.', 110.2, 1, 75),
('CMP88', 'Least', 'Specific evidence federal general simply.', 147.59, 7, 42),
('CMP27', 'Record', 'Fly step anything Republican moment economic.', 54.72, 10, 80),
('CMP38', 'Create', 'Too white senior instead.', 140.38, 4, 69),
('CMP56', 'Chair', 'While often hospital well poor least.', 132.45, 2, 29),
('CMP18', 'Body', 'Talk clear past story increase.', 147.66, 4, 84),
('CMP34', 'Language', 'Attorney concern difficult industry plan.', 85.41, 3, 5),
('CMP40', 'Get', 'Challenge newspaper yeah nothing rock green.', 46.41, 8, 52);

INSERT INTO recipients(name, city, postal_code, address) VALUES
('Kelly PLC', 'Danaland', '90-995', '2944 Butler Freeway'),
('Boone-Mcintyre', 'Traceyhaven', '05-209', '68690 Martin Hollow'),
('Singh, Munoz and Hamilton', 'Port Jonathanchester', '48-846', '0445 Philip Falls Suite 707'),
('Collins and Sons', 'Danhaven', '63-330', '561 Hall Prairie Apt. 698'),
('Boyd Ltd', 'Lake Philipland', '62-743', '311 Buck Mill Apt. 318'),
('Knight-Terrell', 'New Ginaton', '40-516', '52666 Robinson Circles'),
('Love and Sons', 'Lake Leslie', '71-252', '041 Kelly Stream'),
('Matthews, Jenkins and Jackson', 'East Suzanne', '42-950', '731 Collins Island Apt. 059'),
('Hartman LLC', 'Brianburgh', '71-296', '84918 Bryant Plains'),
('Phelps PLC', 'Port Mistyton', '95-534', '498 Kent Inlet'),
('Mendoza, Brown and Mendez', 'New Amy', '68-901', '7274 Matthew Crescent Apt. 256'),
('Delacruz, Brown and Gardner', 'East Philipview', '66-366', '005 Diane Key'),
('Chambers, Spencer and Graves', 'South Veronicamouth', '02-621', '2957 Carly Rest'),
('Shaw-Griffin', 'East Suzannefurt', '77-241', '7950 Powell Hills Suite 907'),
('Beasley-Walter', 'North Kylechester', '82-574', '4751 Michael Trail'),
('Griffin, Key and Cole', 'West Valerie', '51-572', '47807 Tanya Mill Apt. 586'),
('Middleton Ltd', 'Harrisside', '57-907', '235 Richardson Squares Suite 247'),
('Wilkins, Ryan and Hall', 'Port Derrick', '60-433', '2617 Mary Lock'),
('Chung, Hill and Rivera', 'Port Trevor', '71-885', '499 Riley Extensions Suite 823'),
('Walsh, Guerra and Harris', 'Leeberg', '92-943', '24025 Melanie Orchard');

INSERT INTO orders(order_id, customer_id, recipient_id, composition_id, date, price, paid, notes) VALUES
(8790, 'CUS00999', 1, 'CMP33', '2024-05-03', 208.61, True, 'Whether call join serious upon different collection condition.'),
(9680, 'CUS51733', 12, 'CMP88', '2024-02-27', 250.21, False, 'Name executive ago police carry top rate outside oil describe training often.'),
(7320, 'CUS52364', 3, 'CMP40', '2023-12-29', 515.23, True, 'Middle number fish somebody reflect consumer like.'),
(158, 'CUS29096', 10, 'CMP87', '2024-11-06', 480.47, True, 'Pressure free crime everybody eat design style peace possible treat.'),
(2496, 'CUS00767', 6, 'CMP30', '2024-06-11', 666.32, False, 'Civil international body turn building impact move affect imagine find item protect country.'),
(3012, 'CUS08471', 16, 'CMP62', '2023-12-16', 416.72, True, 'Also agency through somebody year almost side.'),
(6428, 'CUS05492', 6, 'CMP30', '2024-03-19', 835.85, False, 'Heavy exactly though system off commercial save.'),
(1426, 'CUS51733', 5, 'CMP33', '2024-08-01', 301.24, False, 'Another ability whole avoid apply money safe.'),
(8468, 'CUS05492', 1, 'CMP43', '2024-03-06', 435.56, True, 'East tonight soon between describe four me difficult little.'),
(9673, 'CUS52364', 13, 'CMP43', '2024-06-09', 462.65, False, 'Small their last surface upon follow gun.'),
(841, 'CUS98777', 3, 'CMP87', '2024-06-10', 668.47, False, 'Nation so success trouble fund set upon.'),
(8584, 'CUS52364', 8, 'CMP92', '2024-04-27', 954.56, False, 'His first social risk later unit.'),
(8626, 'CUS51733', 13, 'CMP42', '2024-07-20', 274.57, True, 'Mrs make form Mrs federal process ahead example author degree dog industry husband.'),
(7388, 'CUS78062', 13, 'CMP87', '2024-09-25', 28.9, False, 'Federal deal blood develop matter last music player woman job war per.'),
(8106, 'CUS29255', 11, 'CMP42', '2024-10-18', 927.7, False, 'Themselves maybe safe employee nothing action agency mother moment sometimes.'),
(3794, 'CUS98777', 3, 'CMP43', '2023-11-22', 396.94, False, 'Win decide make including laugh sort race occur think century.'),
(3350, 'CUS00767', 4, 'CMP87', '2023-12-07', 475.47, False, 'Unit option ever hold worry young experience.'),
(1454, 'CUS51733', 19, 'CMP38', '2024-10-07', 957.96, True, 'Television example way whom mind during employee.'),
(3804, 'CUS09898', 18, 'CMP40', '2024-05-11', 41.63, True, 'That along big resource others then gun similar want responsibility condition rich sign.'),
(3896, 'CUS78113', 5, 'CMP38', '2024-11-03', 334.16, False, 'Wrong day floor center project relationship understand end information why Mr option.');

INSERT INTO requirements(composition_id, quantity, price) VALUES
('CMP33', 89, 162.3),
('CMP92', 98, 885.06),
('CMP43', 46, 250.27),
('CMP82', 85, 347.08),
('CMP33', 64, 975.29),
('CMP87', 59, 609.98),
('CMP40', 37, 857.71),
('CMP21', 58, 463.23),
('CMP50', 16, 540.41),
('CMP30', 76, 959.75),
('CMP88', 82, 555.04),
('CMP50', 48, 174.85),
('CMP33', 48, 720.99),
('CMP52', 19, 500.76),
('CMP22', 92, 927.48),
('CMP18', 9, 965.45),
('CMP27', 95, 294.86),
('CMP43', 76, 630.18),
('CMP62', 81, 100.33),
('CMP38', 43, 492.74);



DROP TRIGGER IF EXISTS orders_management;
DELIMITER //
CREATE TRIGGER orders_management
    BEFORE INSERT ON orders
    FOR EACH ROW
BEGIN
    UPDATE compositions SET stock=(stock-1) WHERE composition_id = NEW.composition_id;
    SET @minimum_quantity = (SELECT minimum_quantity FROM compositions WHERE composition_id = NEW.composition_id);
    SET @stock = (SELECT stock FROM compositions WHERE composition_id = NEW.composition_id);
    SET @price = (SELECT price FROM compositions WHERE composition_id = NEW.composition_id);
    IF @stock<@minimum_quantity THEN
        UPDATE requirements SET quantity = (@minimum_quantity-@stock) WHERE composition_id = NEW.composition_id;
        UPDATE requirements SET price = @price WHERE composition_id = NEW.composition_id;
    END IF;
    SET @price = (SELECT price FROM compositions WHERE composition_id = NEW.composition_id);
    SET NEW.price = (@price*0.8);
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER delivery_management
    AFTER UPDATE ON compositions
    FOR EACH ROW
BEGIN
    SET @minimum_quantity = (SELECT minimum_quantity FROM compositions WHERE composition_id = NEW.composition_id);
    SET @stock = (SELECT stock FROM compositions WHERE composition_id = NEW.composition_id);
    IF @minimum_quantity>@stock THEN
        UPDATE requirements SET quantity=(@minimum_quantity-@stock) WHERE composition_id = NEW.composition_id;
    ELSE
        UPDATE requirements SET quantity=0 WHERE composition_id = NEW.composition_id;
    END IF;
END;
//
DELIMITER ;
