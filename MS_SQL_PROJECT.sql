-- OCTOBER COHORT MSSQL CLASS

--SELECT STATEMENT
--SELECT EVERYTHING (*)

SELECT * FROM HumanResources.Employee;
SELECT * FROM [HumanResources].[Department];
SELECT * FROM Production.Product;

--SELECT SPECIFICS
SELECT NAME, LISTPRICE FROM Production.Product;

--USING ALIASES
SELECT NAME AS PRODUCT, LISTPRICE * 0.9 AS SALESPRICE FROM Production.Product;

--DISTINCT
SELECT DISTINCT COLOR FROM Production.Product;

--SORTING RECORDS
SELECT * FROM Production.Product;

SELECT NAME AS PNAME, LISTPRICE AS PRICE FROM PRODUCTION.PRODUCT
ORDER BY PNAME, COLOR DESC;

--LIMITING
SELECT TOP 10 NAME, ListPrice FROM PRODUCTION.PRODUCT
ORDER BY ListPrice DESC;

--FILTERING AND USING PREDICATES
--WHERE
SELECT NAME, ListPrice FROM PRODUCTION.PRODUCT
WHERE ListPrice BETWEEN 100 AND 200;

--AGGREGATE FUNCTION
SELECT COUNT (*) AS OrderLines, SUM(OrderQty*UnitPrice) AS TotalSales
FROM Sales.SalesOrderDetail;

--CONCEPT OF JOINS

--WE WANT TO KNOW THE NAMES OF OUR SALES PERSONS, THEIR ID, CUSTOMERS AND TOTAL DUE
--INNER JOINS
SELECT FIRSTNAME, LASTNAME, BUSINESSENTITYID, SALESPERSONID, CUSTOMERID, TOTALDUE
FROM Sales.SalesOrderHeader INNER JOIN Person.Person
ON SalesPersonID = BusinessEntityID;

--WE WANT TO KNOW THE DETAILS OF THE CUSTOMERS WHO PATRONIZED OUR COMPANY
SELECT * FROM Sales.SalesOrderHeader;
--LEFT OUTER JOIN
SELECT BUSINESSENTITYID, FIRSTNAME, LASTNAME, CUSTOMERID, TOTALDUE
FROM Person.Person INNER JOIN Sales.SalesOrderHeader
ON BusinessEntityID = CustomerID;


--creating tables
--create semester1 table
create table semester1(
student_ID int identity(1,1) not null,
student_name varchar (100) not null,
course varchar (100) not null,
score float not null
);

select * from semester1;

--create semster2 table

drop table semester2;
create table semester2(
student_ID int identity(1,1) not null,
student_name varchar (100) not null,
course varchar (100) not null,
score float not null
);

select * from semester2;

--UNIONS
--TWO TYPES- UNION AND UNION ALL

select * from semester1
select * from semester2;

select * from semester1
union
select * from semester2;

select student_name from semester1
union
select student_name from semester2;

--union all
select student_name from semester1
union all
select student_name from semester2;

--intersect
--returns only common rows from both tables
select student_name from semester1
intersect
select student_name from semester2;

--Except
select student_name from semester1
except
select student_name from semester2;

select student_name from semester2
except
select student_name from semester1;

--GROUP BY

select * from Sales.SalesOrderHeader;
--How many times did a customer patronise us?

select customerID, COUNT(*) as Orders
from Sales.SalesOrderHeader
Group by customerID
order by Orders desc;

--HAVING
--USED TO FILTER GROUPED QUERRIES
--CUSTOMERS WHO ORDERED BETWEEN 15 AND 20

select customerID, COUNT(*) as Orders
from Sales.SalesOrderHeader
Group by customerID
HAVING COUNT(*) BETWEEN 10 AND 20;