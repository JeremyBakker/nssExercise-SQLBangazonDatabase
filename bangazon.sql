DELETE FROM Employees;
DELETE FROM Training;
DELETE FROM Orders;
DELETE FROM Computers;
DELETE FROM ProductTypes;
DELETE FROM PaymentTypes;
DELETE FROM Departments;
DELETE FROM Products;
DELETE FROM Customers;
DELETE FROM EmployeeTraining;
DELETE FROM ProductOrder;

DROP TABLE IF EXISTS Computers;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS ProductTypes;
DROP TABLE IF EXISTS Training;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS PaymentTypes;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS EmployeeTraining;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS ProductOrder;

CREATE TABLE Computers (
    ComputerId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Description TEXT NOT NULL,
    SerialNumber TEXT NOT NULL,
    PurchaseDate TEXT NOT NULL,
    DecomissionDate TEXT NOT NULL
);

CREATE TABLE Customers (
    CustomerId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
    AccountCreationDate TEXT NOT NULL,
    DateOfLastActivity TEXT NOT NULL
);

CREATE TABLE ProductTypes (
    ProductTypeId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    ProductType TEXT NOT NULL
);

CREATE TABLE Training (
    TrainingId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    TrainingTitle TEXT NOT NULL,
    StartDate TEXT NOT NULL,
    EndDate TEXT NOT NULL,
    MaxAttendees TEXT NOT NULL
);

CREATE TABLE Departments (
    DepartmentId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Budget TEXT NOT NULL
);

CREATE TABLE PaymentTypes (
    PaymentTypeId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    PaymentType TEXT NOT NULL,
    Account Number INT NOT NULL,
    CustomerId INT NOT NULL,
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
);

CREATE TABLE Products (
    ProductId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    ProductTypeId INT NOT NULL,
    Price INT NOT NULL,
    Name TEXT NOT NULL,
    Description TEXT NOT NULL,
    FOREIGN KEY(ProductTypeId) REFERENCES ProductTypes(ProductTypeId)
);

CREATE TABLE Employees (
    EmployeeId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
    DepartmentId INT NOT NULL,
    ComputerId INT NOT NULL,
    Supervisor TEXT NOT NULL,
    FOREIGN KEY(ComputerId) REFERENCES Computers(ComputerId),
    FOREIGN KEY(DepartmentId) REFERENCES Departments(DepartmentId)
);

CREATE TABLE EmployeeTraining (
    EmployeeTrainingId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    EmployeeId INT NOT NULL,
    TrainingId INT NOT NULL,
    FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId),
    FOREIGN KEY (TrainingId) REFERENCES Training(TrainingId)
);

CREATE TABLE Orders (
    OrderId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    CustomerId INT NOT NULL,
    PaymentTypeId INT NOT NULL,
    ProductOrderId INT NOT NULL,
    Completed TEXT NOT NULL,
    FOREIGN KEY(CustomerId) REFERENCES Customers(CustomerId)
);

CREATE TABLE ProductOrder (
    ProductOrderId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    ProductId INT NOT NULL,
    OrderId INT NOT NULL,
    FOREIGN KEY(ProductId) REFERENCES ProductOrder(ProductId),
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId)
);

INSERT INTO Computers VALUES (NULL, 'MacBook Pro 13"', '138479a#@', '01/01/2017', '12/31/2022');
INSERT INTO Computers VALUES (NULL, 'MacBook Pro 13"', '1348asdf89', '01/01/2017', '12/31/2022');
INSERT INTO Customers VALUES (NULL, 'Jeremy', 'Verbic', '04/19/2017', '04/19/2017');
INSERT INTO Customers VALUES (NULL, 'Shawn', 'Townsend', '04/19/2017', '04/19/2017');
INSERT INTO ProductTypes VALUES (NULL, 'Headphones');
INSERT INTO ProductTypes VALUES (NULL, 'Shoes');
INSERT INTO Training VALUES (NULL, 'New Employee Orientation', '04/26/2017', '04/26/2017', 10);
INSERT INTO Training VALUES (NULL, 'Concur Basics', '04/25/2017', '04/25/2017', 5);
INSERT INTO Departments VALUES (NULL, 'Sales', 100000);
INSERT INTO Departments VALUES (NULL, 'Human Resources', 80000);
INSERT INTO PaymentTypes VALUES (NULL, 'MasterCard', '5466131148381374', '3');
INSERT INTO PaymentTypes VALUES (NULL, 'Visa', '347827438193', '3');
INSERT INTO PaymentTypes VALUES (NULL, 'American Express', '739346234324', '4');
INSERT INTO Products VALUES (NULL, 3, 9.99, 'Generic Headphones', 'These example headphones fit the bill');
INSERT INTO Products VALUES (NULL, 4, 69.99, 'Overpriced Headphones', 'These headphones are overpriced');
INSERT INTO Employees VALUES (NULL, 'Savannah', 'Roberts', 1, 3, 'TRUE');
INSERT INTO Employees VALUES (NULL, 'Noah', 'McConell', 1, 4, 'FALSE');
INSERT INTO Orders VALUES (NULL, 3, 1, 1, 'FALSE');
INSERT INTO Orders VALUES (NULL, 4, 2, 2, 'FALSE');