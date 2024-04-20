USE M05_HW;
--1.	What are the names of all the customers who have placed orders
SELECT DISTINCT S_CUSTOMER_t.Customer_Name
FROM S_CUSTOMER_t
JOIN S_ORDER_t ON S_CUSTOMER_t.Customer_Id = S_ORDER_t.Customer_Id;

--2.	What are the product descriptions ordered by the customer ID, 1?
SELECT S_PRODUCT_t.Product_Description
FROM S_ORDER_t
JOIN S_ORDER_LINE_t ON S_ORDER_t.Order_Id = S_ORDER_LINE_t.Order_Id
JOIN S_PRODUCT_t ON S_ORDER_LINE_t.Product_Id = S_PRODUCT_t.Product_Id
WHERE S_ORDER_t.Customer_Id = 1;

--3.	What are the product descriptions ordered by the customer, ‘Impressions’?
SELECT S_PRODUCT_t.Product_Description
FROM S_CUSTOMER_t
JOIN S_ORDER_t ON S_CUSTOMER_t.Customer_Id = S_ORDER_t.Customer_Id
JOIN S_ORDER_LINE_t ON S_ORDER_t.Order_Id = S_ORDER_LINE_t.Order_Id
JOIN S_PRODUCT_t ON S_ORDER_LINE_t.Product_Id = S_PRODUCT_t.Product_Id
WHERE S_CUSTOMER_t.Customer_Name = 'Impressions';

--4.	List all customers’ names that have placed an order that contains a product whose standard price is over 500.
SELECT DISTINCT S_CUSTOMER_t.Customer_Name
FROM S_CUSTOMER_t
JOIN S_ORDER_t ON S_CUSTOMER_t.Customer_Id = S_ORDER_t.Customer_Id
JOIN S_ORDER_LINE_t ON S_ORDER_t.Order_Id = S_ORDER_LINE_t.Order_Id
JOIN S_PRODUCT_t ON S_ORDER_LINE_t.Product_Id = S_PRODUCT_t.Product_Id
WHERE S_PRODUCT_t.Standard_Price > 500;

--5.	List all customers. Print the order ID (s) along with the customer information if they have submitted the order(s).
SELECT S_CUSTOMER_t.Customer_Id, S_CUSTOMER_t.Customer_Name, S_CUSTOMER_t.Customer_Address, S_CUSTOMER_t.Customer_City, S_CUSTOMER_t.Customer_State, S_CUSTOMER_t.Postal_Code, GROUP_CONCAT(S_ORDER_t.Order_Id) as Order_Ids
FROM S_CUSTOMER_t
LEFT JOIN S_ORDER_t ON S_CUSTOMER_t.Customer_Id = S_ORDER_t.Customer_Id
GROUP BY S_CUSTOMER_t.Customer_Id;

--6.	Display the subtotal amount of each orderline in each order.
SELECT S_ORDER_t.Order_Id, S_ORDER_LINE_t.Product_Id, S_PRODUCT_t.Standard_Price, S_ORDER_LINE_t.Ordered_Quantity, (S_PRODUCT_t.Standard_Price * S_ORDER_LINE_t.Ordered_Quantity) AS Subtotal
FROM S_ORDER_t
JOIN S_ORDER_LINE_t ON S_ORDER_t.Order_Id = S_ORDER_LINE_t.Order_Id
JOIN S_PRODUCT_t ON S_ORDER_LINE_t.Product_Id = S_PRODUCT_t.Product_Id;

--7.	Display the total amount of each order.
SELECT S_ORDER_t.Order_Id, SUM(S_PRODUCT_t.Standard_Price * S_ORDER_LINE_t.Ordered_Quantity) AS Total
FROM S_ORDER_t
JOIN S_ORDER_LINE_t ON S_ORDER_t.Order_Id = S_ORDER_LINE_t.Order_Id
JOIN S_PRODUCT_t ON S_ORDER_LINE_t.Product_Id = S_PRODUCT_t.Product_Id
GROUP BY S_ORDER_t.Order_Id;