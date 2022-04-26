USE PandaCheeseCap;

DROP PROCEDURE IF EXISTS order_details;
DROP PROCEDURE IF EXISTS total;
DROP PROCEDURE IF EXISTS check_;

-- Change statement delimiter from semicolon to double front slash (needed because the semicolon is used within the CREATE PROCEDURE statement, it allows // to define the end of the CREATE PROCEDURE statement (it is also common to use $$)
DELIMITER //

CREATE PROCEDURE order_details(
input_table_ID TINYINT
)
BEGIN    
 	SELECT menu.item_name, order_item.quantity, menu.item_price * quantity AS price
	FROM party_order, menu, order_item
	WHERE party_order.table_ID = input_table_ID AND party_order.order_ID = order_item.order_ID AND order_item.item_ID = menu.item_ID;
    END//


CREATE PROCEDURE total(
input_table_ID TINYINT
)
BEGIN    
	DECLARE total DECIMAL(7, 2);
    DECLARE tax DECIMAL(6, 2);
	
	SELECT SUM(order_item.quantity * menu.item_price), SUM(order_item.quantity * menu.item_price) * 0.0875
    INTO total, tax
	FROM party_order, menu, order_item
	WHERE party_order.table_ID = input_table_ID AND party_order.order_ID = order_item.order_ID AND order_item.item_ID = menu.item_ID;
    
    SELECT 
		CONCAT('$', total) AS 'Total',
		CONCAT('$', tax) AS 'Tax';
    
END//


CREATE PROCEDURE check_(
input_table_ID INT,
input_payment_method INT
)
BEGIN
IF input_payment_method < 1 THEN
	SELECT 'Please choose one method to pay: 
		-- 1: credit card; 
		-- 2: debit card;
		-- 3: apple pay;
		-- 4: cash;';
END IF;

CALL order_details(input_table_ID);
CALL total(input_table_ID);

UPDATE pandacheesecap.party_order
	SET party_order.payment_method = input_payment_method
	WHERE party_order.table_ID = input_table_ID;
END//

-- Change statement delimiter back to default
DELIMITER ;

-- check functions(set the table id and the payment method as the prameter)
CALL check_(1, 0);
-- CALL check_(2, 2);