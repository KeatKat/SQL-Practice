
CREATE TABLE person(
passportnumber VARCHAR(20) NOT NULL,
firstname VARCHAR(30) NOT NULL,
lastname VARCHAR(30) NOT NULL,
dateofbirth VARCHAR(10) NOT NULL,
gender ENUM("M", "F", "O") NOT NULL,
address VARCHAR(50) NOT NULL,
telno DECIMAL(20) NULL,
email VARCHAR(50) NOT NULL,
CONSTRAINT person_pkey PRIMARY KEY(passportnumber),
CONSTRAINT person_ckey1 UNIQUE(firstname, lastname, dateofbirth));

CREATE TABLE chef(
chefpassportnumber VARCHAR(30) NOT NULL,
culinarycert VARCHAR(300) NOT NULL,
competitionexpr VARCHAR(300) NULL,
CONSTRAINT chef_pkey PRIMARY KEY(chefpassportnumber),
CONSTRAINT chef_fkey1 FOREIGN KEY(chefpassportnumber)
	REFERENCES person(passportnumber));
    
CREATE TABLE client(
clientpassportnumber VARCHAR(30) NOT NULL,
preferredcuisine VARCHAR(100) NULL,
prefferedpaymtype VARCHAR(20) NOT NULL,
creditcardnumber VARCHAR(20) NULL,
creditcardtype VARCHAR(20) NULL,
issuingbank VARCHAR(50) NULL,
CONSTRAINT client_pkey PRIMARY KEY(clientpassportnumber),
CONSTRAINT client_fkey1 FOREIGN KEY(clientpassportnumber)
	REFERENCES person(passportnumber));

CREATE TABLE specialty(
specialty_number DECIMAL(3) NOT NULL,
chefpassportnumber VARCHAR(20) NOT NULL,
description VARCHAR(100) NOT NULL,
ingredients VARCHAR(300) NOT NULL,
recipe VARCHAR(1000) NULL,
CONSTRAINT spec_pkey PRIMARY KEY(specialty_number),
CONSTRAINT spec_fkey1 FOREIGN KEY(chefpassportnumber)
	REFERENCES person(passportnumber));
    
CREATE TABLE partyevent(
eventID VARCHAR(10) NOT NULL,
partysize DECIMAL(3) NOT NULL,
cuisinepkg VARCHAR(100) NOT NULL,
eventdate VARCHAR(10) NOT NULL,
eventtime VARCHAR(5) NOT NULL,
eventvenue VARCHAR(50) NOT NULL,
chefpassportnumber VARCHAR(30) NOT NULL,
clientpassportnumber VARCHAR(30) NOT NULL,
CONSTRAINT party_pkey PRIMARY KEY(eventID),
CONSTRAINT party_fkey1 FOREIGN KEY(chefpassportnumber)
	REFERENCES person(passportnumber),
CONSTRAINT party_fkey2 FOREIGN KEY(clientpassportnumber)
	REFERENCES person(passportnumber),
CONSTRAINT party_ckey1 UNIQUE(eventdate, eventtime, eventvenue)); 

    

					 
						