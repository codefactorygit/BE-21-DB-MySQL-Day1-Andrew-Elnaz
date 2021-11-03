-- Day 2 extends day 1 example to look at joins
CREATE TABLE users (
    user_id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name VARCHAR(55) NOT NULL,
    last_name VARCHAR(55) NOT NULL,
    email VARCHAR(55) NOT NULL,
    birth_date date NOT NULL
);

CREATE TABLE products(
    product_id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    product_name varchar(55) NOT NULL,
    description varchar (128) NOT NULL,
    price decimal(8,2) NOT NULL
);

CREATE TABLE orders(
    order_id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    order_details varchar(55) NOT NULL,
    fk_user_id int NOT NULL,
    FOREIGN KEY (fk_user_id) REFERENCES users (user_id)
);

CREATE TABLE order_details(
    detail_id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    fk_order_id int NOT NULL,
    fk_product_id int NOT NULL,
    FOREIGN KEY (fk_order_id) REFERENCES orders (order_id),
    FOREIGN KEY (fk_product_id) REFERENCES products (product_id)
);

-- Insert data to tables
-- users
INSERT INTO users (first_name, last_name, email, birth_date) 
VALUES ('Joe', 'Bloggs', 'joe@blogs.com', '1980-07-18');

INSERT INTO users (first_name, last_name, email, birth_date) 
VALUES ('Jolly', 'Roger', 'jolly@good.com', '1989-03-28');

INSERT INTO users (first_name, last_name, email, birth_date) 
VALUES ('Boris', 'Levinsky', 'boris@lev.com', '1999-11-02');

INSERT INTO users (first_name, last_name, email, birth_date) 
VALUES ('Winnie', 'Pooh', 'winnie@pooh.com', '1989-09-13');

-- products
INSERT INTO products(product_name, description, price)
VALUES ('iPhone12', 'expensive phone', 800.50);

INSERT INTO products(product_name, description, price)
VALUES ('Samsung-G21', 'new samsung phone', 600.50);

INSERT INTO products(product_name, description, price)
VALUES ('Samsung-A50', 'older samsung phone', 400.50);

INSERT INTO products(product_name, description, price)
VALUES ('iPad-XR4', 'expensive apple tablet', 2000.50);

-- orders
INSERT INTO orders (order_details, fk_user_id) VALUES ('normal', 2);

INSERT INTO orders (order_details, fk_user_id) VALUES ('international', 1);

INSERT INTO orders (order_details, fk_user_id) VALUES ('normal', 4);

INSERT INTO orders (order_details, fk_user_id) VALUES ('normal', 3);

-- order details
INSERT INTO order_details (fk_order_id, fk_product_id) VALUES (1, 2);
INSERT INTO order_details (fk_order_id, fk_product_id) VALUES (2, 1);
INSERT INTO order_details (fk_order_id, fk_product_id) VALUES (3, 2);
INSERT INTO order_details (fk_order_id, fk_product_id) VALUES (4, 3);

-- JOINS ##################################
-- Join and search in users table
SELECT * FROM `users` JOIN orders 
on orders.fk_user_id = users.user_id
join order_details on order_details.fk_order_id = orders.order_id
join products on products.product_id = order_details.fk_product_id
WHERE user_id = 2

-- returns:
-- 2
-- Jolly
-- Roger
-- jolly@good.com
-- 1989-03-28
-- 1
-- normal
-- 2
-- 1
-- 1
-- 2
-- 2
-- Samsung-G21
-- new samsung phone
-- 600.5

-- Now refine search
SELECT orders.order_id, products.product_id, products.price FROM `users` JOIN orders on orders.fk_user_id = users.user_id join order_details on order_details.fk_order_id = orders.order_id join products on products.product_id = order_details.fk_product_id WHERE user_id = 2;

-- returns simply:
-- 1
-- 2
-- 600.50


SELECT * FROM `users` join orders
on orders.fk_user_id = users.user_id;

