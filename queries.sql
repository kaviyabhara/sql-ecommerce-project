create database e_commerce;
use e_commerce;
create table categories(category_id int primary key,category_name varchar(30));
drop table categories;
create table suppliers(suppliers_id int primary key,suppliers_name varchar(40),
contact_person varchar(20),phone varchar(10),email varchar(20) unique);

create table products(product_id int primary key auto_increment,product_name varchar(20),
price decimal(10,2) not null,stock_quantity int default 0,brand varchar(30),suppliers_id int,
category_id int, foreign key(category_id) references categories(category_id),
suppliers_id int,foreign key(suppliers_id) references suppliers(suppliers_id));
drop table products;

ALTER TABLE products ADD COLUMN supplier_id INT;



create table customers(customer_id int primary key auto_increment,first_name varchar(30) not null,
last_name varchar(30),email varchar(30) unique,phone varchar(15) unique,city varchar(30),
created_at timestamp default current_timestamp);

create table address(address_id int primary key auto_increment,customer_id int,
address_line varchar(200),city varchar(30),
state varchar(20),pincode varchar(10),
foreign key(customer_id) references customers(customer_id));

create table orders(order_id int primary key auto_increment,customer_id int,
order_date datetime default current_timestamp,
total_amount decimal(10,2),order_status varchar(30),
foreign key(customer_id) references customers(customer_id));

create table shopping_cart(cart_id int primary key auto_increment,
customer_id int,
created_at timestamp default current_timestamp,
foreign key(customer_id) references customers(customer_id));

create table order_items(order_item_id int primary key auto_increment,
order_id int,product_id int,
quantity int not null,unit_price decimal(10,2) not null,
foreign key(order_id) references orders(order_id),
foreign key(product_id) references products(product_id));

CREATE TABLE cart_items (
    cart_item_id INT AUTO_INCREMENT PRIMARY KEY,
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,

    FOREIGN KEY (cart_id)
        REFERENCES shopping_cart(cart_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);
describe shopping_cart;
show create table shopping_cart;
drop table shopping_cart;
DROP TABLE PAYMENTS;

CREATE TABLE payments(payment_id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT,payment_method VARCHAR(30),
payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
amount DECIMAL(10,2),
payment_status VARCHAR(30),
FOREIGN KEY(order_id) REFERENCES orders(order_id));


CREATE TABLE reviews(reviews_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,product_id INT,
rating INT CHECK(rating BETWEEN 1 AND 5),
reviews_text text,
reviews_date DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY(CUSTOMER_ID) REFERENCES customers(customer_id),
FOREIGN KEY(product_id)REFERENCES products(product_id));


CREATE TABLE shipments(shipment_id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT,shippment_date DATE,delivery_date DATE,delivery_status VARCHAR(20),
courier_name VARCHAR(50),
FOREIGN KEY(order_id) REFERENCES orders(order_id));


INSERT INTO Categories
VALUES
(1,'Electronics'),
(2,'Clothing'),
(3,'Books'),
(4,'Home Appliances'),
(5,'Sports');


INSERT INTO Suppliers

VALUES
(1,'Tech Distributors','Raj Kumar','9876543210','tech@gmail.com'),
(2,'Fashion Hub','Priya Sharma','9876543211','fashion@gmail.com'),
(3,'Book World','Arun Kumar','9876543212','books@gmail.com'),
(4,'Home Needs','Sneha Rao','9876543213','home@gmail.com'),
(5,'Sports Zone','Vijay Singh','9876543214','sports@gmail.com');


INSERT INTO Customers
(first_name,last_name,email,phone,city)
VALUES
('Rahul','Verma','rahul1@gmail.com','9000000006','Chennai'),
('Anita','Sharma','anita1@gmail.com','9000000007','Madurai'),
('Vikas','Singh','vikas1@gmail.com','9000000008','Coimbatore'),
('Pooja','Rani','pooja1@gmail.com','9000000009','Trichy'),
('Suresh','Kumar','suresh1@gmail.com','9000000010','Salem'),
('Deepa','Rao','deepa1@gmail.com','9000000011','Erode'),
('Ajay','Patel','ajay1@gmail.com','9000000012','Vellore'),
('Neha','Jain','neha1@gmail.com','9000000013','Chennai'),
('Ravi','Mohan','ravi1@gmail.com','9000000014','Madurai'),
('Kiran','Das','kiran1@gmail.com','9000000015','Coimbatore'),
('Manoj','Nair','manoj1@gmail.com','9000000016','Trichy'),
('Divya','Iyer','divya1@gmail.com','9000000017','Salem'),
('Arvind','Reddy','arvind1@gmail.com','9000000018','Erode'),
('Lakshmi','Priya','lakshmi1@gmail.com','9000000019','Vellore'),
('Ganesh','Babu','ganesh1@gmail.com','9000000020','Chennai'),
('Hari','Krishnan','hari1@gmail.com','9000000021','Madurai'),
('Nisha','Raman','nisha1@gmail.com','9000000022','Chennai'),
('Praveen','Kumar','praveen1@gmail.com','9000000023','Salem'),
('Keerthana','S','keerthana1@gmail.com','9000000024','Trichy'),
('Surya','Prakash','surya1@gmail.com','9000000025','Erode');

select * from customers;

INSERT INTO Address
(customer_id,address_line,city,state,pincode)
VALUES
(1,'12 Anna Nagar','Chennai','Tamil Nadu','600001'),
(2,'45 KK Nagar','Madurai','Tamil Nadu','625001'),
(3,'23 Gandhipuram','Coimbatore','Tamil Nadu','641001'),
(4,'56 Main Road','Trichy','Tamil Nadu','620001'),
(5,'89 Junction','Salem','Tamil Nadu','636001'),
(6,'10 Park Street','Erode','Tamil Nadu','638001'),
(7,'22 Lake View','Vellore','Tamil Nadu','632001'),
(8,'34 Temple Road','Chennai','Tamil Nadu','600002'),
(9,'11 Market Street','Madurai','Tamil Nadu','625002'),
(10,'9 Cross Road','Coimbatore','Tamil Nadu','641002'),
(11,'78 North Street','Trichy','Tamil Nadu','620002'),
(12,'43 South Road','Salem','Tamil Nadu','636002'),
(13,'55 West Street','Erode','Tamil Nadu','638002'),
(14,'91 East Road','Vellore','Tamil Nadu','632002'),
(15,'17 Garden Road','Chennai','Tamil Nadu','600003'),
(16,'25 River Road','Madurai','Tamil Nadu','625003'),
(17,'67 Hill Street','Coimbatore','Tamil Nadu','641003'),
(18,'88 Beach Road','Trichy','Tamil Nadu','620003'),
(19,'33 Green Avenue','Salem','Tamil Nadu','636003'),
(20,'41 College Road','Erode','Tamil Nadu','638003');

DELETE FROM Address;
DELETE FROM Customers;

ALTER TABLE Customers AUTO_INCREMENT = 1;
set sql_safe_updates=0;

INSERT INTO Products
(product_name,category_id,supplier_id,price,stock_quantity,brand)
VALUES
('Laptop',1,1,65000,50,'Dell'),
('Smartphone',1,1,25000,100,'Samsung'),
('Tablet',1,1,18000,75,'Lenovo'),
('Headphones',1,1,2500,120,'Sony'),
('Smart Watch',1,1,5000,80,'Noise'),
('T-Shirt',2,2,799,200,'Puma'),
('Jeans',2,2,1499,150,'Levis'),
('Jacket',2,2,2499,60,'Nike'),
('Shoes',2,2,2999,100,'Adidas'),
('Cap',2,2,499,120,'Puma'),
('Novel Book',3,3,499,150,'Penguin'),
('SQL Guide',3,3,799,90,'TechBooks'),
('Python Basics',3,3,699,85,'TechBooks'),
('Mixer Grinder',4,4,3500,40,'Prestige'),
('Microwave Oven',4,4,12000,25,'LG'),
('Water Purifier',4,4,9000,35,'Kent'),
('Cricket Bat',5,5,1800,60,'SS'),
('Football',5,5,900,100,'Nivia'),
('Badminton Racket',5,5,1500,70,'Yonex'),
('Gym Gloves',5,5,600,90,'Cosco');


INSERT INTO Shopping_Cart (customer_id)
VALUES
(1),(2),(3),(4),(5),
(6),(7),(8),(9),(10),
(11),(12),(13),(14),(15),
(16),(17),(18),(19),(20);

INSERT INTO Orders
(customer_id,total_amount,order_status)
VALUES
(1,65000,'Delivered'),
(2,25000,'Delivered'),
(3,18000,'Shipped'),
(4,2500,'Delivered'),
(5,5000,'Pending'),
(6,799,'Delivered'),
(7,1499,'Delivered'),
(8,2499,'Shipped'),
(9,2999,'Delivered'),
(10,499,'Delivered'),

(11,499,'Delivered'),
(12,799,'Pending'),
(13,699,'Delivered'),
(14,3500,'Shipped'),
(15,12000,'Delivered'),
(16,9000,'Delivered'),
(17,1800,'Shipped'),
(18,900,'Delivered'),
(19,1500,'Delivered'),
(20,600,'Pending'),

(1,25000,'Delivered'),
(2,2999,'Delivered'),
(3,3500,'Delivered'),
(4,1500,'Shipped'),
(5,9000,'Delivered'),
(6,1800,'Delivered'),
(7,12000,'Pending'),
(8,2500,'Delivered'),
(9,499,'Delivered'),
(10,799,'Delivered'),

(11,699,'Delivered'),
(12,1499,'Shipped'),
(13,5000,'Delivered'),
(14,65000,'Delivered'),
(15,25000,'Delivered'),
(16,2999,'Pending'),
(17,1500,'Delivered'),
(18,900,'Delivered'),
(19,1800,'Shipped'),
(20,3500,'Delivered');

INSERT INTO Order_Items
(order_id,product_id,quantity,unit_price)
VALUES
(1,1,1,65000),
(1,4,1,2500),

(2,2,1,25000),
(2,10,2,499),

(3,3,1,18000),
(3,11,1,499),

(4,4,1,2500),
(4,20,1,600),

(5,5,1,5000),
(5,18,1,900),

(6,6,2,799),
(6,10,1,499),

(7,7,1,1499),
(7,19,1,1500),

(8,8,1,2499),
(8,20,2,600),

(9,9,1,2999),
(9,17,1,1800),

(10,10,2,499),
(10,18,1,900),

(11,11,1,499),
(11,6,1,799),

(12,12,1,799),
(12,7,1,1499),

(13,13,1,699),
(13,8,1,2499),

(14,14,1,3500),
(14,15,1,12000),

(15,15,1,12000),
(15,16,1,9000),

(16,16,1,9000),
(16,17,1,1800),

(17,17,1,1800),
(17,18,1,900),

(18,18,1,900),
(18,19,1,1500),

(19,19,1,1500),
(19,20,1,600),

(20,20,1,600),
(20,1,1,65000);


INSERT INTO Payments
(order_id,payment_method,amount,payment_status)
VALUES
(1,'Credit Card',65000,'Paid'),
(2,'UPI',25000,'Paid'),
(3,'Debit Card',18000,'Paid'),
(4,'UPI',2500,'Paid'),
(5,'Cash On Delivery',5000,'Pending'),
(6,'UPI',799,'Paid'),
(7,'Credit Card',1499,'Paid'),
(8,'Debit Card',2499,'Paid'),
(9,'UPI',2999,'Paid'),
(10,'UPI',499,'Paid');


INSERT INTO Reviews
(customer_id,product_id,rating,reviewS_text)
VALUES
(1,1,5,'Excellent laptop'),
(2,2,4,'Good smartphone'),
(3,3,5,'Very useful tablet'),
(4,4,4,'Nice sound quality'),
(5,5,5,'Worth buying'),
(6,6,4,'Good quality'),
(7,7,5,'Comfortable jeans'),
(8,8,4,'Warm jacket'),
(9,9,5,'Excellent shoes'),
(10,10,4,'Nice cap'),
(11,11,5,'Interesting book'),
(12,12,5,'Helpful SQL guide'),
(13,13,4,'Good for beginners'),
(14,14,5,'Powerful mixer'),
(15,15,5,'Excellent microwave'),
(16,16,4,'Works well'),
(17,17,5,'Great cricket bat'),
(18,18,4,'Good football'),
(19,19,5,'Excellent racket'),
(20,20,4,'Useful gloves');


INSERT INTO Shipments
(order_id,shipPment_date,delivery_date,delivery_status,courier_name)
VALUES
(1,'2026-05-01','2026-05-03','Delivered','BlueDart'),
(2,'2026-05-02','2026-05-04','Delivered','DTDC'),
(3,'2026-05-03',NULL,'In Transit','Delhivery'),
(4,'2026-05-04','2026-05-06','Delivered','BlueDart'),
(5,NULL,NULL,'Pending','Ecom Express'),
(6,'2026-05-06','2026-05-08','Delivered','DTDC'),
(7,'2026-05-07','2026-05-09','Delivered','BlueDart'),
(8,'2026-05-08',NULL,'In Transit','Delhivery'),
(9,'2026-05-09','2026-05-11','Delivered','DTDC'),
(10,'2026-05-10','2026-05-12','Delivered','BlueDart');


INSERT INTO cart_items
(cart_id, product_id, quantity)
VALUES
(1,1,1),
(2,2,2),
(3,3,1),
(4,4,3),
(5,5,1),
(6,6,2),
(7,7,1),
(8,8,1),
(9,9,2),
(10,10,1),
(11,11,1),
(12,12,2),
(13,13,1),
(14,14,1),
(15,15,1),
(16,16,2),
(17,17,1),
(18,18,3),
(19,19,1),
(20,20,2);

-- check data exits--
SELECT COUNT(*) FROM Customers;
SELECT COUNT(*) FROM Products;
SELECT COUNT(*) FROM Shopping_Cart;
SELECT COUNT(*) FROM Orders;
SELECT COUNT(*) FROM Orders;
SELECT COUNT(*) FROM Order_Items;
SELECT COUNT(*) FROM Payments;
select count(*) from categories;
select count(*) from shipments;
select count(*) from suppliers;
select count(*) from address;
select count(*) from cart_items;
select count(*) from reviews;


-- retrieve all customers --
SELECT * FROM customers;

-- count total customers --
SELECT COUNT(*) AS total_customers FROM customers;

-- display all products costing more than 5000--
SELECT * FROM products
WHERE price>5000;

-- find all products belonging to electronic category-- 
SELECT * FROM products p JOIN categories c
ON p.category_id=c.category_id
WHERE c.category_name="electronics";
-- another query--
SELECT * FROM products 
WHERE category_id=1;

-- show all order with status delivered--
SELECT * FROM orders
WHERE order_status="delivered";

-- find total products available--
SELECT COUNT(*) as totl_products
FROM products;

-- find products with stock less than 50--
SELECT * FROM products
WHERE stock_quantity<50;

-- find average product price --
SELECT AVG(price) FROM products;

-- find highest priced product--
SELECT * FROM PRODUCTS ORDER BY price DESC LIMIT 1;

-- find lowest priced product--
SELECT * FROM products ORDER BY price ASC LIMIT 1;

-- count products category wise--
SELECT category_id,COUNT(*) FROM products GROUP BY category_id;

-- find total orders--
SELECT COUNT(*) FROM orders;

-- find total revenue--
SELECT SUM(TOTAL_AMOUNT) FROM ORDERS;

-- find all customers from chennai--
SELECT * FROM customers
WHERE city="chennai";

-- find products supplied by supplier 1--
SELECT * FROM products WHERE supplier_id=1;

-- display all shipments in transit--
SELECT * FROM shipments
WHERE delivery_status="in transit";

-- find customers who have written reviews--
SELECT DISTINCT customer_id FROM reviews;

-- show customer names with their orders--
SELECT c.first_name,o.order_id,o.total_amount
FROM customers c JOIN orders o
ON c.customer_id=o.order_id;

-- show products with category name--
SELECT p.product_name,c.category_name 
FROM categories c JOIN products p
ON c.category_id=p.category_id;

-- show products with suppliers name--
SELECT p.product_name,s.suppliers_name
FROM products p JOIN suppliers s
ON p.supplier_id=p.product_id;

-- find top 5 customers by spending--
SELECT customer_id,
SUM(total_amount) AS Totalspent
FROM orders
GROUP BY customer_id
ORDER BY Totalspent DESC
LIMIT 5;

-- find top selling products--
SELECT product_id,SUM(quantity) AS totalsold
FROM order_items
GROUP BY product_id
ORDER BY totalsold DESC;

-- find category generating highest revenue--
SELECT c.category_name,
SUM(oi.quantity*oi.unit_price) AS Revenue
FROM Order_Items oi
JOIN Products p ON oi.product_id=p.product_id
JOIN Categories c ON p.category_id=c.category_id
GROUP BY c.category_name
ORDER BY Revenue DESC;

-- find customer with more than one order--
SELECT customer_id,
COUNT(*) OrdersCount
FROM Orders
GROUP BY customer_id
HAVING COUNT(*)>1;

-- find customers who never ordered--
SELECT c.customer_id
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id=o.customer_id
WHERE o.order_id IS NULL;

-- Find products never ordered.--
SELECT p.product_name
FROM Products p
LEFT JOIN Order_Items oi
ON p.product_id=oi.product_id
WHERE oi.product_id IS NULL;

-- Find average order value--
SELECT AVG(total_amount)
FROM Orders;

-- Find city-wise revenue--
SELECT c.city,
SUM(o.total_amount)
FROM Customers c
JOIN Orders o
ON c.customer_id=o.customer_id
GROUP BY c.city;


-- Find customer with maximum orders--
SELECT customer_id,
COUNT(*) TotalOrders
FROM Orders
GROUP BY customer_id
ORDER BY TotalOrders DESC
LIMIT 1;

-- Find most reviewed product--
SELECT product_id,
COUNT(*) Reviews
FROM Reviews
GROUP BY product_id
ORDER BY Reviews DESC;

-- Find average rating per product--
SELECT product_id,
AVG(rating)
FROM Reviews
GROUP BY product_id;

-- Find orders with payment pending--
SELECT *
FROM Payments
WHERE payment_status='Pending';

-- Find delivered orders count--
SELECT COUNT(*)
FROM Shipments
WHERE delivery_status='Delivered';

-- Find products sold by quantity--
SELECT product_id,
SUM(quantity)
FROM Order_Items
GROUP BY product_id;

-- find supplier supplying most products--
SELECT supplier_id,
COUNT(*) Products
FROM Products
GROUP BY supplier_id
ORDER BY Products DESC;

-- Find customers who reviewed and purchased the same product--
SELECT DISTINCT r.customer_id
FROM Reviews r
JOIN Orders o
ON r.customer_id=o.customer_id;

-- Find monthly revenue--
SELECT MONTH(order_date),
SUM(total_amount)
FROM Orders
GROUP BY MONTH(order_date);

-- Second Highest Spending Customer--
SELECT customer_id,
SUM(total_amount) TotalSpent
FROM Orders
GROUP BY customer_id
ORDER BY TotalSpent DESC
LIMIT 1 OFFSET 1;

-- Customer Revenue Ranking--
SELECT customer_id,
SUM(total_amount) TotalSpent,
RANK() OVER(
ORDER BY SUM(total_amount) DESC
) AS CustomerRank
FROM Orders
GROUP BY customer_id;

-- Product Sales Ranking--
SELECT product_id,
SUM(quantity) TotalSold,
DENSE_RANK() OVER(
ORDER BY SUM(quantity) DESC
) AS SalesRank
FROM Order_Items
GROUP BY product_id;

-- Running Revenue--
SELECT order_date,
SUM(total_amount) OVER(
ORDER BY order_date
) RunningRevenue
FROM Orders;

-- Top Product per Category--
SELECT *
FROM
(
SELECT p.product_name,
c.category_name,
SUM(oi.quantity) Sold,
ROW_NUMBER() OVER(
PARTITION BY c.category_name
ORDER BY SUM(oi.quantity) DESC
) rn
FROM Order_Items oi
JOIN Products p ON oi.product_id=p.product_id
JOIN Categories c ON p.category_id=c.category_id
GROUP BY p.product_name,c.category_name
)t
WHERE rn=1;

-- Stored Procedure: Get Customer Orders--
DELIMITER //

CREATE PROCEDURE GetCustomerOrders(IN custid INT)
BEGIN
SELECT *
FROM Orders
WHERE customer_id=custid;
END //

DELIMITER ;

-- Trigger: Reduce Stock After Purchase--
DELIMITER //

CREATE TRIGGER trg_reduce_stock
AFTER INSERT ON Order_Items
FOR EACH ROW
BEGIN
UPDATE Products
SET stock_quantity=stock_quantity-NEW.quantity
WHERE product_id=NEW.product_id;
END //

DELIMITER ;

-- Detect Overselling--
SELECT product_id
FROM Products
WHERE stock_quantity < 0;

-- Top 10 Customers Contribution %--
SELECT customer_id,
SUM(total_amount),
ROUND(
SUM(total_amount)*100/
(SELECT SUM(total_amount) FROM Orders),2
) AS RevenuePercent
FROM Orders
GROUP BY customer_id;

-- Category Contribution %--
SELECT c.category_name,
ROUND(
SUM(oi.quantity*oi.unit_price)*100/
(
SELECT SUM(quantity*unit_price)
FROM Order_Items
),2
) RevenuePercent
FROM Order_Items oi
JOIN Products p ON oi.product_id=p.product_id
JOIN Categories c ON p.category_id=c.category_id
GROUP BY c.category_name;

-- Views--
-- Customer Order Summary View--
CREATE VIEW vw_customer_order_summary AS
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id,c.first_name,c.last_name;

SELECT * FROM vw_customer_order_summary;

-- Product Sales View--
CREATE VIEW vw_product_sales AS
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_sold,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM Products p
JOIN Order_Items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id,p.product_name;

SELECT * FROM vw_product_sales;

-- Category Revenue View--
CREATE VIEW vw_category_revenue AS
SELECT
    c.category_name,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM Categories c
JOIN Products p
ON c.category_id = p.category_id
JOIN Order_Items oi
ON p.product_id = oi.product_id
GROUP BY c.category_name;

SELECT * FROM vw_category_revenue;

