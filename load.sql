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
    expirationDate varchar(5) NOT NULL,
    cvv varchar(3) NOT NULL,
    PRIMARY KEY cardNumber varchar(16)
);

INSERT INTO PaymentMethod VALUES('24 Heriot Row, City Rise', 'Harriet Doe', '04/27', '123', '1111222233334444');
INSERT INTO PaymentMethod VALUES('11b ethel benjamin place, north dunedin', 'janet pollock', '12/24', '013', '1234987632104567');
INSERT INTO PaymentMethod VALUES('21C CLARK ST CENTRAL DUNEDIN DUNEDIN OTAGO NEW ZEALAND', 'JW KIM', '10/23', '789', '4835610412345678');
INSERT INTO PaymentMethod VALUES('21A grange street, Dunedin', 'Leigh-Ann Charlotte Lizbet Winston', '1/24', '222', '7612091800004321');
INSERT INTO PaymentMethod VALUES('3/15b Ethel Benjamin Pl, North Dunedin, Dunedin, Otago, NZ', 'Jenna Smith', '08/25', '189', '5678432128102012');
COMMIT;

CREATE TABLE Store(
    phone varchar(12) NOT NULL,
    addressID varchar(5) NOT NULL,
    PRIMARY KEY storeID varchar(5),
    CONSTRAINT fk_address
        FOREIGN KEY (addressID)
        REFERENCES Address(addressID)
);

INSERT INTO Store VALUES('034567890', '11122', '00001');
INSERT INTO Store VALUES('0312312345', '10123', '00002');
INSERT INTO Store VALUES('097618923', '14209', '00003');
INSERT INTO Store VALUES('0612939876', '48569', '00004');
INSERT INTO Store VALUES('0992340571', '84731', '00005');
COMMIT;

CREATE TABLE Order(
    orderDate DATE,
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

INSERT INTO Order VALUES();
INSERT INTO Order VALUES();
INSERT INTO Order VALUES();
INSERT INTO Order VALUES();
INSERT INTO Order VALUES();
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