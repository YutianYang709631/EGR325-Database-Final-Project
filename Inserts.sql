-- Change varchar of item_description to 150 (currently not long enough for some descriptions. 

insert into menu 
(item_name, item_description, item_price)
VALUES 
('Lobster Bisque', 'A classic creamy and smooth, highly seasoned soup made from lobster.', 29.99),
('Cheeseburger', '100% Pure beef patty, lettuce, tomato, spread, one slice of american cheese, with or without onions, on a freshly baked bun.', 10.99),
('Salad', 'Fresh crisp Romaine lettuce is tossed with a dressing.', 8.99),
('Steak', 'Roasted prime rib spiked with garlic and seasoning. Roasted to juicy perfection.', 25.99),
('Lobste Bisque', 'A cassic creamy and smooth, highly seasoned soup made from lobster.', 20.99),
('Cheesburger', '100% Pure bef patty, lettuce, tomato, spread, one slice of american cheese, with or without onions, on a freshly baked bun.', 12.99),
('Sala', 'Fresh crip Romaine lettuce is tossed with a dressing.', 9.99),
('Stek', 'Roasted prme rib spiked with garlic and seasoning. Roasted to juicy perfection.', 22.99);

insert into party
(party_size, party_name)
VALUES
(2,'Clement'),
(4,'Fantastic'),
(3,'Stooges'),
(5,'Yoo'),
(6,'Avengers'),
(1,'Jeff'),
(8,'Nite');

-- I don't think Waitlist needs to have autocrement if it's taking the party_ID from party.

-- not sure how to add existing party already, is this where a trigger comes into play? -- no
insert into waitlist 
(party_ID, arrive_time)
VALUES
(5, now()),
(6, now()),
(7, now());

-- 1 = occupied, 0 = not occupied
insert into restaurant_table
(table_size, occupied, party_ID)
VALUES
(4, 1, 2),
(2, 1, 1),
(8, 1, 4),
(2, 0, null),
(2, 0, null),
(6, 0, null),
(6, 0, null),
(8, 0, null),
(2, 0, null),
(4, 1, 3);

-- I don't understand why payment_method is TINYINT. Does it mean it's paid or not or does it output the amount of money they paid?
--  1 = is_cooked, 0 = not cooked
-- more data needs to be added 

insert into party_order
(table_ID, is_cooked, order_time)
VALUES
(1, 0, now()),
(2, 0, now()); 

-- I don't think we need to autoincrement order_ID in order_item if it is being pulled from else where
-- need to add data for this one too 
insert into order_item
(order_ID, item_ID, quantity)
VALUES
(1, 2, 2),
(1, 3, 2),
(1, 5, 5),
(1, 7, 4),
(2, 1, 1),
(2, 2, 3),
(2, 4, 3);

-- Does chef and waiter ID need to be incremented, if they employee ID should be the same? 
insert into employee 
(first_name, last_name, email)
VALUES
('Tom','Hardy','Tom6Rings@gmail.com'),
('Conor','McGregor','Conor2Belts@gmail.com'),
('John','Cena','CantSeeMe@gmail.com'),
('Cristiano','Ronaldo','CR7siuooooo@gmail.com'),
('Larry','Clement','lclement@calbaptist.edu');

insert into waiter
( employee_ID )
VALUES
(4),
(2);

insert into chef
( employee_ID )
VALUES
(1),
(3),
(5);

