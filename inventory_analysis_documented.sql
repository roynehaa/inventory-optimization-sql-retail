
-- SQL Query 1: Total Inventory per Product
SELECT Product_ID, SUM(Inventory) AS Total_Inventory
FROM Inventory_Data
GROUP BY Product_ID;

-- SQL Query 2: Total Units Sold per Product
SELECT Product_ID, SUM(Units_Sold) AS Total_Units_Sold
FROM Inventory_Data
GROUP BY Product_ID;

-- SQL Query 3: Products with Low Inventory (less than 100 units)
SELECT * 
FROM Inventory_Data
WHERE Inventory < 100;

-- SQL Query 4: Inventory vs Sales Mismatch
-- This identifies products where units ordered far exceed units sold
SELECT Product_ID, SUM(Inventory) AS Units_Ordered, SUM(Units_Sold) AS Units_Sold
FROM Inventory_Data
GROUP BY Product_ID;

-- SQL Query 5: Reorder Flag Logic based on Forecast
-- Reorder triggered if inventory is less than 80% of forecasted demand
SELECT Product_ID, Inventory, Forecast,
  CASE 
    WHEN Inventory < Forecast * 0.8 THEN 'Reorder'
    ELSE 'OK'
  END AS Reorder_Flag
FROM Inventory_Data;

-- BONUS: Example of a JOIN query (if data was normalized)
-- Join Products and Sales table on Product_ID
SELECT p.Product_ID, p.Product_Name, s.Units_Sold
FROM Products p
JOIN Sales s ON p.Product_ID = s.Product_ID;
