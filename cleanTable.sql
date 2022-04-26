USE PandaCheeseCap;

DROP PROCEDURE IF EXISTS remove_party_from_table;

-- Change statement delimiter from semicolon to double front slash (needed because the semicolon is used within the CREATE PROCEDURE statement, it allows // to define the end of the CREATE PROCEDURE statement (it is also common to use $$)
DELIMITER //

CREATE PROCEDURE remove_party_from_table(
input_table_ID INT
)
BEGIN  
DECLARE occupied Boolean;

SELECT restaurant_table.occupied
INTO occupied
FROM restaurant_table
WHERE restaurant_table.table_ID = input_table_ID;

IF occupied = 0 THEN
	SELECT 'Already clean this table!';
ELSE 
	UPDATE restaurant_table
	SET restaurant_table.party_ID = NULL,
		restaurant_table.occupied = 0
	WHERE restaurant_table.table_ID = input_table_ID;
    SELECT 'Let\'s find next party!';
END IF;
END//

-- Change statement delimiter back to default
DELIMITER ;

CALL remove_party_from_table(3);
