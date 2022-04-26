USE pandacheesecap;

DROP TRIGGER IF EXISTS remove_from_waitlist;
DROP TRIGGER IF EXISTS remove_from_party;

-- Change statement delimiter from semicolon to double front slash (needed because the semicolon is used within the CREATE PROCEDURE statement, it allows // to define the end of the CREATE PROCEDURE statement (it is also common to use $$)
DELIMITER //

-- set the party from the waitlist to the table
CREATE TRIGGER remove_from_waitlist
	AFTER UPDATE ON restaurant_table
	FOR EACH ROW
BEGIN
	DELETE FROM waitlist
    WHERE waitlist.party_ID = NEW.party_ID;
END//

-- remove the party from table who has paied the bill
CREATE TRIGGER remove_from_party
	BEFORE UPDATE ON restaurant_table
	FOR EACH ROW
BEGIN
	DECLARE payment_method INT;

	SELECT party_order.payment_method 
	INTO payment_method
	FROM party_order
	WHERE party_order.table_ID = OLD.table_ID;

	IF payment_method > 0 AND payment_method < 5 OR payment_method IS NULL THEN
	DELETE FROM party
    WHERE party.party_ID = OLD.party_ID;
    ELSE
    SIGNAL SQLSTATE '99999' SET MESSAGE_TEXT = 'They cannot leave without paying the bill!!!';
    END IF;
END//

DELIMITER ;

-- UPDATE pandacheesecap.restaurant_table
-- SET restaurant_table.party_ID = 5,
-- 	restaurant_table.occupied = 1
-- WHERE restaurant_table.table_ID = 4;

-- UPDATE pandacheesecap.restaurant_table
-- SET restaurant_table.party_ID = NULL,
-- 	restaurant_table.occupied = 0
-- WHERE restaurant_table.table_ID = 4;