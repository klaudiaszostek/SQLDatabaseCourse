BEGIN;


SELECT 'CREATING DATABASE STRUCTURE' as 'INFO';



CREATE TABLE `cukierki` (

  `IDCukierka` CHAR(3) PRIMARY KEY,

  `Nazwa` VARCHAR(30) NOT NULL,

  `Smak` VARCHAR(15) default NULL,

  `Nadzienie` VARCHAR(30) default NULL,

  `Barwniki` VARCHAR(40) default NULL,

  `Opis` VARCHAR(150) default NULL,

  `Koszt` NUMERIC(7,2) NOT NULL,

  `Masa` INTEGER NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;



CREATE TABLE `pudelka` (

  `IDPudelka` CHAR(4) PRIMARY KEY,

  `Nazwa` VARCHAR(40) NOT NULL,

  `Opis` VARCHAR(150),

  `Cena` NUMERIC(7,2) NOT NULL,

  `Stan` INTEGER NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `zawartosc` (

  `IDPudelka` CHAR(4) NOT NULL,

  `IDCukierka` CHAR(3) NOT NULL,

  `Sztuk` INTEGER NOT NULL,

  PRIMARY KEY (`IDPudelka`, `IDCukierka`),

  FOREIGN KEY (`IDPudelka`) REFERENCES `pudelka`(`IDPudelka`),

  FOREIGN KEY (`IDCukierka`) REFERENCES `cukierki`(`IDCukierka`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `klienci` (

  `IDKlienta` INTEGER PRIMARY KEY,

  `Nazwa` VARCHAR(40) NOT NULL,

  `Ulica` VARCHAR(50) NOT NULL,

  `Miejscowosc` VARCHAR(30) NOT NULL,

  `Kod` VARCHAR(10) NOT NULL,

  `Kraj` VARCHAR(15) NOT NULL,

  `Telefon` VARCHAR(15) default NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `zamowienia` (

  `IDZamowienia` INTEGER PRIMARY KEY,

  `IDKlienta` INTEGER NOT NULL,

  `DataRealizacji` DATE NOT NULL,

  FOREIGN KEY (`IDKlienta`) REFERENCES `klienci`(`IDKlienta`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `artykuly` (

  `IDZamowienia` INTEGER NOT NULL,

  `IDPudelka` CHAR(4) NOT NULL,

  `Sztuk` INTEGER NOT NULL,

  PRIMARY KEY (`IDZamowienia`, `IDPudelka`),

  FOREIGN KEY (`IDZamowienia`) REFERENCES `zamowienia`(`IDZamowienia`),

  FOREIGN KEY (`IDPudelka`) REFERENCES `zawartosc`(`IDPudelka`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;



SELECT 'LOADING cukierki' as 'INFO';

INSERT INTO `cukierki` (`IDCukierka`,`Nazwa`,`Smak`,`Nadzienie`,`Barwniki`,`Opis`,`Koszt`,`Masa`) VALUES

("C01","Cukierek malina","malinowy","","brazowy, zielony","Ręcznie robione cukierki o smaku malinowym.",0.76, 19),

("C02","Cukierek ananas","ananasowy","migdal","czarny","Ręcznie robione cukierki o smaku ananasowym.",0.73,10),

("C03","Cukierek jezyna","lesny","","pomaranczowy, brazowy, niebieski","Ręcznie robione cukierki o smaku jeżynowym.",0.85,23),

("C04","Cukierek gruszka","gruszka","","pomaranczowy, zielony","Ręcznie robione cukierki o smaku gruszkowym.",0.22,30),

("C05","Cukierek mango","mango","","czarny","Ręcznie robione cukierki o smaku mango.",0.17,12),

("C06","Cukierek jablko","jablko","","brazowy, czerwony, zolty","Ręcznie robione cukierki o smaku jabłkowym.",0.22,22),

("C07","Cukierek jagoda","lesny","","czarny, czerwony, zolty","Ręcznie robione cukierki o smaku jagodowym.",0.56,14),

("C08","Cukierek cytryna","cytrynowy","cytrynowa galaretka","","Ręcznie robione cukierki o smaku cytrynowym.",0.31,16),

("C09","Cukierek pomarancza","pomaranczowy","pomaranczowa galaretka","","Ręcznie robione cukierki o smaku pomarańczowym.",0.78,13),

("C10","Cukierek lukrecja","lukrecja","","","Ręcznie robione cukierki o smaku lukrecji.",0.49,13),

("C11","Cukierek migdal","czekoladowy","","niebieski, zolty","Ręcznie robione cukierki o smaku migdałowym.",0.45,12),

("C12","Cukierek czekolada mleczna","czekoladowy","","","Ręcznie robione cukierki o smaku czekolady mlecznej.",0.23,28),

("C13","Cukierek czekolada biala","czekoladowy","","czarny, zielony","Ręcznie robione cukierki o smaku czekolady białej.",0.52,14),

("C14","Cukierek czekolada gorzka","czekoladowy","","czerwony, zielony","Ręcznie robione cukierki o smaku czekolady gorzkiej.",0.93,25),

("C15","Cukierek wisnia","wisniowy","","zielony","Ręcznie robione cukierki o smaku wisniowym.",0.13,17),

("L16","Lizak malina","malinowy","","","Ręcznie robione lizaki o smaku malinowym.",0.20,30),

("L17","Lizak lukrecja","lukrecja","","brazowy, zielony","Ręcznie robione lizaki o smaku lukrecji.",0.3,16),

("L18","Lizak multiwitamina","owocowy","","zolty","Ręcznie robione lizaki o smaku wieloowocowym.",1.00,30),

("L19","Lizak marcepan","marcepanowy","","brazowy, pomaranczowy, zolty","Ręcznie robione lizaki o smaku marcepanowym.",0.32,10),

("L20","Lizak mango","mango","","czerwony","Ręcznie robione lizaki o smaku mango.",0.97,12),

("L21","Lizak wisnia","wisnia","","zolty, niebieski, zielony","Ręcznie robione lizaki o smaku wisniowym.",0.93,21),

("L22","Lizak cytryna","cytrynowy","","","Ręcznie robione lizaki o smaku cytrynowym.",0.77,20),

("L23","Lizak malina","malinowy","","","Ręcznie robione lizaki o smaku malinowym.",0.82,14),

("L24","Lizak lesny","lesny","","zielony, niebieski","Ręcznie robione lizaki o smaku poszycia leśnego.",0.28,11),

("L25","Lizak ananas","ananasowy","","czerwony, brazowy, pomaranczowy","Ręcznie robione lizaki o smaku ananasowym.",0.93,28),

("L26","Lizak truskawka","truskawkowy","","","Ręcznie robione lizaki o smaku truskawkowym.",0.37,10),

("L27","Lizak pomarancza","pomaranczowy","","pomaranczowy, zolty, zielony","Ręcznie robione lizaki o smaku pomarańczowym",0.85,18),

("L28","Lizak choinka","owocowy","","brazowy, zielony, zolty","Ręcznie robione lizaki o kształcie i smaku choinki zapachowej z opla.",0.60,10),

("L29","Lizak kwiatek","owocowy","guma do żucia","zielony","Ręcznie robione lizaki o kształcie kwiatka i smaku owocowym.",0.94,21),

("L30","Lizak poziomka","truskawkowy","","czarny, zielony, brazowy","Ręcznie robione lizaki o smaku poziomkowym.",0.93,11),

("P31","Pianka owocowa","owocowy","","czerwony, zielony, brazowy","Wielokolorowe pianki obsypane kolorowym cukrem o smaku wieloowocowym.",0.15,25),

("P32","Pianka brzoskwinia","owocowy","","niebieski, zolty","Pomarańczowe pianki obsypane kolorowym cukrem o smaku brzoskwiniowym.",0.09,12),

("P33","Pianka banan","owocowy","","zolty, czerwony","Żółte pianki obsypane kolorowym cukrem o smaku bananowym.",0.88,24),

("P34","Pianka jagoda","jagodowy","","zielony, pomaranczowy","Niebieskie pianki obsypane kolorowym cukrem o smaku owoców leśnych.",0.93,19),

("P35","Pianka cytryna","cytrynowy","","zolty, brazowy, niebieski","Żółte pianki obsypane kolorowym cukrem o smaku cytrynowym.",0.79,19),

("P36","Pianka mieszana","owocowy","","","Wielokolorowa pianki obsypane kolorowym cukrem o smaku owocowym.",0.65,19),

("P37","Pianka lesna","jagodowy","","pomaranczowy, czerwony","Niebieskie pianki obsypane kolorowym cukrem o smaku jagodowym.",0.20,15),

("P38","Pianka wisnia","wisnia","","zielony, niebieski","Czerwone pianki obsypane kolorowym cukrem o smaku wiśniowym.",0.73,27),

("P39","Pianka poziomka","truskawkowy","","zolty, zielony","Różowe pianki obsypane kolorowym cukrem o smaku poziomkowym.",0.64,18),

("P40","Pianka czekolada gorzka","czekoladowy","","niebieski, czerwony","Brązowe pianki o smaku gorzkiej czekolady.",0.49,23),

("P41","Pianka zelowa","truskawkowy","","","Żelowe, sprężyste pianki o smaku owocowym.",0.23,19),

("P42","Pianka truskawka","truskawkowy","pianka truskawkowa","zolty, czerwony, niebieski","Czerwone pianki obsypane kolorowym cukrem o smaku truskawkowym.",0.54,30),

("P43","Pianka czekolada mleczna","czekoladowy","","","Brązowe pianki o smaku mlecznej czekolady.",0.97,27),

("P44","Pianka gruszka","gruszka","","","Zielone pianki obsypane kolorowym cukrem o smaku gruszkowym.",0.13,15),

("P45","Pianka jablko","jablkowy","","czerwony","Zielono-czerwone pianki obsypane kolorowym cukrem o smaku jabłkowym.",0.25,15);



SELECT 'LOADING pudelka' as 'INFO';

INSERT INTO `pudelka` (`IDPudelka`,`Nazwa`,`Opis`,`Cena`,`Stan`) VALUES

("ALLC","Mieszanka cukierkow","xxx",49.90,15),

("ALLL","Przeglad lizakow","xxx",49.90,12),

("ALLP","Mieszanka pianek","xxx",49.90,0),

("FORC","Lesne cukierkow","xxx",34.49,100),

("CZEC","Czekoladowe melodie","xxx",39.49,100),

("OGNP","Pianki ogniskowe","xxx",50.49,150),

("ZSAL","Zestaw lizakow","xxx",50.99,10),

("BUKL","Bukiet lizakowy","xxx",19.99,8),

("CHOL","Lizaki swiateczne","xxx",19.99,27),

("CZEP","Pianki czekoladowe","xxx",27.19,1),

("MSAM","Mieszanka slodyczowa A","xxx",49.99,32),

("MSBM","Mieszanka slodyczowa B","xxx",49.99,41),

("MSCM","Mieszanka slodyczowa C","xxx",49.99,17),

("SLOM","Słodycze sloneczne","xxx",60.00,41),

("NJLM","Najlepszy wybor","xxx",70.00,84);



SELECT 'LOADING zawartosc' as 'INFO';

INSERT INTO `zawartosc` (`IDPudelka`,`IDCukierka`,`Sztuk`) VALUES

("ALLC","C01",2),("ALLC","C02",2),("ALLC","C03",2),("ALLC","C04",2),("ALLC","C05",2),("ALLC","C06",2),("ALLC","C07",2),("ALLC","C08",2),("ALLC","C09",2),("ALLC","C10",2),("ALLC","C11",2),("ALLC","C12",2),

("ALLC","C13",2),("ALLC","C14",2),("ALLC","C15",2),("ALLL","L16",1),("ALLL","L17",1),("ALLL","L18",1),("ALLL","L19",1),("ALLL","L20",1),("ALLL","L21",1),("ALLL","L22",1),("ALLL","L23",1),("ALLL","L24",1),

("ALLL","L25",1),("ALLL","L26",1),("ALLL","L27",1),("ALLL","L28",1),("ALLL","L29",1),("ALLL","L30",1),("ALLP","P31",2),("ALLP","P32",2),("ALLP","P33",2),("ALLP","P34",2),("ALLP","P35",2),("ALLP","P36",2),

("ALLP","P37",2),("ALLP","P38",2),("ALLP","P39",2),("ALLP","P40",2),("ALLP","P41",2),("ALLP","P42",2),("ALLP","P43",2),("ALLP","P44",2),("ALLP","P45",2),("FORC","C01",10),("FORC","C03",10),("FORC","C07",10),

("FORC","C15",10),("CZEC","C10",15),("CZEC","C12",15),("CZEC","C13",15),("CZEC","C14",15),("OGNP","P31",5),("OGNP","P34",5),("OGNP","P36",5),("OGNP","P37",5),("ZSAL","L16",8),("ZSAL","L21",8),("ZSAL","L23",8),

("ZSAL","L26",8),("ZSAL","L27",8),("ZSAL","L30",8),("BUKL","L29",15),("CHOL","L28",15),("CZEP","P40",25),("CZEP","P43",25),("MSAM","C01",5),("MSAM","C02",5),("MSAM","C03",5),("MSAM","C04",5),("MSAM","C05",5),

("MSAM","L16",5),("MSAM","L19",5),("MSAM","P31",5),("MSAM","P32",5),("MSAM","P33",5),("MSBM","C06",5),("MSBM","C07",5),("MSBM","C08",5),("MSBM","C09",5),("MSBM","C10",5),("MSBM","L21",5),("MSBM","L24",5),

("MSBM","P34",5),("MSBM","P35",5),("MSBM","P36",5),("MSCM","C11",5),("MSCM","C12",5),("MSCM","C13",5),("MSCM","C14",5),("MSCM","C15",5),("MSCM","L27",5),("MSCM","L30",5),("MSCM","P37",5),("MSCM","P38",5),

("MSCM","P39",5),("SLOM","C02",5),("SLOM","C08",5),("SLOM","C09",5),("SLOM","L22",1),("SLOM","L25",1),("SLOM","L27",1),("SLOM","L29",1),("SLOM","P33",8),("SLOM","P35",8),("NJLM","C01",5),("NJLM","C03",5),

("NJLM","C09",5),("NJLM","C15",5),("NJLM","L16",2),("NJLM","L26",2),("NJLM","L30",2),("NJLM","P31",10),("NJLM","P33",10),("NJLM","P36",10),("NJLM","P39",10),("NJLM","P42",10);



SELECT 'LOADING klienci' as 'INFO';

INSERT INTO `klienci` (`IDKlienta`,`Nazwa`,`Ulica`,`Miejscowosc`,`Kod`,`Kraj`,`Telefon`) VALUES

(1,"Stewart G. Burch","404-667 Molestie Av.","Güssing","5198","Austria","08247 878106"),(2,"Ori Porter","Ap #104-248 Sit St.","Scalloway","RP68 5VM","United Kingdom","00368 894925"),(3,"Eagan Ewing","Ap #528-8172 Consequat, Road","Schweinfurt","80924","Germany","06697 133034"),(4,"Simone C. Pinna","Ap #947-1250 Maecenas Avenue","Montemesola","07879","Italy","00804 973812"),(5,"Janna P. Harrison","P.O. Box 474, 9226 Ornare, St.","Rum","9882","Austria","02085 357838"),(6,"Dara Strong","891-4758 Purus, Avenue","Donosti","34150","Spain","08033 074846"),(7,"Stacy Nixon","P.O. Box 984, 1181 Quis Rd.","Elmshorn","87441","Germany","04339 859962"),(8,"Frances L. Gilliam","Ap #224-1436 Eleifend. Av.","St. Veit an der Glan","6048","Austria","06508 545603"),(9,"Nathaniel Jacobs","8991 Quis Av.","Cartagena","72701","Spain","03669 231921"),(10,"Beck Green","Ap #230-3260 Ligula Avenue","Taunusstein","71569","Germany","03634 500758"),

(11,"Lila Holman","9179 In Rd.","Bungay","T80 8CJ","United Kingdom","07054 916153"),(12,"Yanis U. Caron","Ap #290-9026 Sed Av.","Dieppe","18209","France","03398 186776"),(13,"Wyatt R. Hancock","P.O. Box 361, 4350 Metus Avenue","Großpetersdorf","3055","Austria","08358 827512"),(14,"Vaughan Bush","8039 Id, Rd.","Cork","","Ireland","08974 656850"),(15,"Armando Z. Colombo","P.O. Box 505, 7934 Ornare, Rd.","Riparbella","86260","Italy","03027 894788"),(16,"Portia D. Giles","276-7488 Porttitor Avenue","Galway","","Ireland","04951 449497"),(17,"Rinah Larson","4995 Et Avenue","Kraków","98-004","Poland","01624 790346"),(18,"Mohamed K. Gaillard","597-3520 Tellus Ave","Strasbourg","86504","France","07705 626240"),(19,"Dominique Jacobson","7991 Luctus St.","Kielce","25-232","Poland","06205 037170"),(20,"Vivian A. Yates","6616 Orci Road","Lockerbie","WI4U 0ZT","United Kingdom","08736 887282"),

(21,"Brenna K. Harper","108 Nisl Street","Przemyśl","52-298","Poland","02610 716800"),(22,"Jolie Conner","Ap #872-3950 Congue. Street","Cork","","Ireland","05166 453058"),(23,"Jada Morse","P.O. Box 860, 8690 Id Street","Warszawa","77-579","Poland","00293 486992"),(24,"Keaton Q. Wood","3206 Lacinia St.","Oviedo","80681","Spain","04831 719112"),(25,"Penelope Miller","P.O. Box 401, 2206 Et Road","Ludlow","C82 3MK","United Kingdom","03347 857672"),(26,"Urielle B. Stout","479-7348 Auctor St.","Chepstow","VF75 2ML","United Kingdom","01749 335237"),(27,"Josephine Leon","P.O. Box 149, 5409 Vel, Ave","Szczecin","13-324","Poland","04888 053841"),(28,"Katelyn U. Todd","6892 Sem, St.","Badajoz","62875","Spain","07852 527689"),(29,"Lesley Hall","Ap #473-2106 Donec Road","Warszawa","11-738","Poland","01835 470878"),(30,"Henry B. Conway","P.O. Box 749, 2224 Donec St.","Ostrowiec Świętokrzyski","20-242","Poland","02355 244490"),

(31,"Ivory Farley","614-1361 Mauris Road","Koszalin","43-221","Poland","04046 306362"),(32,"Ralph G. Wilson","4719 Nibh Avenue","Belfast","","Ireland","07107 732875"),(33,"Christopher F. Tyler","P.O. Box 418, 6208 Rhoncus. Av.","Koszalin","00-883","Poland","09376 634476"),(34,"Mohamed Charpentier","948-1683 Tempor St.","Le Puy-en-Velay","78954","France","03764 751341"),(35,"Upton K. Sullivan","P.O. Box 160, 3405 Facilisis, Rd.","Dornbirn","5288","Austria","01786 481874"),(36,"Rachel Marks","6504 Libero Road","Winchester","N1H 9RK","United Kingdom","05911 724062"),(37,"Karleigh Nguyen","P.O. Box 688, 8194 Sociosqu Rd.","Melilla","24817","Spain","04466 143207"),(38,"Silas Zimmerman","P.O. Box 890, 8313 Auctor, St.","Bischofshofen","6422","Austria","00273 765908"),(39,"Quynn W. Lindsay","P.O. Box 745, 6043 Fusce Street","Las Palmas","71369","Spain","01217 965963"),(40,"Aladdin Holcomb","537-7483 Aliquam Road","Hoyerswerda","73527","Germany","06704 841581"),

(41,"Garrison Mullins","147-3787 Porttitor Av.","Ciudad Real","75188","Spain","07770 037411"),(42,"Tamara M. Rollins","7667 Eget Street","Pabianice","46-439","Poland","03534 386367"),(43,"Fredericka Rodriguez","Ap #634-2891 Dolor Rd.","Belfast","","Ireland","00840 195838"),(44,"Jamal M. Warner","P.O. Box 251, 3473 Senectus Street","Cork","","Ireland","05264 756767"),(45,"Dara Donaldson","4477 Pellentesque Avenue","Warszawa","98-132","Poland","05300 578224"),(46,"Karly S. Middleton","319-7241 Nullam Avenue","Louth","MO97 2BU","United Kingdom","02430 329923"),(47,"Shaeleigh Lawson","P.O. Box 943, 6360 Nisl Rd.","Pabianice","04-264","Poland","03638 071120"),(48,"Elvis Buckley","P.O. Box 418, 664 Arcu St.","Zeitz","83318","Germany","06043 589164"),(49,"Lacy Freeman","P.O. Box 703, 1827 Est, Rd.","Piła","14-402","Poland","00985 273319"),(50,"Leonard Sullivan","Ap #657-3443 Elementum Rd.","Lustenau","2585","Austria","08911 106386"),

(51,"Kyla R. Cortez","Ap #542-7291 Quam Rd.","Konin","28-367","Poland","09176 450667"),(52,"Conan Colon","4727 Sem, Rd.","Laakirchen","1719","Austria","05333 493089"),(53,"Valentine Marchand","569-8786 Non, St.","Béthune","03535","France","06023 652093"),(54,"Jacob Mclean","4114 Ipsum St.","Elbląg","43-739","Poland","09456 344643"),(55,"Pauline Joly","264 Auctor Avenue","Le Petit-Quevilly","09670","France","09941 500702"),(56,"Beatrice R. Maldonado","3936 Semper Av.","Cork","","Ireland","06255 892719"),(57,"Mia Bright","P.O. Box 730, 3814 Lorem St.","Murcia","92109","Spain","02595 819054"),(58,"Thomas F. Klein","286 At, Ave","Sete","39496","France","00255 777118"),(59,"Wynter N. Brock","447-613 Cubilia Rd.","Granada","73534","Spain","07581 069008"),(60,"Wanda Mullen","P.O. Box 852, 4665 Elementum, St.","Tarragona","75548","Spain","02510 770680"),

(61,"Margot Q. Bernard","326-1516 Eu, Rd.","Compiegne","76461","France","05153 473751"),(62,"Venus Knox","Ap #630-1538 Tellus Road","Cork","","Ireland","08416 205240"),(63,"Georgia N. Porter","7834 Accumsan Avenue","Stalowa Wola","86-653","Poland","09674 651674"),(64,"Odysseus Riley","P.O. Box 520, 2756 Suscipit Rd.","Belfast","","Ireland","03383 162140"),(65,"Libby C. Gardner","P.O. Box 776, 6717 Magnis Rd.","Vienna","1980","Austria","01892 140437"),(66,"Anthony N. Lopez","9333 Eget St.","Châlons-en-Champagne","63050","France","07837 483306"),(67,"Reece Berg","P.O. Box 236, 1349 Sem St.","Kędzierzyn-Koźle","06-667","Poland","01620 896403"),(68,"Vielka I. Gillespie","Ap #506-2371 Taciti Road","Pabianice","36-079","Poland","03899 998961"),(69,"MacKensie Gilmore","5907 Vestibulum Rd.","St. Andrews","G9 3BU","United Kingdom","05259 249105"),(70,"Austin Pena","Ap #650-7589 Sed Street","Milnathort","F5G 6ZR","United Kingdom","02999 826292"),

(71,"Evangeline R. Hancock","1939 Ac St.","Zeitz","35468","Germany","05766 140136"),(72,"Zacharis Daniel","105-4344 Mattis. Ave","Asnieres-sur-Seine","11403","France","04420 777304"),(73,"Roméo A. Denis","967-6269 Ornare, Road","Saint-Étienne-du-Rouvray","84464","France","09322 076508"),(74,"Noë S. Pasquier","7897 Non, Rd.","Évreux","13848","France","05985 286631"),(75,"Medge J. Baird","164 Morbi St.","Bydgoszcz","62-490","Poland","05451 999367"),(76,"Josiah N. Gaines","Ap #106-1606 Massa. Street","Gijón","04672","Spain","08715 349645"),(77,"Ocean Gould","Ap #828-874 Aliquam Rd.","Dublin","","Ireland","01147 852025"),(78,"Skyler Slater","1149 Sodales Avenue","Schwechat","5604","Austria","06048 718514"),(79,"Marine I. Baron","740-5546 Auctor Av.","Limoges","08409","France","05563 626227"),(80,"Cassandra Warren","Ap #514-685 Nibh. Rd.","Ramsey","O7 0WR","United Kingdom","07584 486604");



SELECT 'LOADING zamowienia' as 'INFO';

INSERT INTO `zamowienia` (`IDZamowienia`,`IDKlienta`,`DataRealizacji`) VALUES

(1,79,"2016-10-17"),(2,27,"2016-05-13"),(3,17,"2017-01-25"),(4,43,"2016-11-25"),(5,17,"2016-04-10"),(6,49,"2016-08-31"),(7,28,"2017-02-13"),(8,7,"2017-02-26"),(9,43,"2016-04-30"),(10,2,"2017-02-24"),

(11,1,"2017-02-04"),(12,76,"2016-09-20"),(13,27,"2017-01-23"),(14,19,"2016-12-16"),(15,79,"2016-03-23"),(16,76,"2017-02-28"),(17,56,"2016-04-03"),(18,63,"2016-01-19"),(19,51,"2016-03-16"),(20,40,"2017-02-25"),

(21,66,"2016-02-18"),(22,13,"2017-01-26"),(23,12,"2016-08-07"),(24,34,"2016-04-12"),(25,48,"2016-09-17"),(26,3,"2016-02-17"),(27,1,"2017-02-03"),(28,44,"2016-05-22"),(29,36,"2017-03-15"),(30,78,"2016-10-31"),

(31,35,"2016-11-18"),(32,49,"2016-08-13"),(33,44,"2016-03-15"),(34,18,"2016-11-09"),(35,19,"2016-05-12"),(36,51,"2016-01-05"),(37,42,"2016-12-16"),(38,36,"2016-07-02"),(39,5,"2016-05-14"),(40,69,"2017-03-18"),

(41,45,"2016-02-06"),(42,2,"2016-01-28"),(43,16,"2017-03-24"),(44,76,"2016-10-30"),(45,25,"2017-01-18"),(46,9,"2016-06-30"),(47,76,"2016-12-10"),(48,61,"2016-11-11"),(49,49,"2016-07-14"),(50,45,"2017-03-20"),

(51,57,"2016-07-25"),(52,78,"2016-11-01"),(53,38,"2016-08-19"),(54,17,"2016-04-28"),(55,41,"2016-07-02"),(56,59,"2016-03-21"),(57,3,"2016-06-16"),(58,48,"2016-10-28"),(59,58,"2016-01-07"),(60,18,"2016-11-07"),

(61,11,"2016-01-14"),(62,34,"2017-02-10"),(63,50,"2017-03-07"),(64,52,"2016-08-04"),(65,29,"2016-05-09"),(66,38,"2016-01-23"),(67,49,"2017-02-09"),(68,6,"2017-03-29"),(69,32,"2016-04-10"),(70,35,"2016-05-03"),

(71,29,"2016-09-06"),(72,26,"2016-05-31"),(73,57,"2016-02-02"),(74,17,"2016-05-12"),(75,19,"2016-08-02"),(76,9,"2017-01-01"),(77,69,"2016-09-18"),(78,50,"2017-03-05"),(79,74,"2016-04-22"),(80,49,"2016-02-07"),

(81,3,"2016-05-08"),(82,50,"2016-03-14"),(83,61,"2016-10-28"),(84,57,"2016-02-20"),(85,62,"2017-03-03"),(86,75,"2016-02-08"),(87,69,"2017-01-20"),(88,59,"2016-07-07"),(89,80,"2016-12-08"),(90,41,"2017-01-16"),

(91,24,"2017-02-24"),(92,50,"2016-01-10"),(93,14,"2016-01-05"),(94,50,"2016-01-24"),(95,62,"2016-06-10"),(96,25,"2017-03-15"),(97,46,"2017-02-25"),(98,34,"2016-09-27"),(99,24,"2016-06-29"),(100,46,"2016-06-21"),

(101,58,"2017-01-06"),(102,58,"2016-07-22"),(103,78,"2016-05-07"),(104,65,"2016-12-04"),(105,30,"2016-01-09"),(106,14,"2016-07-25"),(107,17,"2017-01-12"),(108,20,"2016-06-02"),(109,23,"2016-03-17"),(110,57,"2016-04-29"),

(111,47,"2017-02-24"),(112,53,"2017-03-04"),(113,33,"2016-09-02"),(114,65,"2016-10-06"),(115,53,"2016-01-28"),(116,69,"2016-04-24"),(117,28,"2016-08-23"),(118,67,"2016-06-05"),(119,29,"2016-03-10"),(120,15,"2016-07-29"),

(121,45,"2017-02-12"),(122,43,"2016-01-18"),(123,58,"2016-06-04"),(124,55,"2016-10-30"),(125,22,"2016-09-28"),(126,59,"2016-12-26"),(127,3,"2017-01-21"),(128,76,"2016-12-23"),(129,12,"2016-08-31"),(130,20,"2016-06-22"),

(131,16,"2016-07-04"),(132,51,"2016-03-04"),(133,76,"2016-06-10"),(134,26,"2016-07-22"),(135,51,"2016-06-27"),(136,51,"2016-03-27"),(137,77,"2016-11-20"),(138,2,"2016-04-02"),(139,8,"2016-08-17"),(140,25,"2016-02-17"),

(141,71,"2017-01-01"),(142,4,"2016-12-26"),(143,46,"2016-09-18"),(144,14,"2016-09-08"),(145,57,"2016-07-22"),(146,66,"2016-02-12"),(147,1,"2016-04-27"),(148,53,"2016-10-31"),(149,5,"2016-02-06"),(150,38,"2016-07-17");



SELECT 'LOADING artykuly' as 'INFO';

INSERT INTO `artykuly` (`IDZamowienia`, `IDPudelka`, `Sztuk`) VALUES

(1, "MSBM", 1),(2, "NJLM", 7),(2, "OGNP", 2),(2, "ZSAL", 7),(3, "BUKL", 8),(3, "FORC", 2),(4, "ALLC", 2),(4, "CHOL", 4),(5, "ALLC", 4),(5, "CHOL", 2),

(6, "ALLL", 1),(6, "ALLP", 6),(6, "FORC", 2),(6, "MSCM", 5),(7, "MSAM", 7),(7, "MSBM", 1),(8, "CHOL", 6),(8, "CZEC", 1),(8, "FORC", 3),(8, "SLOM", 9),

(9, "FORC", 2),(9, "OGNP", 2),(10, "ALLL", 2),(10, "MSAM", 8),(11, "ALLL", 2),(11, "CHOL", 4),(12, "CZEC", 10),(12, "MSAM", 1),(12, "SLOM", 6),(13, "MSBM", 2),

(13, "ZSAL", 8),(14, "FORC", 3),(14, "SLOM", 2),(15, "CZEC", 2),(16, "MSCM", 1),(17, "CZEP", 1),(18, "CZEC", 2),(18, "CZEP", 2),(19, "MSBM", 2),(20, "MSBM", 6),

(20, "MSCM", 2),(21, "CZEP", 1),(22, "FORC", 2),(23, "ALLP", 3),(23, "BUKL", 1),(23, "MSAM", 7),(23, "MSCM", 2),(24, "MSBM", 4),(24, "ZSAL", 1),(25, "CZEC", 7),

(25, "MSBM", 1),(25, "NJLM", 1),(26, "ALLC", 1),(26, "ALLL", 3),(26, "MSAM", 7),(26, "ZSAL", 1),(27, "CZEP", 2),(28, "CZEC", 1),(29, "SLOM", 1),(30, "CZEP", 3),

(30, "MSBM", 6),(30, "SLOM", 2),(31, "ZSAL", 1),(32, "ALLP", 1),(33, "CZEP", 2),(33, "MSAM", 8),(34, "ALLL", 2),(34, "BUKL", 3),(34, "CHOL", 3),(35, "MSAM", 1),

(36, "ALLL", 1),(36, "CZEC", 10),(36, "CZEP", 2),(37, "ZSAL", 2),(38, "CHOL", 9),(38, "FORC", 8),(38, "OGNP", 2),(39, "FORC", 2),(39, "MSBM", 3),(40, "CHOL", 2),

(41, "MSCM", 2),(42, "ALLL", 2),(43, "NJLM", 2),(44, "CZEP", 2),(45, "CHOL", 8),(45, "OGNP", 1),(46, "ALLL", 2),(47, "ALLP", 1),(48, "ALLL", 1),

(48, "OGNP", 7),(49, "CHOL", 1),(49, "SLOM", 1),(50, "ALLC", 2),(50, "BUKL", 6),(50, "MSAM", 5),(51, "MSCM", 2),(52, "NJLM", 2),(53, "MSAM", 2),(54, "ALLC", 8),

(54, "NJLM", 1),(54, "SLOM", 2),(55, "BUKL", 2),(56, "ALLC", 6),(56, "MSAM", 2),(57, "ALLL", 2),(57, "ALLP", 5),(58, "BUKL", 1),(59, "MSBM", 2),(59, "ZSAL", 5),

(60, "ALLC", 2),(60, "MSAM", 8),(61, "FORC", 1),(61, "NJLM", 2),(62, "MSBM", 2),(62, "OGNP", 3),(63, "MSBM", 5),(63, "MSCM", 2),(64, "BUKL", 2),(65, "FORC", 1),

(65, "ZSAL", 7),(66, "MSBM", 2),(67, "ALLP", 8),(67, "OGNP", 2),(68, "ALLL", 1),(69, "BUKL", 1),(69, "MSCM", 1),(70, "CZEP", 6),(70, "SLOM", 1),(71, "CZEP", 2),

(72, "FORC", 2),(72, "SLOM", 2),(73, "CZEC", 2),(74, "ALLC", 2),(75, "ALLP", 3),(75, "NJLM", 1),(76, "OGNP", 8),(76, "ZSAL", 2),(77, "OGNP", 1),(78, "BUKL", 8),

(78, "CZEP", 5),(78, "MSAM", 1),(79, "ALLP", 4),(79, "SLOM", 2),(80, "NJLM", 2),(81, "ALLL", 1),(81, "ALLP", 10),(82, "CZEP", 1),(83, "CZEC", 1),(84, "ALLC", 6),

(84, "FORC", 2),(85, "SLOM", 1),(86, "MSBM", 2),(86, "MSCM", 8),(86, "NJLM", 9),(87, "BUKL", 2),(87, "SLOM", 2),(88, "SLOM", 1),(89, "MSAM", 1),(90, "CHOL", 2),

(91, "ZSAL", 2),(92, "ALLC", 2),(92, "CZEP", 9),(92, "ZSAL", 1),(93, "CZEP", 2),(94, "BUKL", 1),(95, "FORC", 2),(96, "ALLC", 1),(96, "NJLM", 7),(97, "SLOM", 2),

(98, "MSCM", 2),(99, "CHOL", 1),(99, "CZEC", 4),(100, "CZEP", 1),(101, "MSAM", 2),(102, "MSBM", 2),(103, "FORC", 2),(104, "ALLL", 1),(104, "NJLM", 3),(105, "CZEP", 9),

(105, "FORC", 2),(106, "ALLC", 2),(107, "FORC", 1),(108, "ALLP", 2),(108, "ZSAL", 8),(109, "ALLP", 1),(110, "CHOL", 1),(111, "ALLL", 2),(112, "BUKL", 10),(112, "CZEC", 1),

(112, "MSBM", 7),(113, "CZEP", 3),(113, "SLOM", 2),(114, "CZEP", 1),(115, "CHOL", 2),(116, "ALLC", 3),(116, "FORC", 9),(116, "ZSAL", 2),(117, "BUKL", 5),(117, "FORC", 1),

(118, "SLOM", 1),(119, "ALLP", 3),(119, "CHOL", 2),(119, "MSBM", 7),(120, "MSCM", 2),(121, "NJLM", 2),(122, "ALLP", 9),(122, "MSBM", 10),(122, "NJLM", 1),(123, "ALLC", 2),

(123, "CHOL", 10),(124, "BUKL", 1),(124, "FORC", 2),(125, "CZEP", 1),(125, "MSCM", 2),(125, "ZSAL", 4),(126, "BUKL", 2),(127, "MSBM", 2),(128, "MSCM", 2),(129, "BUKL", 2),

(129, "ZSAL", 3),(130, "ALLL", 2),(130, "MSCM", 10),(131, "CHOL", 2),(131, "CZEC", 2),(132, "BUKL", 8),(132, "MSAM", 3),(132, "NJLM", 2),(133, "MSAM", 2),(134, "MSBM", 2),

(135, "SLOM", 8),(135, "ZSAL", 2),(136, "CHOL", 6),(136, "ZSAL", 2),(137, "MSBM", 6),(137, "MSCM", 1),(138, "ALLP", 1),(138, "CZEC", 1),(139, "FORC", 3),(139, "MSAM", 2),

(140, "MSCM", 2),(140, "ZSAL", 1),(141, "FORC", 2),(142, "ALLC", 3),(142, "MSBM", 2),(142, "OGNP", 9),(143, "CZEP", 1),(144, "CZEP", 4),(144, "MSBM", 1),(145, "ALLL", 4),

(145, "ALLP", 2),(145, "MSAM", 9),(146, "NJLM", 2),(146, "SLOM", 3),(147, "ALLL", 2),(147, "ALLP", 2),(148, "BUKL", 1),(149, "BUKL", 2),(149, "MSAM", 3),(149, "MSCM", 8),

(150, "CZEC", 1);

COMMIT;


