DROP DATABASE IF EXISTS PandaCheeseCap;
CREATE DATABASE PandaCheeseCap;

-- select the database
USE PandaCheeseCap;

CREATE TABLE menu (
    item_ID SMALLINT UNSIGNED AUTO_INCREMENT,
    item_name VARCHAR(50) NOT NULL UNIQUE,
    item_description VARCHAR(300) NOT NULL UNIQUE,
    item_price DOUBLE(5 , 2 ) UNSIGNED NOT NULL,
    PRIMARY KEY (item_ID)
);

CREATE TABLE party (
    party_ID SMALLINT UNSIGNED AUTO_INCREMENT,
    party_size TINYINT NOT NULL CHECK (party_size BETWEEN 1 AND 8),
    party_name VARCHAR(20) NOT NULL,
    PRIMARY KEY (party_ID)
);

CREATE TABLE restaurant_table (
    table_ID TINYINT UNSIGNED AUTO_INCREMENT,
    table_size SMALLINT CHECK (table_size = 2 
		OR table_size = 4
        OR table_size = 6
        OR table_size = 8),
    party_ID SMALLINT UNSIGNED UNIQUE,
    occupied BOOLEAN NOT NULL DEFAULT(FALSE),
    PRIMARY KEY (table_ID),
    FOREIGN KEY (party_ID)
        REFERENCES party (party_ID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE waitlist (
    party_ID SMALLINT UNSIGNED UNIQUE,
    arrive_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (party_ID , arrive_time),
    FOREIGN KEY (party_ID)
        REFERENCES party (party_ID)
        ON UPDATE CASCADE
);

CREATE TABLE party_order (
	table_ID TINYINT UNSIGNED,
	order_ID INT UNSIGNED AUTO_INCREMENT,
	is_cooked BOOLEAN NOT NULL DEFAULT(FALSE),
	order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- 1: credit card; 
    -- 2: debit card;
    -- 3: apple pay;
    -- 4: cash;
	payment_method TINYINT UNSIGNED DEFAULT(0), 
	PRIMARY KEY (order_ID),
	FOREIGN KEY (table_ID) 
		REFERENCES restaurant_table(table_ID) 
);

CREATE TABLE order_item (
    order_ID INT UNSIGNED,
    item_ID SMALLINT UNSIGNED,
    quantity TINYINT UNSIGNED,
    PRIMARY KEY (order_ID , item_ID),
    FOREIGN KEY (order_ID)
        REFERENCES party_order (order_ID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (item_ID)
        REFERENCES menu (item_ID)
);

CREATE TABLE employee (
    employee_ID SMALLINT UNSIGNED AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE,
    PRIMARY KEY (employee_ID)
);

CREATE TABLE waiter (
    employee_ID SMALLINT UNSIGNED UNIQUE,
    PRIMARY KEY (employee_ID),
    FOREIGN KEY (employee_ID)
        REFERENCES employee (employee_ID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE chef (
    employee_ID SMALLINT UNSIGNED UNIQUE,
    PRIMARY KEY (employee_ID),
    FOREIGN KEY (employee_ID)
        REFERENCES employee (employee_ID)
        ON UPDATE CASCADE ON DELETE CASCADE
);