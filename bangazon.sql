DELETE FROM Employees;
DELETE FROM Training;
DELETE FROM Orders;
DELETE FROM Computer;
DELETE FROM Product Types;
DELETE FROM Payment Types;
DELETE FROM Departments;
DELETE FROM Products;
DELETE FROM Customers;
DELETE FROM EmployeeTraining;
DELETE FROM ProductOrder;

DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Training;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Computer;
DROP TABLE IF EXISTS ProductTypes;
DROP TABLE IF EXISTS PaymentTypes;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS EmployeeTraining;
DROP TABLE IF EXISTS ProductOrder;

CREATE TABLE Computer (
    ComputerId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Description TEXT NOT NULL,
    PurchaseDate TEXT NOT NULL,
    DecomissionDate TEXT NOT NULL
);

CREATE TABLE PaymentTypes (
    PaymentTypeId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    PaymentType TEXT NOT NULL,
    Account Number INT NOT NULL
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
    MaxAttendees TEXT NOT NULL,
    EmployeeTrainingId INT NOT NULL,
    FOREIGN KEY(EmployeeTrainingId) REFERENCES EmployeeTraining(EmployeeTrainingId)
);

CREATE TABLE EmployeeTraining (
    EmployeeTrainingId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    EmployeeId INT NOT NULL,
    FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId)
);

CREATE TABLE Employees (
    EmployeeId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
    DepartmentId INT NOT NULL,
    ComputerId INT NOT NULL,
    Supervisor TEXT NOT NULL,
    FOREIGN KEY(ComputerId) REFERENCES Computer(ComputerId),
    FOREIGN KEY(DepartmentId) REFERENCES Departments(DepartmentId)
);


CREATE TABLE Orders (
    OrderId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    CustomerId INT NOT NULL,
    PaymentTypeId INT NOT NULL,
    ProductOrderId INT NOT NULL,
    Completed TEXT NOT NULL,
    FOREIGN KEY(CustomerId) REFERENCES Customers(CustomerId),
    FOREIGN KEY(ProductOrderId) REFERENCES ProductOrder(ProductOrderId)
);

CREATE TABLE ProductOrder (
    ProductOrderId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    ProductId INT NOT NULL,
    FOREIGN KEY(ProductId) REFERENCES ProductOrder(ProductId)
);

CREATE TABLE Departments (
    DepartmentId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Budget TEXT NOT NULL
);

CREATE TABLE Products (
    ProductId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    ProductTypeId INT NOT NULL,
    Price INT NOT NULL,
    Name TEXT NOT NULL,
    Description TEXT NOT NULL,
    CustomerId INT NOT NULL,
    FOREIGN KEY(CustomerId) REFERENCES Customers(CustomerId),
    FOREIGN KEY(ProductTypeId) REFERENCES ProductTypes(ProductTypeId)
);

CREATE TABLE Customers (
    CustomerId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
    PaymentTypeId INT NOT NULL,
    AccountCreationDate TEXT NOT NULL,
    DateOfLastActivity TEXT NOT NULL,
    FOREIGN KEY (PaymentTypeId) REFERENCES PaymentTypes(PaymentTypeId)
);