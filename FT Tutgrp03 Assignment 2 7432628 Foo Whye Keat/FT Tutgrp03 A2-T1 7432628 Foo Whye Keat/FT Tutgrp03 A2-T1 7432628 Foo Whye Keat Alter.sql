/* Assn 2 Task 1 Qn(i)*/

ALTER TABLE partyevent
DROP CONSTRAINT party_fkey2;

ALTER TABLE partyevent
ADD CONSTRAINT party_fkey2 FOREIGN KEY(clientpassportnumber)
	REFERENCES person(passportnumber) ON DELETE CASCADE;
    
/* Assn 2 Task 1 Qn(ii)*/
ALTER TABLE chef
MODIFY competitionexpr VARCHAR(1000);

/* Assn 2 Task 1 Qn(iii)*/
ALTER TABLE partyevent
ADD COLUMN partyduration DECIMAL(2) NOT NULL;

/* Assn 2 Task 1 Qn(iv)*/
ALTER TABLE client
ADD COLUMN countryoforigin VARCHAR(40) NOT NULL;

    