DROP TABLE Customer;
DROP TABLE PaymentMethod;
DROP TABLE Store;
DROP TABLE Order;
DROP TABLE Address;
DROP TABLE Supplier;
DROP TABLE Product;
DROP TABLE Recipe;
DROP TABLE Promotion;
DROP TABLE SupplierContact;
DROP TABLE Ingredients;
DROP TABLE PhoneNumber;
DROP TABLE PaysWith;
DROP TABLE ReceivesOrder;
DROP TABLE Supplies;
DROP TABLE Contains;
DROP TABLE Requires;
DROP TABLE AdPostcode;
DROP TABLE StorePhone;
DROP TABLE PersonalHygiene;
DROP TABLE Confectionery;
DROP TABLE Medicinal;
DROP TABLE Dairy;
DROP TABLE Produce;
DROP TABLE Meat;

CREATE TABLE Customer(
    phoneNumber varchar(12) NOT NULL,
    PRIMARY KEY email varchar(100)
);

INSERT INTO Customer VALUES('0213334445', 'loyalcustomer@gmail.com');
INSERT INTO Customer VALUES('031112222', 'burneremail@hotmail.com');
INSERT INTO Customer VALUES('091231234', 'tempaddy@outlook.com');
INSERT INTO Customer VALUES('02755566677', 'anotherone@yahoo.com');
INSERT INTO Customer VALUES('020987987987', 'johnsmith@example.com');
COMMIT;

CREATE TABLE PaymentMethod(
    billingAddress varchar(200) NOT NULL,
    nameOnCard varchar(50) NOT NULL,
    expirationDate DATE NOT NULL,
    cvv varchar(3) NOT NULL,
    PRIMARY KEY cardNumber varchar(16)
);

INSERT INTO PaymentMethod VALUES();
COMMIT;

CREATE TABLE Store(
    phone varchar(12) NOT NULL,
    addressID varchar(5) NOT NULL,
    PRIMARY KEY storeID varchar(5),
    CONSTRAINT fk_address
        FOREIGN KEY (addressID)
        REFERENCES Address(addressID)
);

INSERT INTO Store VALUES();
COMMIT;

CREATE TABLE Order(
    orderDate DATE NOT NULL,
    email varchar(100) NOT NULL,
    addressID varchar(5) NOT NULL,
    storeID varchar(5) NOT NULL,
    cardNumber varchar(16) NOT NULL,
    PRIMARY KEY orderNumber varchar(10),
    CONSTRAINT fk_customer
        FOREIGN KEY (email)
        REFERENCES Customer(email)
    CONSTRAINT fk_address
        FOREIGN KEY (storeID)
        REFERENCES Store(storeID)
    CONSTRAINT fk_payment
        FOREIGN KEY (cardNumber)
        REFERENCES PaymentMethod(cardNumber)
);

INSERT INTO Store VALUES();
COMMIT;

CREATE TABLE Address(
    address1 varchar(50) NOT NULL,
    address2 varchar(50),
    suburb varchar(20) NOT NULL,
    postcode varchar(10) NOT NULL,
    PRIMARY KEY addressID varchar(10)
);

INSERT INTO Address VALUES();
COMMIT;

CREATE TABLE Supplier(
    supplierName varchar(50) NOT NULL,
    PRIMARY KEY supplierID varchar(10)
);

INSERT INTO Supplier VALUES();
COMMIT;

CREATE TABLE Product(

);

CREATE TABLE Recipe(

);

CREATE TABLE Promotion(

);

CREATE TABLE SupplierContact(

);

CREATE TABLE Ingredients(

);

CREATE TABLE PhoneNumber(

);

CREATE TABLE PaysWith(

);

CREATE TABLE ReceivesOrder(

);

CREATE TABLE Supplies(

);

CREATE TABLE Contains(

);

CREATE TABLE Requires(

);

CREATE TABLE AdPostcode(

);

CREATE TABLE StorePhone(

);

CREATE TABLE PersonalHygiene(

);

CREATE TABLE Confectionery(

);

CREATE TABLE Medicinal(

);

CREATE TABLE Dairy(

);

CREATE TABLE Produce(

);

CREATE TABLE Meat(

);