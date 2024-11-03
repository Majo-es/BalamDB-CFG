-- DATA DEFINITION LANGUAGE(DDL)
CREATE DATABASE BalamDB;

USE BalamDB;

-- Places in Southeast  Mexico Table (Entities):
-- Key Attribute: State_ID
-- Attributes: State, Capital , & Area (sq km)

-- IDENTIFIER: S_MX
CREATE TABLE S_MX (
    State_ID INT NOT NULL,
    State TEXT NOT NULL,
    Capital VARCHAR(25) NOT NULL,
    Area INT,
    PRIMARY KEY (State_ID)
);

-- DATA MANIPULATION LANGUAGE (DML)
INSERT INTO  S_MX(
	State_ID, 
	State, 
	Capital ,
	Area)

VALUES
 (1, 'Campeche', 'San Francisco de Campeche',  57507),
 (2, 'Tabasco',  'Villahermosa', 25267), 
 (3, 'Chiapas', 'Tuxtla Gutiérrez', 74211), 
 (4, 'Quintana Roo', 'Chetumal', 50212),
 (5, 'Yucatán', 'Merida', 38402);


CREATE TABLE TOWNS (
Town_ID CHAR (20) NOT NULL, 
Town VARCHAR (255)  NOT NULL,
State_ID  INT NOT NULL,

PRIMARY KEY (Town_ID),
FOREIGN KEY (State_ID)  REFERENCES S_MX (State_ID)
);

SELECT * FROM TOWNS;

INSERT INTO TOWNS ( Town_ID, Town,State_ID)

VALUES ('T1', 'Palizada', 1),
('T2', 'Escarcega', 1), 

('T3', 'Tapijulapa', 2), 

('T4', 'Palenque', 3), 
('T5', 'Chiapa de Corzo', 3), 
('T6', 'San Cristobal de las Casas', 3),
('T7', 'Comitan', 3), 

('T8', 'Bacalar', 4), 
('T9', 'Isla Mujeres', 4), 
('T10', 'Tulum', 4), 

('T11', 'Valladolid', 5),
('T12', 'Izamal', 5), 
('T13', 'Chichen Itza', 5);


CREATE TABLE UNESCO(
UNESCO_ID CHAR (20) NOT NULL,
UNESCO_Site VARCHAR (255), 
Town_ID CHAR (20) NOT NULL,
State_ID  INT NOT NULL,

PRIMARY KEY (UNESCO_ID), 
FOREIGN KEY (Town_ID) REFERENCES TOWNS(Town_ID), 
FOREIGN KEY (State_ID)  REFERENCES S_MX (State_ID)
);

INSERT INTO UNESCO(UNESCO_ID, UNESCO_Site, Town_ID, State_ID )

VALUES
('U1', 'Calakmul Biosphere Reserve' , 'T2', 1), 

('U2',  'Palenque',   'T4', 3), 

 ('U3',  'Cozumel', 'T10', 4), 
 ('U4', 'Sian Ka\'an Biosphere Reserve','T10', 4), 
 ('U5',  'Chinchorro Reef', 'T8', 4), 

 ('U6',  'Uxmal', 'T12', 5), 
 ('U7',  'Ria Celestun Biosphere Reserve', 'T12', 5), 

('U8', 'Chichén Itza', 'T13', 5); 


CREATE TABLE Languages (
Language_ID INT  NOT NULL, 
Language VARCHAR (255)  NOT NULL, 
State_ID  INT NOT NULL,

PRIMARY KEY (Language_ID),
FOREIGN KEY (State_ID)  REFERENCES S_MX (State_ID)
);

INSERT INTO Languages (Language_ID, Language, State_ID)
VALUES 
(1,  'Maya', 1),
(2, 'Chol', 1), 

(3, 'Chontal', 2), 
(4, 'Chol', 2),
(5, 'Tzeltal', 2),
(6, 'Tzotzil', 2 ),


(7, 'Chuj', 3),
(8, 'Mochó', 3),
(9, 'Tzotzil',  3),
(10, 'Tzeltal',  3),
(11, 'Chol',   3),
(12, 'Lacandón', 3),
(13, 'Tojolabal',  3),
(14, 'Zoque',  3),
(15, 'Mam',  3),
(16, 'Kanjobal/Qánjobál', 3),
(17, 'Quiché',  3),
(18, 'Jacalteco',  3),

( 19, 'Maya', 4),
(20, 'Tzotzil', 4),
(21, 'Chol', 4),
(22, 'Kanjobal/Qánjobál', 4),

(23, 'Maya', 5),
(24, 'Chol', 5),
(25, 'Tzeltal', 5),
(26, 'Mixe', 5);

CREATE TABLE ECOCIDE (
    Ecocide_ID INT NOT NULL,
    Deforestation_Period1 YEAR,
    Deforestation_Period2 YEAR,
    State_ID INT NOT NULL,
    DF_Area VARCHAR(255),
    PRIMARY KEY (Ecocide_ID),
    FOREIGN KEY (State_ID)
        REFERENCES S_MX (State_ID)
);



INSERT INTO ECOCIDE (Ecocide_ID, Deforestation_Period1,  Deforestation_Period2, State_ID, DF_Area )
VALUES 
 (1, "2019" , "2020",  1 , '134200 hectares'),

(2, "2019" ,  "2020", 2,  '31100 hectares' ),

(3, "2019", "2020", 3,   '70300 hectares'),

(4, "2019" , "2020", 4,  '90500 hectares'),

(5, "2019", "2020",  5 , '26900 hectares');

CREATE TABLE Dznot (
    Cenote_ID CHAR(5) NOT NULL,
    Cenote_Name VARCHAR(50),
    State_ID INT NOT NULL,
    Route_ID INT NOT NULL,
    PRIMARY KEY (Cenote_ID),
    
    FOREIGN KEY (State_ID)
        REFERENCES S_MX (State_ID),
    FOREIGN KEY (Route_ID)
        REFERENCES ROUTE (Route_ID)
);

INSERT INTO Dznot(Cenote_ID, Cenote_Name, State_ID, Route_ID )
VALUES ('C1', 'Casa del Cenote', 4, 1), 
('C2', 'Sacred Cenote', 5, 2), 
('C3', 'Sac Actún/ Dos Ojos', 4, 1),
('C4', 'Cenote Xlakah', 5, 6);

/* 
IDENTIFIER: Biodiversity
CREATE TABLE Biodiversity(
Biodiversity_ID CHAR (25) NOT NULL,
Bio_NAME  VARCHAR (255) NOT NULL, 
SCIENTIFIC_NAME VARCHAR (255) NOT NULL, 
KINGDOM VARCHAR (255) NOT NULL, 
PHYLUM VARCHAR (255) NOT NULL, 
CLASS VARCHAR (255) NOT NULL, 
SUBCATEGORY VARCHAR (255) NOT NULL, 
FAMILY VARCHAR (255) NOT NULL, 
GENUS VARCHAR (255) NOT NULL,  
CURRENT_POPULATION_TREND VARCHAR (255) NOT NULL,

PRIMARY KEY (Biodiversity_ID)

);

OR -> 
*/

CREATE TABLE Biodiversity(
Biodiversity_ID CHAR (25) NOT NULL,
Bio_NAME  TEXT NOT NULL, 
SCIENTIFIC_NAME  TEXT NOT NULL, 
KINGDOM  TEXT NOT NULL, 
PHYLUM  TEXT NOT NULL, 
CLASS  TEXT NOT NULL, 
SUBCATEGORY  TEXT NOT NULL, 
FAMILY  TEXT NOT NULL, 
GENUS  TEXT NOT NULL,  
CURRENT_POPULATION_TREND  TEXT NOT NULL,

PRIMARY KEY (Biodiversity_ID)
);



INSERT INTO Biodiversity (Biodiversity_ID, Bio_NAME, SCIENTIFIC_NAME, KINGDOM, PHYLUM,
 CLASS,SUBCATEGORY, FAMILY, GENUS,  CURRENT_POPULATION_TREND) 

VALUES 

('B1', 'Jaguar', 'Panthera Onca', 'Animalia' ,   'Chordata' , 'Mammalia'  , 'Carnivora'  , 'Felidae'  , 'Panthera' ,  'Decreasing'), 

('B2',  'Jaguarundi/Tigrillo' , 'Herpailurus Yagouaroundi'  , 'Animalia',   'Chordata'  , 'Mammalia'  , 'Carnivora'  , 'Felidae' , 'Herpailurus' , 'Decreasing'), 

('B3' , 'Kinkajou' , 'Potos Flavus',  'Animalia',   'Chordata'  , 'Mammalia'  ,  'Carnivora'  ,  'Procynidae',  'Potos',  'Decreasing'), 

('B4', 'Lowland/ South American Tapir', 'Tapirus Terrestris', 'Animalia',   'Chordata' , 'Mammalia'  , 'Perissodactyla',  'Tapiridae',  'Tapirus', 'Decreasing') , 

('B5', 'Mexican Spider Monkey',  'Ateles Geoffroyi ssp. Vellerosus' , 'Animalia',   'Chordata' , 'Mammalia'  , 'Primates', 'Atelidae', 'Ateles',  'Decreasing' ), 

('B6', 'Central American Boa', 'Boa Imperator',  'Animalia',    'Chordata' , 'Reptilia', 'Squamata',  'Boidae' , 'Boa',  'Stable'),

('B7', 'Rose-Bellied Bunting', 'Passerina Rositae',  'Animalia',    'Chordata' ,   'Aves',  'Passeriformes', 'Cardinalidae', 'Passerina',   'Stable'),

('B8', 'Giant Wren',  'Campylorhynchus Chiapensis', 'Animalia',   'Chordata'  ,  'Aves',  'Passeriformes', 'Troglodytidae', 'Campylorhynchus', 'Increasing'),

('B9',  'Yucatán Wren', 'Campylorhynchus Yucatanicus', 'Animalia',    'Chordata'  ,  'Aves', 'Passeriformes', 'Troglodytidae', 'Campylorhynchus',  'Stable'),

('B10', 'White-Nosed Coati/ Coatimundi', 'Nasua Narica', 'Animalia',   'Chordata'  , 'Mammalia'  , 'Carnivora'  , 'Procyonidae', 'Nasua',   'Decreasing'),

('B11', 'Cozumel/Pygmy Raccoon', 'Procyon Pygmaeus',  'Animalia',   'Chordata'  , 'Mammalia' , 'Carnivora'  , 'Procyonidae', 'Procyon', 'Decreasing'),

('B12', 'Pink /American Flamingo', 'Phoenicopterus Ruber',  'Animalia',   'Chordata'  ,  'Aves', 'Phoenicopteriforme', 'Phoenicopterida', 'Phoenicopteru', 'Increasing'),

('B13', 'Carey/Hawksbill Turtle', 'Eretmochelys Imbricata', 'Animalia',   'Chordata'  ,  'Reptilia', 'Testudines', 'Cheloniidae',   'Eretmochelys', 'Decreasing' ),

('B14', 'Mexican Agouti', 'Dasyprocta Mexicana', 'Animalia',    'Chordata'  ,  'Mammalia'  , 'Rodentia',  'Dasyproctidae', 'Dasyprocta',  'Decreasing'),

('B15',  'Yucatán Black Howler Monkey', 'Alouatta Pigra', 'Animalia',   'Chordata'  , 'Mammalia'  ,  'Primates', 'Atelidae', 'Alouatta',  'Decreasing'),

('B16', 'Mexican Big-Eared Bat', 'Corynorhinus Mexicanus',  'Animalia',   'Chordata'  , 'Mammalia' , 'Chiroptera', 'Vespertilionidae', 'Corynorhinus', 'Decreasing'),

('B17', 'Puma' ,  'Puma Concolor', 'Animalia',  'Chordata'  , 'Mammalia'  , 'Carnivora'  , 'Felidae'  , 'Puma', 'Decreasing'),

('B18', 'Caribbean Myrtle Croton' , 'Bernardia Dichotoma' ,  'Plantae',  'Tracheophyta', 'Magnoliopsida',   'Malpighiales',   'Euphorbiaceae',  'Bernardia',  'Stable'), 

('B19',  'Amché',   'Wimmeria Obtusifolia',   'Plantae', 'Tracheophyta',  'Magnoliopsida' ,   'Celastrales',   'Celastraceae',     'Wimmeria',  'Decreasing' ), 

('B20', 'Ceiba', 'Ceiba Schottii',  'Plantae', 'Tracheophyta', 'Magnoliopsida', 'Malvales', 'Malvaceae',  'Ceiba',  'Stable');

-- ALTERED BC FORGOT TO ADD FOREIGN KEY (TD_ID) REFERENCES Biodiversity (TD_ID) 
-- MUST USE IDENTITY OR AUTO_INCREMENT for the Bio_ID 

ALTER TABLE Biodiversity
ADD COLUMN TD_ID INT NOT NULL;

UPDATE Biodiversity 
SET  TD_ID= 1
WHERE Biodiversity_ID = 'B1';

UPDATE Biodiversity 
SET  TD_ID= 1
WHERE Biodiversity_ID = 'B2';

UPDATE Biodiversity 
SET  TD_ID= 1
WHERE Biodiversity_ID = 'B3';

UPDATE Biodiversity 
SET  TD_ID= 1
WHERE Biodiversity_ID = 'B4';

UPDATE Biodiversity 
SET  TD_ID= 1
WHERE Biodiversity_ID = 'B5';

UPDATE Biodiversity 
SET  TD_ID= 1
WHERE Biodiversity_ID = 'B6';

UPDATE Biodiversity 
SET  TD_ID= 1
WHERE Biodiversity_ID = 'B7';

UPDATE Biodiversity 
SET  TD_ID= 1
WHERE Biodiversity_ID = 'B8';

UPDATE Biodiversity 
SET  TD_ID= 1
WHERE Biodiversity_ID = 'B9';

UPDATE Biodiversity 
SET  TD_ID= 1
WHERE Biodiversity_ID = 'B10';

UPDATE Biodiversity 
SET  TD_ID= 1
WHERE Biodiversity_ID = 'B11';

UPDATE Biodiversity 
SET  TD_ID= 1
WHERE Biodiversity_ID = 'B12';

UPDATE Biodiversity 
SET  TD_ID= 1
WHERE Biodiversity_ID = 'B13';

UPDATE Biodiversity 
SET  TD_ID= 1
WHERE Biodiversity_ID = 'B14';

UPDATE Biodiversity 
SET  TD_ID= 1
WHERE Biodiversity_ID = 'B15';

UPDATE Biodiversity 
SET  TD_ID= 1
WHERE Biodiversity_ID = 'B16';

UPDATE Biodiversity 
SET  TD_ID= 1
WHERE Biodiversity_ID = 'B17';

UPDATE Biodiversity 
SET  TD_ID= 1
WHERE Biodiversity_ID = 'B18';

UPDATE Biodiversity 
SET  TD_ID= 1
WHERE Biodiversity_ID = 'B19';

UPDATE Biodiversity 
SET  TD_ID= 1
WHERE Biodiversity_ID = 'B20';


-- IDENTIFIER: Mayan_Train_Project 
CREATE TABLE Mayan_Train_Project (
    MayanTrain_ID INT NOT NULL,
    Project_Type VARCHAR (30) NOT NULL,
    Company_Name VARCHAR (10) NOT NULL,
    Cost_of_Construction VARCHAR (15) NOT NULL,
    Construction_time YEAR NOT NULL,
    Completion_time YEAR NOT NULL,
    Location VARCHAR (50) NOT NULL,
    PRIMARY KEY (MayanTrain_ID)
);


INSERT INTO Mayan_Train_Project

VALUES (1, 'Large-scale intercity railway',  'Alstom', '20 Billion USD',   "2019", "2024", 
 'Yucatán Peninsula and Southern Mexico');

-- IDENTIFIER: TD
CREATE TABLE TD (
    TD_ID INT NOT NULL,
    Train_Design_Name VARCHAR(25),
    Train_Name1 VARCHAR(15),
    Train_Name2 VARCHAR(15),
    Train_Name3 VARCHAR(15),
    Number_of_trains INT,
    Pass_Cap INT,
    Type_of_Fuel VARCHAR(30),
    MayanTrain_ID INT NOT NULL,
    PRIMARY KEY (TD_ID),
    FOREIGN KEY (MayanTrain_ID)
        REFERENCES Mayan_Train_Project (MayanTrain_ID)
);


INSERT INTO TD (TD_ID , Train_Design_Name, Train_Name1, Train_Name2, Train_Name3,
 Number_of_trains , Pass_Cap, Type_of_Fuel, MayanTrain_ID)

VALUES (1, 'X\’trapolis', 'Xiinbal', ' Janal' , 'Patal', 42, 300, 'diesel and diesel-electric', 1);


-- IDENTIFIER: TRACKS

CREATE TABLE TRACKS (
    Track_ID INT NOT NULL,
    Track_Name VARCHAR(100) NOT NULL,
    Track_place VARCHAR(100) NOT NULL,
    Track_Length VARCHAR(25),
    Speed VARCHAR(25),
    MayanTrain_ID INT NOT NULL,
    TD_ID INT NOT NULL,
    PRIMARY KEY (Track_ID),
    FOREIGN KEY (MayanTrain_ID)
        REFERENCES Mayan_Train_Project (MayanTrain_ID),
    FOREIGN KEY (TD_ID)
        REFERENCES TD (TD_ID)
);

INSERT INTO TRACKS (Track_ID, Track_Name, Track_place, Track_Length, Speed,MayanTrain_ID, TD_ID ) 
VALUES
(1, 'Selva Uno', 'Palenque-Escárcega',  '228 km', '130 km/hr', 1, 1),
(2, 'Golfo Uno', 'Escárcega-Calkini',  '235km', '130 km/hr', 1, 1),
(3, 'Golfo Dos', 'Calkini-Izamal',   '172 km', '130 km/hr', 1, 1),
(4, 'Golfo Tres',  'Izamal-Cancún',  '257 km', '130 km/hr', 1, 1),
(5, 'Caribe Dos',  'Cancún-Tulum',  '121 km', '130 km/hr', 1, 1),
(6, 'Caribe Uno',  'Tulum-Chetumal',  '254 km', '130 km/hr', 1, 1),
(7,  'Selva Dos', 'Bacalar-Escárcega', '287 km', '130 km/hr', 1, 1);


-- IDENTIFIER:ROUTE
CREATE TABLE ROUTE (
    Route_ID INT NOT NULL,
    Route_Name VARCHAR(25) NOT NULL,
    Route_Source VARCHAR(50) NOT NULL,
    Route_Destination VARCHAR(50) NOT NULL,
    Time_Distance TIME,
    PRIMARY KEY (Route_ID)
);


INSERT INTO ROUTE (Route_ID, Route_Name,  Route_Source, Route_Destination, Time_Distance)
VALUES 
(1, 'Route 1', 'Cancún', 'Tulum', "02:00"), 
(2, 'Route 2', 'Cancún', 'Mérida', "02:00" ), 
(3, 'Route 3', 'Mérida', 'Escárcega', "02:00"), 
(4, 'Route 4', 'Cancún',  'Chetumal', "02:00" ), 
(5, 'Route 5', 'Mérida', 'Palenque ', "02:00" ), 
(6, 'Route 6', 'Mérida', 'Bacalar', "02:00");

-- UPDATED ROUTE VALUES:
SELECT * 
FROM ROUTE;

UPDATE ROUTE
SET  Time_Distance= "00:30"
WHERE Route_ID = 1;

UPDATE ROUTE
SET  Time_Distance= "01:30"
WHERE Route_ID = 2;

UPDATE ROUTE
SET  Time_Distance= "02:00"
WHERE Route_ID = 3;

UPDATE ROUTE
SET  Time_Distance= "02:00"
WHERE Route_ID = 4;

UPDATE ROUTE
SET  Time_Distance= "03:00"
WHERE Route_ID = 5;

UPDATE ROUTE
SET  Time_Distance= "03:00"
WHERE Route_ID = 6;

  
-- IDENTIFIER:Station
CREATE TABLE Station (
    Station_ID INT NOT NULL,
    Station_Name VARCHAR(25) NOT NULL,
    Route_ID INT NOT NULL,
    State_ID INT NOT NULL,
    Working_hours TIME,
    Opening_Time TIME,
    Closing_Time TIME,
    PRIMARY KEY (Station_ID),
    FOREIGN KEY (Route_ID)
        REFERENCES ROUTE (Route_ID),
    FOREIGN KEY (State_ID)
        REFERENCES S_MX (State_ID)
);


INSERT INTO Station(Station_ID,Station_Name,Route_ID, State_ID, Working_hours, Opening_Time, Closing_Time)
VALUES 
(1, 'Puerto Morelos', 1, 4, "16:00", "06:00", "21:00" ),

(2, 'Playa del Carmen', 1, 4, "16:00", "06:00", "21:00"),

(3, 'Cobá', 1, 4,  "16:00", "06:00", "21:00"),

(4,'Nuevo Xcán', 2, 4, "16:00", "06:00", "21:00"),

(5, 'Valladolid', 2,  5, "16:00", "06:00", "21:00"),

(6,'Chichén Itza', 2,  5,  "16:00", "06:00", "21:00"),

(7,'Izamal', 2, 5, "16:00", "06:00", "21:00"),

(8, 'San Francisco Campeche',  3, 1,  "16:00", "06:00", "21:00"),

(9,'Carrillo Puerto', 4, 4, "16:00", "06:00", "21:00"),

(10,'El Triunfo',  5, 2, "16:00", "06:00", "21:00"),

(11,'Boca del Cerro', 5, 2, "16:00", "06:00", "21:00"),

(12, 'Palenque', 5, 3,"16:00", "06:00", "21:00"),

(13, 'Xpujil', 6, 1, "16:00", "06:00", "21:00");

-- ALTERED TABLED:
SELECT * 
FROM Station;
ALTER TABLE Station
DROP COLUMN Working_hours;


-- IDENTIFIER: Train_Ticket
CREATE TABLE Train_Ticket (
    Ticket_ID INT NOT NULL,
    Ticket_For_Foreigner_Visitors INT,
    Ticket_For_National_Visitors INT,
    Ticket_Locals INT,
    MayanTrain_ID INT NOT NULL,
    PRIMARY KEY (Ticket_ID),
    FOREIGN KEY (MayanTrain_ID)
        REFERENCES Mayan_Train_Project (MayanTrain_ID)
);

-- $ dollars
INSERT INTO Train_Ticket (Ticket_ID ,Ticket_For_Foreigner_Visitors, MayanTrain_ID ) VALUES  (1, 50,  1);

INSERT INTO Train_Ticket (Ticket_ID , Ticket_For_National_Visitors,  MayanTrain_ID) VALUES (2, 5,  1);

INSERT INTO Train_Ticket (Ticket_ID , Ticket_Locals, MayanTrain_ID ) VALUES (3, 3,  1);


-- Complex stuff : JOINS, STORED FUNCTION, VIEW, GROUP BY

/*JOINS: multiple tables 
INNER JOIN/ LEFT JOIN/ RIGHT JOIN/ FULL OUTER JOIN */

SELECT ECOCIDE_ID, DF_AREA, State, Cenote_ID

FROM ECOCIDE
INNER JOIN S_MX
ON ECOCIDE.State_ID = S_MX.State_ID 


-- STORED FUNCTION THAT CAN BE APPLIED TO A QUERY:

DELIMITER //
CREATE PROCEDURE Language_Spoken ()
BEGIN
SELECT Language
FROM Languages
WHERE State_ID = 3;
END //
DELIMITER ;

-- An example query with a subquery to demonstrate how to extract data:

-- SELECT STATEMENT SUBQUERY
SELECT 
    *
FROM
    Biodiversity
WHERE
    CURRENT_POPULATION_TREND  IN ('Decreasing')
    
-- or
/*SELECT 
    Bio_Name
FROM
    Biodiversity
WHERE
    CURRENT_POPULATION_TREND IN ('Decreasing')*/ 
    
-- or

/*SELECT Bio_Name,  CURRENT_POPULATION_TREND 
FROM
    Biodiversity
WHERE
    CURRENT_POPULATION_TREND  IN ('Decreasing')*/
    


-- VIEW that uses 3-4 base tables: Couldnt merge 3 tables :( 
/*
SELECT * FROM S_MX ; 

CREATE VIEW Things_To_Do AS
SELECT State_ID, State
FROM S_MX
WHERE State= 'Yucatán';
*/

-- An example query with GROUP BY and demonstrate how to extract data:
/*
SELECT * FROM Languages; 
SELECT 
    Language, COUNT(State_ID) AS Language_count
FROM
    Languages
GROUP BY Language
ORDER BY Language;
*/


    
