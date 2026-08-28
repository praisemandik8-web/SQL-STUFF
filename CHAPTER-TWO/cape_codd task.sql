SELECT * FROM cape_codd.BUYER;

-- 2.17
SELECT SKU, SKU_Description
FROM INVENTORY;

-- 2.18
SELECT SKU_Description, SKU
FROM INVENTORY;

-- 2.19
SELECT WarehouseID
FROM WAREHOUSE;

-- 2.20
SELECT distinct WarehouseID
FROM WAREHOUSE;

-- 2.21
SELECT WarehouseID, SKU, SKU_Description, QuantityOnHand, QuantityOnOrder
FROM cape_codd.INVENTORY;

-- 2.22
SELECT *
FROM cape_codd.INVENTORY;

-- 2.23
SELECT *
FROM cape_codd.INVENTORY
WHERE QuantityOnHand > 0;

-- 2.24
SELECT SKU, SKU_Description
FROM cape_codd.INVENTORY
WHERE QUantityOnHand = 0;

-- 2.25
SELECT SKU, SKU_Description, WarehouseID
FROM cape_codd.INVENTORY
WHERE QuantityOnHand = 0
order by WarehouseId ASC;

-- 2.26
SELECT SKU, SKU_Description, WarehouseID
FROM cape_codd.INVENTORY
WHERE QuantityOnHand = 0
order by WarehouseId desc, SKU asc;

-- 2.27
SELECT SKU, SKU_Description, WarehouseID
FROM cape_codd.INVENTORY
WHERE QuantityOnHand = 0 
and QuantityOnOrder > 0
order by WarehouseId desc, SKU asc;

-- 2.28
SELECT SKU, SKU_Description, WarehouseID
FROM cape_codd.INVENTORY
WHERE QuantityOnHand = 0 
or QuantityOnOrder > 0
order by WarehouseId desc, SKU asc;

-- 2.29
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
FROM cape_codd.INVENTORY
where QuantityOnHand > 1
and QuantityonHand < 10;

-- 2.30
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
FROM cape_codd.INVENTORY
where QuantityOnHand between 1 and 10; 

-- 2.31
use cape_codd;
select distinct SKU, SKU_Description
from SKU_DATA
where SKU_Description like 'Half-Dome%';

-- 2.32
select distinct SKU, SKU_Description
from SKU_DATA
where SKU_Description like "%Climb%";

-- 2.33
SELECT DISTINCT SKU, SKU_Description
FROM SKU_DATA
WHERE SUBSTRING(SKU_Description, 3, 1) = 'd';



-- 2.35
-- COUNT:  counts the number of rows/values in a column (optionally, only non-NULL values).
-- SUM: adds up the numeric values in a column.It ignores NULL values, but returns the arithmetic total of the remaining numbers.

-- 2.36
SELECT WarehouseID,SUM(QuantityOnHand) AS TotalItemsOnHand
FROM INVENTORY
GROUP BY WarehouseID
ORDER BY TotalItemsOnHand DESC;

-- 2.37
SELECT WarehouseID,SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY
GROUP BY WarehouseID
HAVING SUM(QuantityOnHand) < 3
ORDER BY TotalItemsOnHandLT3 DESC;

select INVENTORY.SKU,
INVENTORY.SKU_Description, 
WAREHOUSE.WarehouseID,
WAREHOUSE.WarehouseCity,
WAREHOUSE.WarehouseState
from INVENTORY, WAREHOUSE
where WarehouseCity = "Atlanta" or WarehouseCity = "Bangor" or
WarehouseCity = "Chicago";

select INVENTORY.SKU,
INVENTORY.SKU_Description, 
WAREHOUSE.WarehouseID,
WAREHOUSE.WarehouseCity,
WAREHOUSE.WarehouseState
from INVENTORY, WAREHOUSE
where WarehouseCity in ('Atlanta','Bangor','Chicago');

select INVENTORY.SKU,
INVENTORY.SKU_Description, 
WAREHOUSE.WarehouseID,
WAREHOUSE.WarehouseCity,
WAREHOUSE.WarehouseState
from INVENTORY, WAREHOUSE
where WarehouseCity <> "Atlanta" and WarehouseCity <> "Bangor" and
WarehouseCity <> "Chicago";

select INVENTORY.SKU,
INVENTORY.SKU_Description, 
WAREHOUSE.WarehouseID,
WAREHOUSE.WarehouseCity,
WAREHOUSE.WarehouseState
from INVENTORY, WAREHOUSE
where WarehouseCity not in ('Atlanta','Bangor','Chicago');

select CONCAT(SKU_Description,"is located in,", WarehouseCity) as ItemLocation
from INVENTORY, WAREHOUSE;
 
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE WarehouseID = (SELECT WarehouseID
FROM WAREHOUSE
WHERE Manager = 'Lucille Smith');

SELECT SKU, SKU_Description, WAREHOUSE.WarehouseID
FROM INVENTORY JOIN WAREHOUSE
WHERE Manager = 'Lucille Smith';

SELECT SKU, SKU_Description, WAREHOUSE.WarehouseID
FROM INVENTORY JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
WHERE Manager = 'Lucille Smith';

SELECT WarehouseID, avg(QuantityOnHand) AS AVERAGE
FROM INVENTORY
WHERE WarehouseID = (SELECT WarehouseID
FROM WAREHOUSE
WHERE Manager = 'Lucille Smith')
GROUP BY WarehouseID;

SELECT WAREHOUSE.WarehouseID, avg(QuantityOnHand)
FROM INVENTORY, WAREHOUSE
WHERE Manager = 'Lucille Smith'
GROUP BY WarehouseID;

SELECT WAREHOUSE.WarehouseID, avg(QuantityOnHand)
FROM INVENTORY JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
WHERE Manager = 'Lucille Smith'
GROUP BY WarehouseID;

-- 2.51-- 
select SKU, SKU_Description, QuantityOnHand,
WAREHOUSE.WarehouseID,
WarehouseCity,
WarehouseState
FROM INVENTORY JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
WHERE Manager = 'Lucille Smith';

SELECT WarehouseID, sum(QuantityOnOrder) AS TotalItemsOnOrder,
sum(QuantityOnHand) as TotalItemsOnHand
from INVENTORY
group by WarehouseID ,QuantityOnOrder;

-- subquery is returns specific dataset to outer query  --  

select SKU, SKU_Description, QuantityOnHand, QuantityOnOrder,
WAREHOUSE.WarehouseID,
WarehouseCity,
WarehouseState, Manager, SquareFeet
from INVENTORY RIGHT OUTER JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID;

SELECT SKU, SKU_Description, Department
from CATALOG_SKU_2016
UNION
SELECT SKU, SKU_Description, Department
FROM CATALOG_SKU_2017;

SELECT SKU, SKU_Description, Department, CatalogPage
FROM CATALOG_SKU_2016
UNION
SELECT SKU, SKU_Description, Department, CatalogPage
FROM CATALOG_SKU_2017;

SELECT SKU, SKU_Description, Department
FROM CATALOG_SKU_2016
INTERSECT
SELECT SKU, SKU_Description, Department
FROM CATALOG_SKU_2017;

SELECT SKU, SKU_Description, Department, CatalogPage
FROM CATALOG_SKU_2016
INTERSECT
SELECT SKU, SKU_Description, Department, CatalogPage
FROM CATALOG_SKU_2017;

SELECT SKU, SKU_Description, Department
FROM CATALOG_SKU_2016
EXCEPT
SELECT SKU, SKU_Description, Department
FROM CATALOG_SKU_2017;