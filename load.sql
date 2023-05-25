



DROP TABLE IF EXISTS contains_code;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS receives_order;
DROP TABLE IF EXISTS pays_with;
DROP TABLE IF EXISTS payment_method;
DROP TABLE IF EXISTS phone_number;
DROP TABLE IF EXISTS customer;




DROP TABLE IF EXISTS ingredients;
DROP TABLE IF EXISTS promotion;
DROP TABLE IF EXISTS requires;
DROP TABLE IF EXISTS recipe;

DROP TABLE IF EXISTS supplies;
DROP TABLE IF EXISTS store_phone;
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS supplier;



DROP TABLE IF EXISTS meat;
DROP TABLE IF EXISTS produce;
DROP TABLE IF EXISTS supplier_contact;
DROP TABLE IF EXISTS dairy;
DROP TABLE IF EXISTS medicinal;
DROP TABLE IF EXISTS confectionery;
DROP TABLE IF EXISTS personal_hygiene;

DROP TABLE IF EXISTS ad_postcode;
DROP TABLE IF EXISTS product;



CREATE TABLE customer(
  email VARCHAR(30) PRIMARY KEY,
  phoneNum VARCHAR(30) UNIQUE
  );


CREATE TABLE payment_method(
  card_num CHAR(16) PRIMARY KEY,
  cvv INT NOT NULL,
  expDate VARCHAR(5) NOT NULL,
  cardName VARCHAR(30) NOT NULL,
  billAdd VARCHAR(120) NOT NULL
  );


CREATE TABLE address(
  addressLine1 VARCHAR(30) NOT NULL,
  addressLine2 VARCHAR(30),
  suburb VARCHAR(30) NOT NULL,
  postcode INT NOT NULL,
  city VARCHAR(50) NOT NULL,

  addressID INT PRIMARY KEY 
  );


CREATE TABLE supplier(
  supName VARCHAR(30) UNIQUE NOT NULL,

  supplierID int PRIMARY KEY
  );


CREATE TABLE store(
  storeID INT PRIMARY KEY,
  addressID INT NOT NULL,
  phone VARCHAR(30) UNIQUE NOT NULL,

  FOREIGN KEY (addressID)
  REFERENCES address(addressID)
  );


CREATE TABLE orders(
  orderNum INT PRIMARY KEY,
  cardNum CHAR(16) NOT NULL,
  storeID INT NOT NULL,
  addressID INT NOT NULL,
  email VARCHAR(30) NOT NULL,
  orderDate DATETIME,

  FOREIGN KEY (cardNum)
  REFERENCES payment_method(card_num),

  FOREIGN KEY (storeID)
  REFERENCES store(storeID),
  
  FOREIGN KEY (addressID)
  REFERENCES address(addressID),
  
  FOREIGN KEY (email)
  REFERENCES customer(email)
  );


CREATE TABLE product(
  barcode INT PRIMARY KEY,
  amountInStock INT NOT NULL,
  name VARCHAR(100) NOT NULL,
  useByDate DATE,
  costPerUnit DECIMAL(10,2) NOT NULL
  );


CREATE TABLE recipe(
  recipeName VARCHAR(80) PRIMARY KEY,
  instruction VARCHAR(1000) NOT NULL
  );


CREATE TABLE ingredients(
  prodName VARCHAR(100),
  recipeName VARCHAR(100),
  productQuantity DECIMAL(10,2) NOT NULL,
  
  PRIMARY KEY (prodName, recipeName),

  FOREIGN KEY (recipeName)
  REFERENCES recipe(recipeName)
  );


CREATE TABLE promotion(
  promotionCode VARCHAR(50),
  discountPercentage DECIMAL(5,2) NOT NULL,
  promotionDescription VARCHAR(200),
  promotionStartDate DATE NOT NULL,
  promotionLength INT NOT NULL,
  productBarcode INT NOT NULL,

  PRIMARY KEY (promotionCode),

  FOREIGN KEY (productBarcode)
  REFERENCES product(barcode)
  );


CREATE TABLE requires(
  recipeName VARCHAR(50),
  productCode INT,
  
  PRIMARY KEY (recipeName, productCode),
  
  FOREIGN KEY (productCode)
  REFERENCES product(barcode),
  
  FOREIGN KEY (recipeName)
  REFERENCES recipe(recipeName)
  );


CREATE TABLE contains_code(
  orderNum INT,
  barcode INT,
  
  PRIMARY KEY (orderNum, barcode),
  
  FOREIGN KEY (barcode)
  REFERENCES product(barcode),

  FOREIGN KEY (orderNum)
  REFERENCES orders(orderNum)
  );


CREATE TABLE supplies(
  supID INT,
  storeID INT ,
  prodCode INT,
  
  PRIMARY KEY (supID, storeID, prodCode),
  
  CONSTRAINT fk_supid FOREIGN KEY (supID)
  REFERENCES supplier(supplierID),
  
  CONSTRAINT fk_storID FOREIGN KEY (storeID)
  REFERENCES store(storeID),
  
  CONSTRAINT fk_prodCode FOREIGN KEY (prodCode)
  REFERENCES product(barcode)
  );


CREATE TABLE receives_order(
  addressID INT,
  email VARCHAR(30),
  
  PRIMARY KEY(addressID, email),
  
  CONSTRAINT fk_addID FOREIGN KEY (addressID)
  REFERENCES store(addressID),
  
  CONSTRAINT fk_email FOREIGN KEY (email)
  REFERENCES customer(email)
  );


CREATE TABLE pays_with(
  card_num CHAR(16),
  email VARCHAR (30),
  
  PRIMARY KEY(card_num, email),
  
  CONSTRAINT fk_cardnum FOREIGN KEY (card_num)
  REFERENCES payment_method(card_num),
  
  CONSTRAINT fk_email_customer FOREIGN KEY (email)
  REFERENCES customer(email)
  );


CREATE TABLE phone_number(
  phone_num VARCHAR(12) PRIMARY KEY,
  fname VARCHAR(30),
  lname VARCHAR(30),
  
  CONSTRAINT fk_phone FOREIGN KEY (phone_num)
  REFERENCES customer(phoneNum)
  );


CREATE TABLE meat(
  prodCode INT PRIMARY KEY,
  animal VARCHAR(30),
  
  CONSTRAINT fk_prodcodeMeat FOREIGN KEY (prodCode)
  REFERENCES product(barcode)
  );


CREATE TABLE produce(
  prodCode INT PRIMARY KEY,
  name VARCHAR(30),
  organic BOOLEAN,
  
  CONSTRAINT fk_producecode FOREIGN KEY (prodCode)
  REFERENCES product(barcode)
  );


CREATE TABLE supplier_contact(
	contactType VARCHAR (30),
	contactValue VARCHAR(50) NOT NULL UNIQUE,
	iD INT,
  
  PRIMARY KEY(contactType, iD),
  
  FOREIGN KEY (iD)
  REFERENCES product(barcode)
  );


CREATE TABLE dairy(
	prodCode INT PRIMARY KEY,
	dairyType VARCHAR (30),

	FOREIGN KEY (ProdCode)
  REFERENCES product(barcode)
  );


CREATE TABLE medicinal(
	prodCode INT PRIMARY KEY,
	dosage INT,
	
  FOREIGN KEY (prodCode)
  REFERENCES product(barcode)
  );


CREATE TABLE confectionery(
	prodCode INT PRIMARY KEY,
	conType VARCHAR (30),
	
  FOREIGN KEY (prodCode)
  REFERENCES product(barcode)
  );


CREATE TABLE personal_hygiene(
	prodCode INT PRIMARY KEY,
	scent VARCHAR (30),
	
  FOREIGN KEY (prodCode)
  REFERENCES product(barcode)
  );


CREATE TABLE store_phone(
	phone VARCHAR(50) PRIMARY KEY,
	storeName VARCHAR(50) NOT NULL,
	storeHours VARCHAR (50),

	FOREIGN KEY (phone)
  REFERENCES store(phone)
  );



INSERT INTO customer (email, phoneNum) VALUES
('thibaud.roy@gmail.com', '1234567890'),
('vincent.lee@gmail.com', '9876543210'),
('jay.dance@gmail.com', '5555555555'),
('amy.le@gmail.com', '9999999999');


INSERT INTO payment_method (card_num, cvv, expDate, cardName, billAdd) VALUES
('1234567890123456', 123, '12/25', 'Thibaud Roy', '123 Main St'),
('9876543210987654', 456, '03/24', 'Vincent Lee', '456 Elm St');


INSERT INTO address (addressLine1, addressLine2, suburb, postcode, city, addressID) VALUES
('123 First St', 'Apt 1A', 'North Dunedin', 11111, 'Dunedin', 1),
('456 Second St', 'Apt 2B', 'Dunedin Central', 22222, 'Dunedin', 2);


INSERT INTO supplier (supName, supplierID) VALUES
('Supplier A', 1),
('Supplier B', 2);


INSERT INTO store (storeID, addressID, phone) VALUES
(1, 1, '111-111-1111'),
(2, 2, '222-222-2222');


INSERT INTO orders (orderNum, cardNum, storeID, addressID, email, orderDate) VALUES
(1, '1234567890123456', 1, 1, 'thibaud.roy@gmail.com', '2023-05-01 10:00:00'),
(2, '9876543210987654', 2, 2, 'vincent.lee@gmail.com', '2023-05-02 11:00:00');


INSERT INTO product (barcode, amountInStock, name, useByDate, costPerUnit) VALUES
(1001, 50, 'Product A', '2023-06-01', 10.99),
(1002, 30, 'Product B', '2023-06-15', 5.99);


INSERT INTO recipe (recipeName, instruction) VALUES
('Recipe A', 'Instructions for Recipe A'),
('Recipe B', 'Instructions for Recipe B');


INSERT INTO ingredients (prodName, recipeName, productQuantity) VALUES
('Product A', 'Recipe A', 2.5),
('Product B', 'Recipe A', 1.5),
('Product A', 'Recipe B', 3),
('Product B', 'Recipe B', 2);


INSERT INTO promotion (promotionCode, discountPercentage, promotionDescription, promotionStartDate, promotionLength, productBarcode) VALUES
('PROMO1', 10.00, 'Promotion 1 Description', '2023-05-01', 30, 1001),
('PROMO2', 15.00, 'Promotion 2 Description', '2023-05-15', 15, 1002);


INSERT INTO requires (recipeName, productCode) VALUES
('Recipe A', 1001),
('Recipe A', 1002),
('Recipe B', 1001),
('Recipe B', 1002);


INSERT INTO contains_code (orderNum, barcode) VALUES
(1, 1001),
(1, 1002),
(2, 1002);


INSERT INTO supplies (supID, storeID, prodCode) VALUES
(1, 1, 1001),
(2, 2, 1002);


INSERT INTO receives_order (addressID, email) VALUES
(1, 'jay.dance@gmail.com'),
(2, 'amy.le@gmail.com');


INSERT INTO pays_with (card_num, email) VALUES
('1234567890123456', 'jay.dance@gmail.com'),
('9876543210987654', 'amy.le@gmail.com');


INSERT INTO phone_number (phone_num, fname, lname) VALUES
('1234567890', 'Thibaud', 'Roy'),
('9876543210', 'Vincent', 'Lee'),
('5555555555', 'Jay', 'Dance'),
('9999999999', 'Amy', 'Le');


INSERT INTO meat (prodCode, animal) VALUES
(1001, 'Chicken');


INSERT INTO produce (prodCode, name, organic) VALUES
(1002, 'Apple', true);


INSERT INTO supplier_contact (contactType, contactValue, iD) VALUES
('Phone', '111-111-1111', 1001),
('Email', 'supplierA@example.com', 1002);


INSERT INTO dairy (prodCode, dairyType) VALUES
(1002, 'Milk');


INSERT INTO medicinal (prodCode, dosage) VALUES
(1001, 500);


INSERT INTO confectionery (prodCode, conType) VALUES
(1002, 'Chocolate');


INSERT INTO personal_hygiene (prodCode, scent) VALUES
(1001, 'Lavender');


INSERT INTO store_phone (phone, storeName, storeHours) VALUES
('111-111-1111', 'PakN\'Save', '9:00 AM - 5:00 PM'),
('222-222-2222', 'Countdown', '10:00 AM - 6:00 PM');
COMMIT;



SELECT * FROM customer;
SELECT * FROM payment_method;
SELECT * FROM address;
SELECT * FROM supplier;
SELECT * FROM store;
SELECT * FROM orders;
SELECT * FROM product;
SELECT * FROM recipe;
SELECT * FROM ingredients;
SELECT * FROM promotion;
SELECT * FROM requires;
SELECT * FROM contains_code;
SELECT * FROM supplies;
SELECT * FROM receives_order;
SELECT * FROM pays_with;
SELECT * FROM phone_number;
SELECT * FROM meat;
SELECT * FROM produce;
SELECT * FROM supplier_contact;
SELECT * FROM dairy;
SELECT * FROM medicinal;
SELECT * FROM confectionery;
SELECT * FROM personal_hygiene;
SELECT * FROM store_phone;

