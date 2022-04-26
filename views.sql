USE PandaCheeseCap;

DROP VIEW IF EXISTS order_item_view_for_chef;
DROP VIEW IF EXISTS table_status;
DROP VIEW IF EXISTS unoccupied_table;

CREATE VIEW order_item_view_for_chef AS
    SELECT 
        menu.item_name, order_item.item_ID, order_item.quantity
    FROM
        menu,
        order_item
    WHERE
        order_item.item_ID = menu.item_ID;

CREATE VIEW table_status AS
    SELECT 
        restaurant_table.table_ID,
        restaurant_table.table_size,
        restaurant_table.occupied,
        party.party_size
    FROM
		party,
        restaurant_table
	WHERE restaurant_table.party_ID = party.party_ID;

CREATE VIEW unoccupied_table AS
    SELECT 
        restaurant_table.table_ID,
        restaurant_table.table_size,
        restaurant_table.occupied
    FROM
        restaurant_table
    WHERE
        restaurant_table.occupied = FALSE;