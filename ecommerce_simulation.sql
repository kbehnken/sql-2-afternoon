-- Create 3 tables: users, products, and orders. Users need a name and an email. Products need a name and a price. Orders need a ref to product. All 3 need primary keys.

CREATE TABLE people (
  person_id SERIAL PRIMARY KEY NOT NULL,
  name TEXT,
  email TEXT
);
CREATE TABLE products (
  product_id SERIAL PRIMARY KEY NOT NULL,
  name TEXT,
  price INTEGER 
);
CREATE TABLE purchases (
  purchase_id SERIAL PRIMARY KEY NOT NULL,
  product_id INTEGER, 
  FOREIGN KEY(product_id) REFERENCES products(product_id)
);

-- Add some data to fill up each table.

INSERT INTO people (name, email)
VALUES
    ('Bilbo', 'bbaggins@shire.com'),
    ('Frodo', 'fbaggins@shire.com'),
    ('Sam', 'sgamgee@shire.com');
INSERT INTO products (name, price)
VALUES
    ('shoes', 100),
    ('shirt', 50),
    ('purse', 150);
INSERT INTO purchases (product_id)
VALUES
    (2),
    (3);
    (1),
    (2),
    (1),
    (3),
    (4),
    (4),
    (1),
    (2),
    (3),
    (4);

-- Get all products for the first order.

SELECT * FROM purchases
WHERE purchase_id = 1;

-- Get all orders.

SELECT * FROM purchases;

-- Get the total cost of an order ( sum the price of all products on an order ).

SELECT SUM() FROM ;

-- Add a foreign key reference from orders to users.

ALTER TABLE purchases
ADD COLUMN person_id INTEGER REFERENCES people(person_id);

-- Update the orders table to link a user to each order.

UPDATE purchases
SET person_id = 2
WHERE purchase_id = 1;
select * from purchases;

UPDATE purchases
SET person_id = 3
WHERE purchase_id = 4;
select * from purchases;

-- Run queries against your data.

SELECT * FROM purchases
WHERE product_id = 4;

-- Get all orders for a user.

SELECT * FROM purchases
WHERE person_id = 2;

-- Get how many orders each user has.

SELECT COUNT(*), person_id FROM purchases
GROUP BY person_id;