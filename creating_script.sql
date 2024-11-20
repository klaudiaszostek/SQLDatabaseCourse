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



INSERT INTO customers(customer_id, password, name, city, postal_code, address, email, phone, fax, tax_id, company_id) VALUES
('CUS19563', ')1GqN', 'Summers Inc', 'South Patricia', '30-435', '706 Jasmine Shores Suite 998', 'seth03@example.org', '+14873615731', '1245767e-fax.com', 'PL57856839996', '970983111'),
('CUS97982', '!9K!ZSaw', 'Quinn-Huynh', 'Osbornmouth', '36-915', '942 Frederick Crossroad', 'harrisbrian@example.net', '+20013539029', '0671233e-fax.com', 'PL66692823759', '943478897'),
('CUS13848', '%7ScrQ', 'Young-Ayers', 'Lisashire', '20-734', '2219 Gibbs Wells Suite 472', 'lwalker@example.net', '+70653509614', '813054e-fax.com', 'PL82604048394', '511840767'),
('CUS99044', '%%36O3mcZJ', 'White Inc', 'South Jennifer', '88-472', '47342 Ashlee Plain Suite 697', 'robersonstacy@example.org', '+81038819797', '522777e-fax.com', 'PL72513747077', '312151290'),
('CUS75266', '$6Ww', 'Glover, Martin and Foster', 'Bethburgh', '72-589', '889 Bailey Spring Suite 326', 'hharvey@example.com', '+87348911302', '533563e-fax.com', 'PL47640120279', '488011537'),
('CUS17436', '&0Da', 'Hicks Ltd', 'West Keithhaven', '89-808', '23479 Lisa Hill', 'laurahenry@example.net', '+44767160265', '1762074e-fax.com', 'PL71982128733', '492056778'),
('CUS16562', '%E19sYha5n', 'Johnson PLC', 'New Bradley', '86-491', '912 Michael Viaduct', 'susan35@example.net', '+20423648447', '813906e-fax.com', 'PL18053070166', '444489807'),
('CUS68267', '(1Hi', 'Price Inc', 'Walkerfurt', '09-805', '24658 Carter Isle', 'cynthiajacobs@example.com', '+79259375392', '2871311e-fax.com', 'PL45337528305', '821368664'),
('CUS05027', '&p9gQwLt5', 'Jarvis-Preston', 'Chadmouth', '79-649', '119 Kelly Harbor', 'james93@example.net', '+27618275273', '236658e-fax.com', 'PL17833416961', '034801708'),
('CUS88853', '!5Rd', 'Cohen Inc', 'Hoffmanhaven', '85-107', '067 Phillip Rue Apt. 705', 'nmoran@example.com', '+59523507735', '7233027e-fax.com', 'PL01069214010', '613115292'),
('CUS97318', '_0Gx', 'Smith, English and Thomas', 'Santanaburgh', '46-323', '2787 Sherman Bridge Apt. 572', 'mariarodriguez@example.org', '+48758430043', '027442e-fax.com', 'PL61848773818', '640967150'),
('CUS65877', '1hvz4(Qb$', 'Michael LLC', 'Connortown', '02-620', '747 Lewis Ports Suite 509', 'ibradshaw@example.org', '+75285765903', '3009694e-fax.com', 'PL83205778286', '465090563'),
('CUS51175', '*)9!Yw', 'Simpson PLC', 'West Rodney', '49-755', '222 Alexander Plaza Apt. 884', 'rodriguezpatrick@example.org', '+10102425108', '538406e-fax.com', 'PL89697148080', '481754503'),
('CUS99603', '+^3u0Kk', 'Patton and Sons', 'Carlamouth', '54-212', '755 Williams Walks', 'megannguyen@example.net', '+54920709118', '871880e-fax.com', 'PL68383558159', '153187838'),
('CUS40360', 'O#6Pj', 'Mcdonald Group', 'Nelsonbury', '27-059', '6814 Rodriguez Road Apt. 198', 'bakerjesse@example.org', '+33761101497', '107864e-fax.com', 'PL56198606999', '241244253'),
('CUS72126', '7vgBQm#r**', 'Baker-Barker', 'Griffinhaven', '13-378', '0129 Susan Inlet Suite 217', 'jessica72@example.com', '+23597512894', '403521e-fax.com', 'PL09215520763', '309203751'),
('CUS78892', '&@7kFvc', 'Tucker, Johnson and Smith', 'Port Danielle', '11-068', '796 Morgan Union', 'duarteryan@example.org', '+68077504217', '463965e-fax.com', 'PL04002003758', '479221843'),
('CUS96563', '5i!4tPtkc', 'Davis Group', 'Herringborough', '71-415', '758 Kimberly Estates', 'kathysheppard@example.com', '+71949786500', '3195822e-fax.com', 'PL50223254496', '279800196'),
('CUS84887', '!5Yp', 'Hall, Parker and Ochoa', 'New Matthew', '75-267', '2028 Johnson Greens', 'nathanrice@example.net', '+07517002083', '516660e-fax.com', 'PL90243446508', '013616026'),
('CUS50422', '%F4oNn', 'Little, Watts and Bennett', 'East Paul', '22-854', '340 Smith Branch Suite 364', 'phelpsalicia@example.net', '+67927889847', '3119907e-fax.com', 'PL98427885380', '858975735');

INSERT INTO compositions(composition_id, name, description, price, minimum_quantity, stock) VALUES
('CMP72', 'Simply', 'Quite within candidate security.', 52.05, 7, 75),
('CMP44', 'Draw', 'Reflect course son.', 112.34, 5, 40),
('CMP68', 'Toward', 'Most clearly listen go very.', 51.47, 5, 87),
('CMP15', 'Fall', 'Customer act such upon.', 85.32, 9, 49),
('CMP12', 'Unit', 'Already half base money available.', 77.79, 10, 84),
('CMP16', 'Beautiful', 'Military ask card from son may.', 45.03, 1, 46),
('CMP98', 'Little', 'Television the wife war social radio.', 59.16, 5, 48),
('CMP70', 'History', 'Each business if child rich.', 114.3, 2, 6),
('CMP77', 'Want', 'Hard wear fish address.', 48.09, 6, 82),
('CMP37', 'Food', 'Music little dinner rise method.', 46.73, 5, 72),
('CMP42', 'Face', 'Money firm to thought religious.', 45.77, 4, 36),
('CMP03', 'Decision', 'Total in exactly.', 138.84, 7, 41),
('CMP32', 'Main', 'Environment laugh really.', 101.55, 1, 41),
('CMP45', 'Citizen', 'These assume receive without enough their.', 34.11, 3, 24),
('CMP26', 'Laugh', 'Five worry purpose way.', 66.46, 6, 69),
('CMP65', 'Security', 'Even care home wrong young.', 124.82, 7, 58),
('CMP48', 'Music', 'Data opportunity outside.', 86.38, 8, 63),
('CMP92', 'Mother', 'Son movie team boy.', 88.01, 1, 64),
('CMP99', 'Rise', 'Appear do send.', 36.19, 10, 64),
('CMP86', 'Mother', 'Music so my no tough.', 133.62, 2, 93);

INSERT INTO recipients(name, city, postal_code, address) VALUES
('Brennan and Sons', 'Jesusstad', '73-388', '412 Patel Isle'),
('Kim, Mendez and Allen', 'Davisville', '78-314', '80793 Julie Expressway'),
('Brown-Leonard', 'Charlesville', '36-213', '89869 Monica River'),
('Ortiz, Huffman and Tucker', 'Scottfort', '05-882', '7341 Charles Road'),
('Miller Group', 'Bentleyton', '00-437', '321 Webster Keys Suite 327'),
('Ward, Daniels and Wilson', 'Ronnieville', '24-401', '5374 Michelle Freeway Suite 663'),
('Castro, Robles and Vargas', 'Montgomerybury', '49-239', '3326 Darrell Heights'),
('Lane LLC', 'Cruzhaven', '96-823', '784 Torres Grove'),
('Pearson LLC', 'Kennethbury', '05-555', '7933 Christopher Overpass Apt. 510'),
('Alvarez, Krueger and Wiley', 'Shawnshire', '17-143', '63154 Michael Creek'),
('Cochran-Jackson', 'North Stuart', '22-804', '53157 Powers Extensions Suite 918'),
('Crawford Group', 'South Stevenbury', '67-586', '03110 Clark Extensions Apt. 784'),
('Jones PLC', 'Kirkborough', '81-191', '60486 Evans Burg'),
('Moreno, Weber and Ramos', 'West Nicole', '53-886', '0127 Sanchez Mews Apt. 483'),
('Brown, Pierce and Miller', 'Lake Trevor', '02-774', '33241 Powell Stream'),
('Evans-Vaughn', 'Samuelstad', '47-207', '7448 Santos Views Suite 424'),
('Murphy, Wells and Johnson', 'Riveraburgh', '82-152', '305 Michael Bypass Suite 353'),
('Mathews Ltd', 'East Ericside', '56-824', '92053 Karen Villages'),
('Ward Ltd', 'North Jonathan', '77-411', '260 Wendy Court'),
('Richardson Ltd', 'Adamview', '43-020', '8862 Monica Mill');

INSERT INTO orders(order_id, customer_id, recipient_id, composition_id, date, price, paid, notes) VALUES
(6609, 'CUS68267', 15, 'CMP37', '2024-11-07', 260.01, True, 'Fly probably hope what result project staff bad.'),
(492, 'CUS51175', 2, 'CMP92', '2024-01-29', 393.89, True, 'Pretty car improve child with moment these decide.'),
(3198, 'CUS72126', 18, 'CMP37', '2024-01-07', 572.83, False, 'Level keep act blue start budget.'),
(6169, 'CUS88853', 5, 'CMP48', '2023-12-18', 223.02, False, 'President wind until arrive center for scientist catch.'),
(6493, 'CUS68267', 10, 'CMP15', '2023-11-23', 258.86, False, 'Just exist build appear blood bit fact brother.'),
(8474, 'CUS40360', 14, 'CMP03', '2024-10-10', 618.97, False, 'Occur whose stop no language because as tax majority design.'),
(1489, 'CUS51175', 18, 'CMP03', '2024-01-06', 680.91, True, 'Customer size game travel cover still assume government across way leave along say.'),
(2380, 'CUS72126', 13, 'CMP86', '2024-09-19', 422.36, False, 'Nor my customer teacher this knowledge rate ball full Republican wear.'),
(7575, 'CUS88853', 4, 'CMP48', '2024-09-25', 379.41, False, 'Ground nor story ahead two age professor.'),
(5209, 'CUS78892', 15, 'CMP12', '2024-10-16', 704.19, False, 'Camera around assume interesting war today center behavior push view responsibility move apply.'),
(2935, 'CUS50422', 12, 'CMP86', '2024-01-06', 854.53, True, 'Traditional prevent middle practice stock clear parent season third seat large she those.'),
(7581, 'CUS96563', 12, 'CMP99', '2023-12-17', 755.66, True, 'West successful base as two like.'),
(7034, 'CUS88853', 3, 'CMP45', '2023-12-05', 230.08, True, 'Drop theory exist program least place sort.'),
(4402, 'CUS72126', 6, 'CMP77', '2024-04-01', 402.05, True, 'Quality rather arrive use letter argue style different how.'),
(655, 'CUS17436', 3, 'CMP65', '2024-08-22', 891.52, True, 'House investment wish thus stuff must.'),
(8813, 'CUS65877', 8, 'CMP26', '2024-09-22', 143.55, True, 'Less blood beautiful cause model executive government long yard work international positive yard.'),
(6584, 'CUS17436', 9, 'CMP16', '2024-09-24', 155.11, False, 'Receive pretty president through keep represent.'),
(1898, 'CUS96563', 17, 'CMP03', '2024-08-25', 497.25, True, 'Population also cause stage his common goal myself.'),
(6838, 'CUS78892', 20, 'CMP16', '2024-04-24', 27.49, True, 'May have about song front each.'),
(9870, 'CUS84887', 12, 'CMP99', '2023-11-25', 255.53, False, 'Wife best buy evening none specific color debate part career.');

INSERT INTO requirements(composition_id, quantity, price) VALUES
('CMP86', 98, 761.76),
('CMP99', 22, 290.37),
('CMP92', 32, 995.2),
('CMP48', 21, 703.78),
('CMP65', 48, 558.87),
('CMP26', 21, 439.75),
('CMP45', 30, 790.45),
('CMP32', 85, 554.3),
('CMP03', 7, 27.77),
('CMP42', 6, 371.68),
('CMP37', 73, 300.36),
('CMP77', 98, 811.0),
('CMP70', 63, 749.96),
('CMP98', 86, 947.57),
('CMP16', 33, 711.54),
('CMP12', 26, 112.57),
('CMP15', 85, 448.78),
('CMP68', 52, 132.37),
('CMP44', 97, 100.96),
('CMP72', 79, 163.28);