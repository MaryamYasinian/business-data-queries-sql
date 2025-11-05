USE Ch07_ConstructCo
GO

/*1. list the employee number, last name, first name, and middle initial of employees last name start with Smith*/
SELECT EMP_NUM
,EMP_LNAME
,EMP_FNAME
,EMP_INITIAL
FROM Ch07_ConstructCo.dbo.EMPLOYEE
WHERE EMP_LNAME LIKE 'SMITH%';

GO
/*2. List employee hired in 1995-1997. sort date*/ 
SELECT EMP_NUM
,EMP_LNAME
,EMP_FNAME
,EMP_INITIAL
,EMP_HIREDATE
,JOB_CODE
EMP_YEARS
FROM Ch07_ConstructCo.dbo.EMPLOYEE
WHERE EMP_HIREDATE BETWEEN '1995-01-01' AND '1997-12-31'
ORDER BY EMP_HIREDATE ASC;
GO
/*3. Employees worked at the company 10 years or more, sort by hire date*/
SELECT EMP_NUM
,EMP_LNAME
,EMP_FNAME
,EMP_INITIAL
,EMP_HIREDATE
,JOB_CODE
,EMP_YEARS
FROM ch07_ConstructCo.dbo.EMPLOYEE
WHERE EMP_YEARS >= 10
ORDER BY EMP_LNAME, EMP_FNAME;
GO
/*4. Select distinct project numbers in the ASSIGNMENT table*/
SELECT DISTINCT PROJ_NUM
FROM Ch07_ConstructCo.dbo.ASSIGNMENT;
GO
/*5. calculate daily rate for position company, sort by job description*/
SELECT JOB_CODE 
,JOB_DESCRIPTION
,JOB_CHG_HOUR * 8 AS DailySalary
FROM Ch07_ConstructCo.dbo.JOB
ORDER BY JOB_DESCRIPTION ASC;
GO
/*6. assignments with hourly rate greater than $80, tool more than 5 hours,list costlier first*/
SELECT ASSIGN_NUM
,ASSIGN_CHG_HR
,ASSIGN_HOURS
,ASSIGN_CHARGE
FROM Ch07_ConstructCo.dbo.ASSIGNMENT
WHERE ASSIGN_CHG_HR > 80 AND ASSIGN_HOURS > 5
ORDER BY ASSIGN_CHG_HR DESC;
GO
/*7. five most costly assignments displaying assignment number and charge. Sort DESC charge*/
SELECT TOP (5) ASSIGN_NUM
,ASSIGN_CHARGE
FROM Ch07_ConstructCo.dbo.ASSIGNMENT
ORDER BY ASSIGN_CHARGE DESC;
GO
/*8. job codes for IT-related positions, sort by job code*/
SELECT JOB_CODE
FROM Ch07_ConstructCo.dbo.JOB
WHERE JOB_DESCRIPTION IN ('Programmer','Systems Analyst','Database Designer','Applications Designer')
ORDER BY JOB_CODE ASC;
GO
/*9. job codes, job description, hourly rate for engineer and technician, sort by job description*/
SELECT JOB_CODE, JOB_DESCRIPTION, JOB_CHG_HOUR AS HourlyRate
FROM JOB
WHERE JOB_DESCRIPTION LIKE '%engineer%' OR JOB_DESCRIPTION LIKE '%technician%'
ORDER BY JOB_DESCRIPTION;
GO
/*10. project number, name, remaining funds, sort by difference*/
SELECT PROJ_NUM AS ProjectNumber
,PROJ_NAME AS ProjectName
,PROJ_VALUE - PROJ_BALANCE AS RemaimingFunds
FROM Ch07_ConstructCo.dbo.PROJECT
ORDER BY RemaimingFunds;

GO
USE AdventureWorks2019
GO
/*11. ORDER BY ASCENDING: Select all addresses ID, Line 1, Line 2, , and State ID for cities starting with C. Order alphabetically by City name ASC*/
SELECT AddressID
,AddressLine1
,AddressLine2
,City
,StateProvinceID
From AdventureWorks2019.Person.Address
WHERE City LIKE 'C%'
ORDER BY City ASC;
Go
/*12. ORDER BY DESCENDING: Select Product ID and Standard costs which are greater or equal to 100. Sort from smaller entity to bigger*/
SELECT ProductID
,StandardCost
FROM AdventureWorks2019.Production.ProductCostHistory
WHERE StandardCost >= 100
ORDER BY StandardCost DESC;
GO
/*13. WHERE: Select ContactID Type (second column) and names which represent managers (the word "manager' could be anywhere in the name) and sord Name column Ascending*/
SELECT Name
,ContactTypeID
FROM AdventureWorks2019.Person.ContactType
WHERE NAME LIKE '%manager%'
ORDER BY NAME ASC;
GO
/*14. BETWEEN: investigate how many sick days and vacation are left for those hired between the beginning of 2010 till end of 2012*/
SELECT OrganizationLevel
,JobTitle
,HireDate
,SickLeaveHours
,VacationHours
FROM AdventureWorks2019.HumanResources.Employee
WHERE HireDate BETWEEN '2010-01-01' AND '2012-12-12'
ORDER BY HireDate ASC; 
GO
/*15. IN: Represent European culture name (English, Spanish, French) as CultureNameEU nd Culture ID*/
SELECT Name AS CultureNameEU
,CultureID
FROM Production.Culture
WHERE Name IN ('English', 'Spanish', 'French')
ORDER BY NAME ASC;
GO
/*16. LIKE: Search all first names wwhich contain JAck at ant part of the name and where Title is not null*/
SELECT Title 
,FirstName
,MiddleName
,LastName
FROM AdventureWorks2019.Person.Person
WHERE FirstName LIKE '%Jack%' and Title IS NOT NULL; 
GO
/*17. AND:search product name that contain "women"or "men" in any parts of those words*/ 
SELECT ProductModelID
,Name As ProductName
,Instructions
FROM AdventureWorks2019.Production.ProductModel
WHERE Name LIKE '%women%' OR Name LIKE '%men%';
GO
/*18. OR: extract location names or cost rates which are greater than zero*/
SELECT LocationID
,Name as LocationName
,CostRate
,Availability
FROM AdventureWorks2019.Production.Location
WHERE CostRate > 0 OR Availability > 0;
GO
/*19. Search for distinct country names and sort then ASC*/
SELECT DISTINCT Name as CountryName
FROM Person.CountryRegion
ORDER BY Name ASC;
GO
/*20. Search for the five greatest order qualtity */
SELECT TOP (5) OrderQty
FROM Sales.SalesOrderDetail
ORDER BY OrderQty DESC;
