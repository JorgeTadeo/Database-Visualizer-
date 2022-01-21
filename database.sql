CREATE TABLE Customer (
	CustomerID int,
	Email varchar(30),
	Password varchar(30),
	primary key(CustomerID)
);

CREATE TABLE ItemOrder (
	DatePlaced date,
	confirmation int,
	ItemID int,
	CustomerID int,
	primary key(confirmation,ItemID,CustomerID),
	foreign key(CustomerID) references Customer(CustomerID),
	foreign key(ItemID) references Item(ItemID)
);

CREATE TABLE Item (
	Name varchar(30),
	Price decimal(4,2),
	ItemID int,
	primary key(ItemID)
);

INSERT INTO Item
VALUES ('Shirt', 9.99, 12345678),
	   ('Pants', 24.99, 12345677),
	   ('shoes', 19.99, 12345666),
	   ('Sweater', 14.99, 12345555);
	   
INSERT INTO Customer
VALUES (11111111, 'JorgeTadeo510@gmail.com', 'Mermaid123'),
	   (00000000, 'Guest@mail.com', 'Guest123');
	   
INSERT INTO ItemOrder
VALUES ('2020-09-08', 9877827, 12345666, 0),
       ('2020-09-08', 9877827, 12345677, 0),
       ('2020-09-08', 9877827, 12345678, 0),
       ('2020-09-08', 9989988, 12345555, 11111111);
       
