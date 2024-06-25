-- To reset and have a clean start, let's drop the database if it exists.
DROP database IF EXISTS GreenLeafNourish;

-- Create GreenLeafNourish database
CREATE DATABASE GreenLeafNourish;

-- Use the GreenLeafNourish database
USE GreenLeafNourish;

-- Create SALES_INVOICE table
CREATE TABLE SALES_INVOICE (
    InvoiceID INT PRIMARY KEY NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    PaymentType VARCHAR(50) NOT NULL,
    InvoiceDate DATE NOT NULL
);

-- Create MENU_ITEM table
CREATE TABLE MENU_ITEM (
    ItemID INT PRIMARY KEY NOT NULL,
    ItemName VARCHAR(100) NOT NULL,
    Description TEXT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Category VARCHAR(50) NOT NULL
);

-- Create SALES_MENU table
CREATE TABLE SALES_MENU (
    InvoiceID INT NOT NULL,
    ItemID INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (InvoiceID) REFERENCES SALES_INVOICE(InvoiceID),
    FOREIGN KEY (ItemID) REFERENCES MENU_ITEM(ItemID)
);

-- Create SUPPLIER table
CREATE TABLE SUPPLIER (
    SupplierID INT PRIMARY KEY NOT NULL,
    SupplierName VARCHAR(100) NOT NULL,
    EmailAddress VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    StreetAddress VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    Zip VARCHAR(20) NOT NULL
);

-- Create INGREDIENT table
CREATE TABLE INGREDIENT (
    IngredientID INT PRIMARY KEY NOT NULL,
    IngredientName VARCHAR(100) NOT NULL
);

-- Create SUPPLIER_INGREDIENT table
CREATE TABLE SUPPLIER_INGREDIENT (
    IngredientID INT NOT NULL,
    SupplierID INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (IngredientID) REFERENCES INGREDIENT(IngredientID),
    FOREIGN KEY (SupplierID) REFERENCES SUPPLIER(SupplierID)
);

-- Create INGREDIENT_MENU table
CREATE TABLE INGREDIENT_MENU (
    ItemID INT NOT NULL,
    IngredientID INT NOT NULL,
    ExpiryDate DATE NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (ItemID) REFERENCES MENU_ITEM(ItemID),
    FOREIGN KEY (IngredientID) REFERENCES INGREDIENT(IngredientID)
);

-- Insert sample data into MENU_ITEM table
INSERT INTO MENU_ITEM (ItemID, ItemName, Description, Price, Category)
VALUES
    (1, 'Salad', 'Fresh garden salad with assorted vegetables', 8.99, 'Salads'),
    (2, 'Pasta', 'Spaghetti pasta with marinara sauce', 10.99, 'Pasta'),
    (3, 'Smoothie', 'Mixed berry smoothie with yogurt', 5.49, 'Beverages'),
    (4, 'Quinoa Salad', 'Quinoa mixed with diced vegetables and tossed in lemon vinaigrette', 7.99, 'Salads'),
    (5, 'Vegan Pizza', 'Thin crust pizza topped with vegan cheese, tomato sauce, and assorted vegetables', 12.99, 'Entrees'),
    (6, 'Stir-Fried Tofu', 'Tofu cubes stir-fried with mixed vegetables in savory sauce served with rice', 10.49, 'Entrees'),
    (7, 'Coconut Chia Pudding', 'Chia seeds soaked in coconut milk, sweetened with agave nectar', 4.99, 'Desserts');

-- Insert sample data into SUPPLIER table
INSERT INTO SUPPLIER (SupplierID, SupplierName, EmailAddress, PhoneNumber, StreetAddress, City, State, Zip)
VALUES
    (1, 'Fresh Greens Supplier', 'freshgreens@example.com', '123-456-7890', '123 Green St', 'Greenville', 'CA', '12345'),
    (2, 'Pasta Importers', 'pastaimporters@example.com', '987-654-3210', '456 Pasta Ave', 'Pastaville', 'NY', '54321'),
    (3, 'Berry Farm', 'berryfarm@example.com', '555-555-5555', '789 Berry Rd', 'Berrytown', 'FL', '67890'),
	(4, 'Quinoa Farms', 'quinoafarms@example.com', '111-222-3333', '123 Quinoa Rd', 'Quinoatown', 'TX', '54321'),
    (5, 'Vegan Cheese Co.', 'vegancheese@example.com', '444-555-6666', '456 Vegan Ave', 'Veganville', 'GA', '67890'),
    (6, 'Tofu Factory', 'tofufactory@example.com', '777-888-9999', '123 Tofu St', 'Tofutown', 'WA', '12345'),
    (7, 'Coconut Haven', 'coconuthaven@example.com', '999-888-7777', '789 Coconut Ln', 'Coconutland', 'OR', '98765');
    
-- Insert sample data into INGREDIENT table
INSERT INTO INGREDIENT (IngredientID, IngredientName)
VALUES
    (1, 'Lettuce'),
    (2, 'Tomato'),
    (3, 'Cucumber'),
    (4, 'Spaghetti'),
    (5, 'Marinara Sauce'),
    (6, 'Mixed Berries'),
    (7, 'Yogurt'),
    (8, 'Quinoa'),
    (9, 'Lemon'),
    (10, 'Vegan Cheese'),
    (11, 'Tofu'),
    (12, 'Mixed Vegetables'),
    (13, 'Soy Sauce'),
    (14, 'Rice'),
    (15, 'Coconut Milk'),
    (16, 'Agave Nectar');

-- Insert sample data into SALES_INVOICE table
INSERT INTO SALES_INVOICE (InvoiceID, TotalAmount, PaymentType, InvoiceDate)
VALUES
    (101, 25.47, 'Cash', '2024-04-25'),
    (102, 16.47, 'Credit Card', '2024-04-25'),
    (103, 24.96, 'Cash', '2024-04-26'),
    (104, 19.48, 'Credit Card', '2024-04-26'),
    (105, 14.98, 'Cash', '2024-04-27'),
    (106, 32.47, 'Credit Card', '2024-04-27'),
    (107, 22.45, 'Cash', '2024-04-28');

-- Insert sample data into SALES_MENU table
INSERT INTO SALES_MENU (InvoiceID, ItemID, Quantity)
VALUES
    (101, 1, 2),
    (101, 3, 1),
    (102, 2, 1),
    (102, 3, 1),
    (103, 4, 1),
    (103, 5, 1),
    (104, 6, 1),
    (104, 3, 1),
    (105, 7, 1),
    (106, 2, 1),
    (107, 1, 1),
    (107, 5, 1),
    (107, 6, 1);

-- Insert sample data into SUPPLIER_INGREDIENT table
INSERT INTO SUPPLIER_INGREDIENT (IngredientID, SupplierID, Quantity, Price)
VALUES
    (1, 1, 100, 5.00),
    (2, 1, 100, 3.00),
    (3, 1, 50, 2.50),
    (4, 2, 200, 10.00),
    (5, 2, 150, 8.00),
    (6, 3, 100, 4.00),
    (7, 3, 100, 3.50),
     (8, 4, 100, 4.50),
    (9, 4, 50, 3.00),
    (10, 5, 100, 6.00),
    (11, 6, 200, 5.00),
    (12, 6, 150, 4.00),
    (13, 6, 100, 2.50),
    (14, 7, 200, 3.00),
    (15, 7, 100, 3.50),
    (16, 7, 100, 2.00);

-- Insert sample data into INGREDIENT_MENU table
INSERT INTO INGREDIENT_MENU (ItemID, IngredientID, ExpiryDate, Quantity)
VALUES
    (1, 1, '2024-05-01', 1),
    (1, 2, '2024-05-01', 1),
    (1, 3, '2024-05-01', 1),
    (2, 4, '2024-06-01', 1),
    (2, 5, '2024-06-01', 1),
    (3, 6, '2024-05-15', 1),
    (3, 7, '2024-05-15', 1),
    (4, 8, '2024-05-10', 1),
    (4, 9, '2024-05-10', 1),
    (4, 12, '2024-05-10', 1),
    (5, 10, '2024-06-01', 1),
    (5, 12, '2024-06-01', 1),
    (5, 14, '2024-06-01', 1),
    (6, 11, '2024-05-15', 1),
    (6, 12, '2024-05-15', 1),
    (6, 13, '2024-05-15', 1),
    (6, 14, '2024-05-15', 1),
    (7, 15, '2024-05-01', 1),
    (7, 16, '2024-05-01', 1);

-- Retrieve all invoices with their total amount and payment type
SELECT * FROM SALES_INVOICE;

-- Retrieve all menu items with their prices
SELECT * FROM MENU_ITEM;

-- Retrieve all sales records with their associated menu items and quantities
SELECT * FROM SALES_MENU;

-- Retrieve all suppliers with their contact information
SELECT * FROM SUPPLIER;

-- Retrieve all ingredients with their names
SELECT * FROM INGREDIENT;

-- Retrieve all supplier-ingredient relationships with quantities and prices
SELECT * FROM SUPPLIER_INGREDIENT;

-- Retrieve all menu items with their associated ingredients and expiry dates
SELECT * FROM INGREDIENT_MENU;