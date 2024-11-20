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



INSERT INTO customers VALUES 
('CUS04529', '$K3Qa%', 'Dominguez, Nelson and Lee', 'West Joshua', '54-337', '62037 Jordan Flat Suite 825', 'fturner@example.com', '+48113808741', '9730389e-fax.com', 'PL52631893680', '906962982'),    
('CUS79461', '*4ZLs', 'Perry, Arnold and Valdez', 'New Calebmouth', '29-400', '1082 Roberto Crossroad Suite 870', 'kristamills@example.com', '+57572943265', '0808112e-fax.com', 'PL56402630538', '277303904'),
('CUS96146', '#$4Ea', 'Massey, Nichols and Foster', 'Port Brittanychester', '80-142', '769 Griffin Burgs', 'ryandavis@example.org', '+39898271776', '582665e-fax.com', 'PL37940266696', '066284073'),    
('CUS54389', '^6Odwmo6', 'Melton, Collins and Sims', 'Port Christopherhaven', '56-196', '23731 Gonzales Knolls Apt. 104', 'johnsoncarolyn@example.net', '+38714077161', '9774052e-fax.com', 'PL04427156721', '972557260'),
('CUS56158', '@l26Xay', 'Mckenzie-Harper', 'North Kathryn', '70-839', '933 Douglas Locks Suite 634', 'grantwilliam@example.org', '+74177088353', '5981891e-fax.com', 'PL44153144583', '026223130'),      
('CUS21984', 'J)2Zag', 'Edwards and Sons', 'Amytown', '12-402', '1556 Lori Mall', 'kimrogers@example.net', '+75891839432', '5616856e-fax.com', 'PL40867130705', '003689386'),
('CUS95624', '(0Tp', 'Lambert, Malone and Garcia', 'Emilybury', '59-755', '3988 Luis Plaza Suite 590', 'johnfisher@example.net', '+89794887145', '6357703e-fax.com', 'PL19641311703', '741187655'),      
('CUS54759', 'c2bY1Spn_', 'Ingram-David', 'Youngtown', '38-769', '260 Christopher Ways', 'rachelbaker@example.org', '+83840304809', '646066e-fax.com', 'PL77317424882', '467965267'),
('CUS15075', '#7@Dd', 'Carter-Jackson', 'Lake Davidstad', '12-586', '73713 Gabriel Land', 'stewarteric@example.net', '+92091637879', '0115044e-fax.com', 'PL57201246955', '319818789'),
('CUS35893', '$m3My', 'Ruiz, Alexander and Herrera', 'Jameshaven', '54-122', '596 Donna Oval', 'suarezsheila@example.com', '+12429548217', '908043e-fax.com', 'PL13892698316', '400389012'),
('CUS52424', 'J@6M9ITt', 'Murphy Inc', 'Timothychester', '36-261', '901 Cindy Radial', 'umanning@example.com', '+65387826448', '743891e-fax.com', 'PL91630916740', '366338993'),
('CUS53563', '%3C0Fv', 'Gonzalez-Roberts', 'Lake Robert', '93-171', '783 Mack Forks Suite 839', 'jennifer96@example.org', '+56513349479', '4799787e-fax.com', 'PL84478805320', '482355157'),
('CUS23279', '(!3jXAm*^4', 'Osborn-West', 'Ryanburgh', '89-476', '0662 Villarreal Motorway', 'kimberly67@example.org', '+10551062950', '741690e-fax.com', 'PL05587892275', '413093881'),
('CUS42993', 'DUf#9Rcc', 'Brewer LLC', 'Port Karenhaven', '35-582', '9274 Anne Trafficway', 'andrea63@example.net', '+17879069222', '475570e-fax.com', 'PL36796351764', '976612744'),
('CUS59133', 'e)3*1LwhG&', 'Choi, Gutierrez and Robertson', 'North Susan', '58-840', '961 Paul Knoll', 'matthewbrown@example.net', '+69126546673', '397767e-fax.com', 'PL51287727352', '438368475'),     
('CUS40071', '@E(YhsQj2', 'Richardson-Jacobson', 'South Jeffrey', '40-022', '47687 Strong View Apt. 467', 'millercraig@example.org', '+63321414603', '634942e-fax.com', 'PL66856410981', '022689088'),   
('CUS70123', '!1KgULZj', 'Lee-Booker', 'Nguyentown', '42-416', '16716 Shelia Grove Suite 530', 'sanfordkyle@example.org', '+29642620875', '917909e-fax.com', 'PL67856419668', '718731906'),
('CUS25801', '!0vW)xgI', 'Gates, Carroll and Gardner', 'Harrisonhaven', '86-441', '483 Jeffrey Fort Apt. 901', 'johnsolomon@example.net', '+54686180294', '713215e-fax.com', 'PL22736889621', '182490511'),
('CUS02301', 'X#h33t#rFT', 'Robertson, Strickland and Williams', 'Hunterborough', '24-843', '16608 Michael Rapid Apt. 607', 'garciatimothy@example.com', '+96567169286', '059724e-fax.com', 'PL91132258355', '177785277'),
('CUS59037', '(06Xh', 'Brock, Mcdonald and English', 'Morrisonshire', '54-015', '220 Sierra Crest Apt. 264', 'gmichael@example.net', '+30205976611', '8065101e-fax.com', 'PL69750121351', '127996085');

INSERT INTO compositions VALUES
('CMP14', 'Newspaper', 'Senior performance sign remember.', 86.39, 6, 9),
('CMP09', 'Left', 'His above great service.', 136.98, 3, 2),
('CMP78', 'Former', 'Manage think article political business.', 86.7, 2, 88),
('CMP40', 'Put', 'Prepare wall often movement become personal.', 126.07, 4, 46),
('CMP53', 'Skill', 'Free if subject.', 63.97, 9, 2),
('CMP63', 'Front', 'That store former serve.', 95.91, 1, 69),
('CMP60', 'Whole', 'Both true bag despite general bag.', 145.19, 3, 24),
('CMP21', 'Majority', 'Early his wear group church.', 129.2, 1, 57),
('CMP49', 'Focus', 'Fast exactly light model third.', 80.87, 8, 21),
('CMP35', 'Media', 'Win with speech always.', 32.12, 5, 12),
('CMP52', 'Decision', 'Product history new pull successful.', 96.14, 4, 67),
('CMP02', 'Evening', 'Not dog raise key sign.', 36.08, 5, 52),
('CMP65', 'Sister', 'Role you control.', 107.39, 8, 13),
('CMP00', 'First', 'Chair certain be argue.', 28.78, 10, 11),
('CMP59', 'Add', 'Along charge service local.', 140.85, 10, 26),
('CMP27', 'We', 'Public purpose mention large.', 134.39, 7, 48),
('CMP16', 'Again', 'Boy situation scientist.', 134.42, 7, 70),
('CMP34', 'Course', 'Owner young our government know sell.', 51.76, 2, 95),
('CMP08', 'Process', 'Sign society fine mother kid.', 104.83, 9, 33),
('CMP18', 'Effort', 'Not sure send international same what.', 108.61, 9, 13);

INSERT INTO recipients(name, city, postal_code, address) VALUES
('Grimes-Thompson', 'West Jared', '43-201', '10866 Jennifer Glen Suite 838'),
('Mcdowell, Donaldson and White', 'East Kaylee', '66-988', '2239 James Knoll'),
('Shelton-Wagner', 'North Jessicaborough', '68-172', '405 Billy Knoll'),
('Walker-Owens', 'Wardbury', '35-543', '719 Moore Drives'),
('Jones-Price', 'East Crystal', '32-722', '0349 Collins Freeway Suite 230'),
('Hart-Mcguire', 'New Susan', '89-019', '274 Lauren Garden Apt. 549'),
('Davis PLC', 'Harrisonstad', '94-492', '6916 Matthew Parkways'),
('Long LLC', 'Amandatown', '91-208', '137 James Highway Suite 850'),
('Wallace-Conway', 'North Andrewchester', '89-245', '1728 Janet Ranch Suite 999'),
('Taylor, Richard and Morgan', 'South Terri', '20-140', '54244 Shawn Gardens'),
('Johnson Inc', 'South Cindyport', '57-891', '5732 Riddle Track Suite 084'),
('Jackson-Mendoza', 'West Ryan', '14-367', '663 Melissa Underpass Suite 463'),
('Gonzalez Inc', 'Joshuachester', '57-844', '8069 Gregory Via Suite 351'),
('Brown PLC', 'Lake Richardtown', '77-242', '20807 Hogan Radial'),
('Young, French and Wheeler', 'Lake Nicolasshire', '77-226', '48834 Skinner Pass Apt. 411'),
('Blanchard, Washington and Buchanan', 'Kathyport', '50-242', '4861 Cross Expressway Suite 680'),
('Lewis PLC', 'Port Victoria', '67-165', '124 Scott Parks'),
('Mckinney, Johnson and Wong', 'Eileenland', '66-589', '28900 Alexander Gateway Suite 532'),
('Ho Group', 'Cristianfurt', '25-970', '819 Toni Summit'),
('Ramirez and Sons', 'North Sherryburgh', '86-186', '625 Mark Loaf Suite 064');

INSERT INTO orders VALUES
(9549, 'CUS15075', 7, 'CMP16', '2024-04-22', 979.82, True, 'Heavy friend meet old young history research seem around reach special weight.'),
(2877, 'CUS42993', 14, 'CMP27', '2024-03-16', 304.8, True, 'Foreign south rise but forward form.'),
(3243, 'CUS95624', 9, 'CMP09', '2024-06-07', 560.87, True, 'Small might sing program simple any social try read price.'),
(1671, 'CUS52424', 4, 'CMP59', '2024-12-04', 393.88, False, 'Analysis huge street change direction apply commercial style say forget skin voice already.'),
(3126, 'CUS15075', 5, 'CMP65', '2024-05-23', 528.08, True, 'End forget defense director against cultural sister personal often thank list.'),
(5595, 'CUS35893', 1, 'CMP60', '2024-02-01', 221.41, False, 'Concern group produce evening west bag tonight.'),
(7545, 'CUS59133', 5, 'CMP27', '2024-05-11', 835.97, False, 'Million school plan charge play report oil keep me wall current fire.'),
(9487, 'CUS54759', 6, 'CMP49', '2024-11-19', 207.17, True, 'Social body citizen my ever choice allow pull history never.'),
(6205, 'CUS04529', 8, 'CMP49', '2024-01-04', 410.72, True, 'Much with not agent task PM fall.'),
(4308, 'CUS56158', 11, 'CMP65', '2024-01-27', 199.31, True, 'Keep receive dinner reason summer season.'),
(759, 'CUS42993', 6, 'CMP00', '2024-02-13', 679.25, True, 'If receive line activity seek personal teach budget figure.'),
(703, 'CUS52424', 6, 'CMP21', '2024-05-02', 138.33, False, 'Congress look social society Mrs thought staff test.'),
(3074, 'CUS79461', 20, 'CMP78', '2024-03-13', 393.52, True, 'Foreign modern sense room and wish simple court out.'),
(4585, 'CUS95624', 9, 'CMP18', '2024-04-23', 861.57, False, 'Top myself personal black bring serve.'),
(5986, 'CUS25801', 18, 'CMP16', '2024-03-18', 366.65, True, 'Machine school nor speech manage production accept.'),
(5148, 'CUS23279', 1, 'CMP53', '2024-06-03', 825.71, False, 'Special top evidence government nice now development outside attorney read.'),
(1459, 'CUS25801', 18, 'CMP02', '2024-07-27', 200.78, True, 'Idea pretty consider affect moment speech knowledge go hard score five church.'),
(1603, 'CUS42993', 17, 'CMP18', '2024-08-21', 503.9, False, 'Worker however politics mother success particularly phone here finish something real.'),
(6909, 'CUS54759', 17, 'CMP49', '2024-01-16', 600.68, False, 'Race talk almost money civil coach better feeling score under.'),
(6663, 'CUS70123', 2, 'CMP08', '2024-06-10', 349.18, True, 'Enjoy economy significant campaign even old pressure carry brother culture cell show.');

INSERT INTO requirements VALUES
('CMP63', 49, 815.73),
('CMP02', 90, 849.48),
('CMP08', 62, 940.67),
('CMP52', 80, 593.0),
('CMP60', 65, 186.35),
('CMP63', 66, 488.96),
('CMP00', 100, 898.85),
('CMP21', 22, 566.31),
('CMP27', 62, 287.12),
('CMP52', 24, 316.39),
('CMP09', 52, 929.9),
('CMP40', 78, 890.06),
('CMP08', 56, 943.01),
('CMP18', 56, 994.84),
('CMP14', 57, 701.76),
('CMP53', 69, 788.05),
('CMP40', 63, 299.91),
('CMP35', 68, 33.74),
('CMP63', 30, 673.71),
('CMP40', 20, 301.65);