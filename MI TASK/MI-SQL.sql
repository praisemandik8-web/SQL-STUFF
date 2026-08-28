create database  mi_ch02;

-- question A
SELECT *
FROM ITEM, SHIPMENT, SHIPMENT_ITEM;

-- question B
SELECT  ShipmentID, ShipperName, ShipperInvoiceNumber
FROM SHIPMENT;

-- question c
SELECT  ShipmentID, ShipperName, ShipperInvoiceNumber
FROM SHIPMENT
WHERE InsuredValue > 10000;

-- question d	
SELECT ShipmentID, ShipperName, ShipperInvoiceNumber
FROM SHIPMENT
WHERE ShipperName LIKE "AB%"; 

-- question e  
SELECT ShipmentID, ShipperName, ShipperInvoiceNumber
FROM SHIPMENT
WHERE MONTH(DEPARTUREDATE) = 12; 

-- question f
SELECT ShipmentID, ShipperName, ShipperInvoiceNumber
FROM SHIPMENT
WHERE DAY(DEPARTUREDATE) = 10;

-- question g
SELECT MAX(InsuredValue), MIN(InsuredValue)
FROM SHIPMENT;

-- question h
SELECT AVG(InsuredValue)
FROM SHIPMENT;

-- question i
SELECT count(*)
FROM SHIPMENT;

-- question j
SELECT ItemID, Description, Store, USCurrencyAmount
FROM ITEM
WHERE USCurrencyAmount=LocalCurrencyAmount*ExchangeRate;

-- question k
SELECT City, Store
FROM ITEM;

-- question l
SELECT COUNT(*)
FROM ITEM
WHERE City = Store;




 

