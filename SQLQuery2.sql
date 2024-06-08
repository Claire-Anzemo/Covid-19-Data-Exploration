INSERT INTO EmployeeDemographics VALUES
(1002,'pam','Beasley',30,'Female'),
(1003,'Owight','schrute',29,'male'),
(1004,'Angela','Martine',31,'Female'),
(1005,'Toby','Flenderson',32,'male'),
(1006,'Michael','Owuori',35,'Male'),
(1007,'Meredith','Palmer',32,'Female'),
(1008,'Stanley','Hudson',38,'male'),
(1009,'Kevin','Malone',31,'male')


INSERT INTO EmployeeSalary VALUES
(1001,'Salesman',45000),
(1002,'Receptionist',36000),
(1003,'Salesman',63000),
(1004,'Accountant',47000),
(1005,'HR',50000),
(1006,'Regional Manager',65000),
(1007,'supplier Relations',41000),
 (1008,'Salesman',48000),
(1001,'Accountant',42000)


UPDATE EmployeeSalary
SET EmployeeID = 1009
WHERE EmployeeID = 1001 AND JobTitle = 'Accountant';


SELECT FirstName FROM EmployeeDemographics;

SELECT FirstName,LastName FROM EmployeeDemographics

SELECT TOP 5 * FROM EmployeeDemographics

SELECT TOP 5 FirstName FROM EmployeeDemographics

SELECT DISTINCT (Gender) FROM EmployeeDemographics

SELECT COUNT (FirstName) AS LastnameCount FROM EmployeeDemographics

SELECT MAX/Min/AVG(Salary) FROM EmployeeSalary

SELECT * FROM EmployeeDemographics WHERE FirstName = 'jim'

SELECT * FROM EmployeeDemographics WHERE FirstName <>(stands for not equal to) 'jim'

SELECT * FROM EmployeeDemographics WHERE Age> = 30
SELECT * FROM EmployeeDemographics WHERE Age > 32 or Gender='Male'

sELECT * FROM EmployeeDemographics WHERE FirstName LIKE 'S%'  =WHERE ALL first names starts with s

SELECT * FROM EmployeeDemographics WHERE FirstName is NULL

SELECT * FROM EmployeeDemographics WHERE FirstName IN ('jim','michael')

/*group by,ORDER BY*/

SELECT Gender,Age, COUNT(Gender) AS CountGender
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender,Age
ORDER BY CountGender ASC

SELECT * FROM EmployeeDemographics
ORDER BY 4 DESC, 5 DESC


/* Join,INNER/OUTER JOINS */

SELECT * FROM EmployeeDemographics
INNER JOIN EmployeeSalary
 ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

 SELECT * FROM EmployeeDemographics
FULL OUTER JOIN EmployeeSalary
 ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


 SELECT * FROM EmployeeDemographics
 LEFT OUTER JOIN EmployeeSalary
 ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT * FROM EmployeeDemographics
RIGHT OUTER JOIN EmployeeSalary
 ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

 SELECT * FROM EmployeeDemographics.EmployeeID,FirstName,LastName
FULL OUTER JOIN EmployeeSalary
 ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID