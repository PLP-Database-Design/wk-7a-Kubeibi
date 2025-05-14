-- New normalized table
CREATE TABLE ProductDetail1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);


INSERT INTO ProductDetail1NF VALUES (101, 'John Doe', 'Laptop');
INSERT INTO ProductDetail1NF VALUES (101, 'John Doe', 'Mouse');
INSERT INTO ProductDetail1NF VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO ProductDetail1NF VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO ProductDetail1NF VALUES (102, 'Jane Smith', 'Mouse');
INSERT INTO ProductDetail1NF VALUES (103, 'Emily Clark', 'Phone');

#2
-- Step 1: Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Step 2: Insert distinct orders
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- Step 3: Create OrderItems table
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 4: Insert order item data
INSERT INTO OrderItems (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;
