USE PandaCheeseCap;

DROP PROCEDURE IF EXISTS set_table_new_party;

-- Change statement delimiter from semicolon to double front slash (needed because the semicolon is used within the CREATE PROCEDURE statement, it allows // to define the end of the CREATE PROCEDURE statement (it is also common to use $$)
DELIMITER //

CREATE PROCEDURE set_table_new_party(
input_table_ID INT,
input_new_party_ID INT
)
BEGIN  
DECLARE party_ID INT;
DECLARE party_size INT;
DECLARE table_size INT;

SELECT restaurant_table.party_ID, party.party_size, restaurant_table.table_size
INTO party_ID, party_size, table_size
FROM party, restaurant_table
WHERE restaurant_table.table_ID = input_table_ID AND party.party_ID = input_new_party_ID;

IF party_ID = input_new_party_ID THEN
	SELECT 'Already set this party, please check the new Party ID!';
ELSEIF party_size > table_size THEN
    SELECT 'This table doesn\'t work for such a big party, please find a bigger one!';
ELSEIF input_party_ID_exists(input_new_party_ID) = 0 THEN
	SELECT 'I don\'t think we have this party... Please check the party ID again.';
ELSE 
	UPDATE pandacheesecap.restaurant_table
	SET restaurant_table.party_ID = input_new_party_ID,
		restaurant_table.occupied = 1
	WHERE restaurant_table.table_ID = input_table_ID;
END IF;
END//

DROP FUNCTION IF EXISTS input_party_ID_exists;

CREATE FUNCTION input_party_ID_exists(
input_party_ID INT)
RETURNS BOOLEAN
READS SQL DATA
BEGIN
RETURN (SELECT EXISTS
(SELECT party.party_ID 
FROM party 
WHERE party.party_ID = input_party_ID));

END//


-- Change statement delimiter back to default
DELIMITER ;

CALL set_table_new_party(3, 7);
