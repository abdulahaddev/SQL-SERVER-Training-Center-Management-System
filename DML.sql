/*

					SQL Project Name : Training Center Management System(TCMS)
							      By : Abdul Ahad   
					 	Define Data Manipulation Language

 --------------------------------------------------------------------------------
Table of Contents: DML
			=> SECTION 01: INSERT DATA USING INSERT INTO KEYWORD
			=> SECTION 02: INSERT DATA THROUGH STORED PROCEDURE
				SUB SECTION => 2.1 : INSERT DATA THROUGH STORED PROCEDURE WITH AN OUTPUT PARAMETER 
				SUB SECTION => 2.2 : INSERT DATA USING SEQUENCE VALUE
			=> SECTION 03: UPDATE DELETE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.1 : UPDATE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.2 : DELETE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.3 : STORED PROCEDURE WITH TRY CATCH AND RAISE ERROR
			=> SECTION 04: INSERT UPDATE DELETE DATA THROUGH VIEW
				SUB SECTION => 4.1 : INSERT DATA through view
				SUB SECTION => 4.2 : UPDATE DATA through view
				SUB SECTION => 4.3 : DELETE DATA through view
			=> SECTION 05: RETREIVE DATA USING FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED)
			=> SECTION 06: TEST TRIGGER (FOR/AFTER TRIGGER ON TABLE, INSTEAD OF TRIGGER ON TABLE & VIEW)
			=> SECTION 07: QUERY
				SUB SECTION => 7.01 : SELECT FROM TABLE
				SUB SECTION => 7.02 : SELECT FROM VIEW
				SUB SECTION => 7.03 : SELECT INTO
				SUB SECTION => 7.04 : IMPLICIT JOIN WITH WHERE BY CLAUSE, ORDER BY CLAUSE
				SUB SECTION => 7.05 : INNER JOIN WITH GROUP BY CLAUSE
				SUB SECTION => 7.06 : OUTER JOIN
				SUB SECTION => 7.07 : CROSS JOIN
				SUB SECTION => 7.08 : TOP CLAUSE WITH TIES
				SUB SECTION => 7.09 : DISTINCT
				SUB SECTION => 7.10 : COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR
				SUB SECTION => 7.11 : LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE
				SUB SECTION => 7.12 : OFFSET FETCH
				SUB SECTION => 7.13 : UNION
				SUB SECTION => 7.14 : EXCEPT INTERSECT
				SUB SECTION => 7.15 : AGGREGATE FUNCTIONS
				SUB SECTION => 7.16 : GROUP BY & HAVING CLAUSE
				SUB SECTION => 7.17 : ROLLUP & CUBE OPERATOR
				SUB SECTION => 7.18 : GROUPING SETS
				SUB SECTION => 7.19 : SUB-QUERIES (INNER, CORRELATED)
				SUB SECTION => 7.20 : EXISTS
				SUB SECTION => 7.21 : CTE
				SUB SECTION => 7.22 : MERGE
				SUB SECTION => 7.23 : BUILT IN FUNCTION
				SUB SECTION => 7.24 : CASE
				SUB SECTION => 7.25 : IIF
				SUB SECTION => 7.26 : COALESCE & ISNULL
				SUB SECTION => 7.27 : WHILE
				SUB SECTION => 7.28 : GROPING FUNCTION
				SUB SECTION => 7.29 : RANKING FUNCTION
				SUB SECTION => 7.30 : IF ELSE & PRINT
				SUB SECTION => 7.31 : TRY CATCH
				SUB SECTION => 7.32 : GOTO
				SUB SECTION => 7.33 : WAITFOR
				SUB SECTION => 7.34 : sp_helptext
				SUB SECTION => 7.35 : TRANSACTION WITH SAVE POINT
*/


/*
==============================  SECTION 01  ==============================
					INSERT DATA USING INSERT INTO KEYWORD
==========================================================================
*/

USE TCMS
GO

INSERT INTO gender VALUES('Male'),('Female')
GO
SELECT * FROM gender
GO

INSERT INTO religion VALUES ('Islam'), ('Hinduism'), ('Buddhism'), ('Christianity')
GO
SELECT * FROM religion
GO

INSERT INTO bloodGroup VALUES ('A+'), ('A-'), ('B+'), ('B-'), ('AB+'), ('AB-'), ('O+'), ('O-')
GO
SELECT * FROM bloodGroup
GO

INSERT INTO country VALUES('Bangladesh'),('India'),('Pakistan'),('China'),('Japan'),('Indonesia'),('Malaysia'),('Qatar')
GO
SELECT * FROM country
GO

INSERT INTO city VALUES('Dhaka'),('Gazipur'),('Faridpur'),('Gopalganj'),('Madaripur'),('Manikganj'),('Munshiganj'),('Narayanganj'),('Narsingdi'),('Rajbari'),('Tangail'),('Feni')
GO
SELECT * FROM city
GO

INSERT INTO maritalStatus VALUES ('Single'), ('Married'), ('Divorced')
GO
SELECT * FROM maritalStatus
GO

INSERT INTO [shift] VALUES ('Morning'), ('Afternoon')
GO
SELECT * FROM [shift]
GO

INSERT INTO season VALUES ('Summer'), ('Winter')
GO
SELECT * FROM season
GO

INSERT INTO course VALUES
('C#', '840', 75000.00),
('Database', '630', 42000.00),
('Web Design', '720', 56000.00),
('Data Mining', '360', 65000.00),
('MIS', '780', 72000.00),
('Software Engineering', '850', 124000.00),
('Java', '690', 47000.00),
('GAVE', '420', 36500.00),
('Networking', '680', 69000.00),
('Project Management', '710', 70000.00)
GO
SELECT * FROM course
GO

--============== Insert data by specifying column name ============--
INSERT INTO trainees([name], dob, genderId, maritalStatusId, bloodGroupId, nid, father, mother, email, phone, [address], cityId, countryId, postalCode, reference, closingDate, closingRemarks) VALUES
('Abdullah', '1995-07-13', 1, 1, 3, '1953358056', 'Abdul Hai', 'Aafra', 'abdullah@gmail.com', '01831469877','41 Smith St',12,1,'3922',NULL,NULL,NULL),
('Shaon Khalifa', '1995-08-03', 1, 1, 8, '1852147895', 'Abdu Lrazzad', 'Abir', 'shaon@gmail.com', '01556060804','10443 201st St',1,1,'3192',NULL,NULL,NULL),
('Imran Hossain', '1995-08-11', 1, 1, 8, '1992478254', 'Abdu- Rashid', 'Adeela', 'imran@gmail.com', '01541092559','265 E Good Ave',11,1,'3426',NULL,NULL,NULL),
('Nur Mohammad', '1995-09-06', 1, 1, 5, '1983154898', 'Abdul Hakeem', 'Anaan', 'nurmohammad@gmail.com', '01586795907','172 City Of Refuge Rd',10,1,'2214',NULL,NULL,NULL),
('Mamunur Rashid', '1995-09-21', 1, 1, 1, '1958107262', 'Abdul Majeed', 'Azeeza', 'mamun@gmail.com', '01579558976','21675 190th St NW',9,1,'3439',NULL,NULL,NULL)
GO
--============== Insert data by column sequence ============--
INSERT INTO trainees VALUES
('Faiza Islam', '1995-10-18', 2, 2, 2, '1969047522', 'Abdul Matin', 'Bukairah', 'faiza@gmail.com', '01547090170','9910 159th Pl NE',9,1,'1633',NULL,NULL,NULL),
('Habibur Rahman', '1995-11-24', 1, 1, 3, '1997122153', 'Abdul Muhaymin', 'Danin', 'habibur@gmail.com', '01549816095','145 Africana Dr',2,1,'2466',NULL,NULL,NULL),
('Nazmul Hossain', '1996-01-19', 1, 1, 3, '1980633574', 'Abdul Muqaddem', 'Hajna', 'nazmul@gmail.com', '01569324781','375 Lewis B Puller Memorial Hwy',3,1,'1413',NULL,NULL,NULL),
('Aminul Islam', '1996-03-29', 1, 1, 1, '1960187580', 'Abdul Muqtadir', 'Hamidah', 'aminul@gmail.com', '01521397070','6611 Weymout''h Rd',4,1,'3613',NULL,NULL,NULL),
('Rahima Akter', '1996-04-26', 2, 1, 2, '1995519759', 'Abdul Musawwir', 'Ikrima', 'rahima@gmail.com', '01525516210','36 W 138th St',4,1,'2751',NULL,NULL,NULL)
GO
SELECT * FROM trainees
GO


INSERT INTO instructor VALUES
('Abdur Rahman', '1980-06-12', 1, 2, 8, '1948589698', 'ar@gmail.com', '01780816281','430 Ashland St N',12,1,'3922',420.00),
('Rezaul Karim', '1981-12-28', 1, 2, 4, '1956524757', 'rezaul@gmail.com', '01792949056','130 Shirley Ln',11,1,'1212',420.00),
('Shakawat Hossain', '1983-03-08', 1, 2, 3, '1953252525', 'shakawat@gmail.com', '01789457265','407 E Courtland St',1,1,'1213',420.00),
('Mamunul', '1983-04-28', 1, 2, 8, '1954525252', 'mamunul@gmail.com', '01763204814','Po Box 734',10,1,'3900',420.00),
('Rauf Ahmed', '1983-06-15', 1, 2, 1, '1968582545', 'rauf@gmail.com', '01765468935','123 Woody Ln',12,1,'1214',420.00),
('Md Babul', '1985-03-21', 1, 2, 8, '1969853214', 'babul@gmail.com', '01750585384','143 Lower Dedham Rd',9,1,'1215',420.00),
('Taslima Khatun', '1986-02-12', 2, 2, 2, '1987542136', 'taslima@gmail.com', '01765158321','613 Maxwell St',5,1,'1212',420.00),
('Khalilullah', '1986-07-31', 1, 1, 8, '1956987412', 'khalilullah@gmail.com', '01745358164','733 Reeves Ave',4,1,'1213',420.00),
('Ismail Hossain', '1986-09-02', 1, 2, 2, '1956454545', 'ismail@gmail.com', '01746247132','311 River Way Rdg',2,1,'1425',420.00)
GO
SELECT * FROM instructor
GO


/*
==============================  SECTION 02  ==============================
					INSERT DATA THROUGH STORED PROCEDURE
==========================================================================
*/
EXEC spInsertTrainee 'Imtiaz Hossain', '1996-05-10', 1, 1, 7, '1988778846', 'Abdul Mutaali', 'Inaaya', 'imtiaz@gmail.com', '01576440774','1005 N Buchanan St #12',7,1,'1547',NULL,NULL,NULL
EXEC spInsertTrainee 'Atiqur Rahman', '1996-09-12', 1, 1, 4, '1994145054', 'Abdul Muzanni', 'Jaadva', 'atiqur@gmail.com', '01577213072','2341 W Hill Rd',8,1,'3360',NULL,NULL,NULL
EXEC spInsertTrainee 'Afsana Sarkar', '1996-10-14', 2, 1, 7, '1993043891', 'Abdul Nasser', 'Jahida', 'afsana@gmail.com', '01563093996','9323 Burnside Rd #BUECHE',8,1,'2573',NULL,NULL,NULL
EXEC spInsertTrainee 'Jannatul Ferdous', '1996-12-04', 2, 1, 3, '1987553123', 'Abdul Hai', 'Jamila', 'jannat@gmail.com', '01529330409','155 Valhalla Cir',9,1,'1714',NULL,NULL,NULL
EXEC spInsertTrainee 'Rakibul Hasib', '1996-12-12', 1, 1, 5, '1963981734', 'Abdul Qawi', 'Johi', 'rakim@gmail.com', '01532474634','208 Lehigh Rd S',1,1,'2334',NULL,NULL,NULL
EXEC spInsertTrainee 'Anas Abdullah', '1997-02-12', 1, 1, 4, '1980745746', 'Abdul Rasheed', 'Kaheesha', 'anas@gmail.com', '01534162120','1142 Dry Pond Hwy',11,1,'1472',NULL,NULL,NULL
EXEC spInsertTrainee 'Al Amin', '1997-03-03', 1, 1, 5, '1956593688', 'Abdul Rashid', 'Kaishori', 'alamin@gmail.com', '01566688659','568 N Danz Ave',5,1,'1644',NULL,NULL,NULL
EXEC spInsertTrainee 'Tabassum Jahan', '1997-05-05', 2, 1, 4, '1998857845', 'Abdul Salaam', 'Mahira', 'tabassum@gmail.com', '01579767419','41 Adin St',6,1,'1645',NULL,NULL,NULL
EXEC spInsertTrainee 'Prince Rana', '1997-05-27', 1, 1, 7, '1986365501', 'Abdul Samee', 'Maryam', 'prince@gmail.com', '01523490953','90 Blue Hills Pky',4,1,'1564',NULL,NULL,NULL
EXEC spInsertTrainee 'Md Mahbubur Rahman', '1997-06-13', 1, 1, 4, '1954525847', 'Abdul Hai', 'Nayma', 'mahbub@gmail.com', '01588875262','236 E Jackson St',1,1,'2612',NULL,NULL,NULL
EXEC spInsertTrainee 'Din Islam', '1997-07-31', 1, 1, 2, '1979707543', 'Abdul Sattar', 'Omayra', 'dinislam@gmail.com', '01564334544','17061 Marlin Dr',3,1,'1652',NULL,NULL,NULL
EXEC spInsertTrainee 'Farzana Akter', '1997-09-03', 2, 1, 1, '1984015516', 'Abdul Tawaab', 'Raabia', 'farzana@gmail.com', '01561564544','1142 W Main St',5,1,'2326',NULL,NULL,NULL
EXEC spInsertTrainee 'Moriom Jahan', '1997-09-07', 2, 1, 1, '1924025561', 'Abdul Akib', 'Fatiha', 'moriom@gmail.com', '01547825145','1142 W Main St',5,1,'2326',NULL,NULL,NULL
EXEC spInsertTrainee 'Fatema Akter', '1997-10-22', 2, 2, 1, '1994015599', 'Nurul Alam', 'Amina', 'fatema@gmail.com', '01563214789','1142 W Main St',4,1,'2587',NULL,NULL,NULL
EXEC spInsertTrainee 'Raisul Islam', '1998-04-17', 1, 1, 1, '1955015719', 'Tofawel Ahmed', 'Maliha', 'raisul@gmail.com', '01536525252','1142 W Main St',2,1,'1212',NULL,NULL,NULL
GO
SELECT * FROM trainees
GO

--============== INSERT DATA THROUGH STORED PROCEDURE WITH AN OUTPUT PARAMETER ============--

DECLARE @instructorId INT
EXEC spInsertInstructor 'Ramzan Ali', '1986-10-01', 1, 2, 7, '1989646464', 'ramzan@gmail.com', '01779852333','184 Blackpool Dr',5,1,'3921',420.00, @instructorId OUTPUT
PRINT 'The new instructor ID is : '+ str(@instructorId)
GO

-- insert data with relation
INSERT INTO traineeCourseInfo VALUES
(1, 1, 1, 2, 1),
(2, 2, 2, 2, 2),
(3, 10, 2, 1, 10),
(4, 9, 1, 1, 9),
(5, 8, 2, 1, 8),
(6, 7, 1, 2, 7),
(7, 6, 1, 2, 6),
(8, 5, 2, 1, 5),
(9, 4, 2, 2, 4),
(10, 3, 1, 1, 3),
(11, 2, 2, 2, 2),
(12, 1, 1, 1, 1),
(13, 10, 2, 2, 10),
(14, 9, 1, 2, 9),
(15, 8, 1, 1, 8),
(16, 7, 2, 2, 7),
(17, 7, 2, 1, 7),
(18, 2, 1, 1, 2),
(19, 1, 2, 1, 1),
(20, 4, 2, 2, 4),
(21, 9, 1, 1, 9),
(22, 1, 1, 2, 1)
GO
SELECT * FROM traineeCourseInfo
GO

INSERT INTO courseSales(traineeId, courseId, discount) VALUES
(1, 1, .03),
(2, 2, .05),
(3, 10,.10),
(4, 9, .10),
(5, 8, .05),
(6, 7, DEFAULT),
(7, 6, .07),
(8, 5, .06),
(9, 4, .15),
(10, 3, .12),
(11, 2, .10),
(12, 1, DEFAULT),
(13, 10, .02),
(14, 9, .05),
(15, 8, .10),
(16, 7, .12),
(17, 7, .05),
(18, 2, .04),
(19, 1, .05),
(20, 4, .02),
(21, 9, DEFAULT),
(22, 1, .10)
GO
SELECT * FROM courseSales
GO

INSERT INTO department VALUES('Administrative'),('HR'),('Technical'),('Financial'),('Sales')
GO
SELECT * FROM department
GO


INSERT INTO designation VALUES
('Director', 1),
('HR Manager', 2),
('Technical Manger', 3),
('Accounts Manager', 4),
('Sales Manager', 5),
('Network Engineer', 3),
('Security Engineer', 3),
('Database Engineer', 3),
('Infrastructure Engineer ', 3),
('Sales Executive', 5)
GO
SELECT * FROM designation
GO

INSERT INTO employee VALUES
('Anisul Islam', '1972-06-20', 1, 2, 8, '8406987193', 'anisul@gmail.com', '01983390248','193 First Winston Rd',1,1,'3922'),
('Mustafa Kamal', '1981-03-26', 1, 2, 7, '7487651354', 'mkamal@gmail.com', '01995060328','110 Bogie Ln',2,1,'3920'),
('Tipu Munsi', '1982-06-17', 1, 2, 2, '9025496297', 'tipu@gmail.com', '01990136812','2613 Twilight Dr',12,1,'3811'),
('Tajul Islam', '1985-11-08', 1, 2, 1, '8214889354', 'tajul@gmail.com', '01987089288','36 2nd St',11,1,'1212'),
('Sahab Uddin', '1985-11-22', 1, 2, 2, '5212409201', 'sahabuddin@gmail.com', '01990975035','818 Pony Express Trl',10,1,'1213'),
('Hasan Mahmud', '1986-07-03', 1, 2, 4, '5686086321', 'hasan@gmail.com', '01985840193','322 Cheaneys Bridge Rd',1,1,'2500'),
('Nafisa Akter', '1986-09-29', 2, 2, 5, '5777740276', 'nafisa@gmail.com', '01996498399','730 Keys Ferry Rd',9,1,'3820'),
('Tareque Abdullah', '1986-10-03', 1, 2, 6, '5826967994', 'tareque@gmail.com', '01993992703','3364 Cherrystone Rd',8,1,'1600'),
('Abdul Kader', '1986-11-07', 1, 2, 3, '5449542846', 'abdulkader@gmail.com', '01982679817','3643 Connor Ave',6,1,'1317'),
('Mostafa Jabbar', '1987-08-14', 1, 1, 8, '4656309698', 'mostafa@gmail.com', '01998112953','3314 Bridges St',4,1,'1300'),
('Saifuzzaman', '1988-03-02', 1, 2, 7, '7223577745', 'saifuzzaman@gmail.com', '01986127307','1910 Sassafras St',3,1,'1112'),
('Imran Ahmed', '1989-09-21', 1, 2, 3, '3911074898', 'imran@gmail.com', '01983184272','1682 Southbend Dr',5,1,'1400')
GO
SELECT * FROM employee
GO

INSERT INTO EmployeeInfo VALUES
(1, 1, 75000.00, DEFAULT),
(2, 2, 48000.00, DEFAULT),
(3, 3, 55000.00, DEFAULT),
(4, 4, 68000.00, DEFAULT),
(5, 5, 50000.00, DEFAULT),
(6, 6, 42000.00, DEFAULT),
(7, 7, 42000.00, DEFAULT),
(8, 8, 42000.00, DEFAULT),
(9, 9, 48000.00, DEFAULT),
(10, 10, 35000.00, DEFAULT),
(11, 10, 35000.00, DEFAULT),
(12, 10, 35000.00, DEFAULT)
GO
SELECT * FROM EmployeeInfo
GO

INSERT INTO tblProduct(productName, unitPrice) VALUES
('Computer Table', 1700.00),
('Chair', 2500.00),
('Mouse', 450.00),
('Keyboard', 680.00),
('Headphone', 1450.00),
('Multiplug', 800.00),
('Light', 230.00),
('Projector', 7900.00),
('Air Condition', 26000.00),
('Router', 1700.00),
('Hub', 900.00),
('Switch', 1450.00),
('Telephone', 3500.00),
('Mousepad', 100.00)
GO
SELECT * FROM tblProduct
GO

INSERT INTO tblStockIn(productId, qty) VALUES
(1, 56),
(2, 17),
(3, 11),
(4, 14),
(5, 17),
(6, 12),
(7, 17),
(8, 26),
(9, 17),
(10, 12),
(11, 17),
(12, 12),
(13, 17),
(14, 28)
GO
SELECT * FROM tblStockIn
GO

INSERT INTO tblProductForInfrastructure(productId, quantity) VALUES
(1, 25),
(5, 17),
(4, 13),
(2, 27),
(3, 29),
(6, 62)
GO
SELECT * FROM tblProductForInfrastructure
GO

INSERT INTO tblCommentsInfo VALUES
(2, 'Great', 25),
(4, 'Bad', 27),
(5, 'Good', 16),
(9, 'Try Again', 21)
GO

--============== INSERT DATA USING SEQUENCE VALUE ============--

INSERT INTO tblComments VALUES((NEXT VALUE FOR seqNum), NULL)
GO
SELECT * FROM tblComments
GO


/*
==============================  SECTION 03  ==============================
			UPDATE DELETE DATA THROUGH STORED PROCEDURE
==========================================================================
*/


--============== UPDATE DATA THROUGH STORED PROCEDURE ============--

-- STORED PROCEDURE for update trainee (closing date & closing remarks)
EXEC spUpdateTrainee 1, '2022-01-01', 'Course Completed'
EXEC spUpdateTrainee 2, '2022-02-07', 'Course Completed'
EXEC spUpdateTrainee 3, '2022-02-17', 'Course Completed'
EXEC spUpdateTrainee 4, '2022-03-19', 'Course Completed'
EXEC spUpdateTrainee 5, '2022-04-05', 'Course Completed'
EXEC spUpdateTrainee 6, '2022-05-11', 'Course Completed'
EXEC spUpdateTrainee 7, '2022-06-04', 'Course Completed'
GO
SELECT * FROM trainees
GO

--============== DELETE DATA THROUGH STORED PROCEDURE ============--

-- STORED PROCEDURE for Delete CourseSales
EXEC spDeleteCourseSales 7005
EXEC spDeleteCourseSales 7006
EXEC spDeleteCourseSales 7007
EXEC spDeleteCourseSales 7008
GO
SELECT * FROM courseSales
GO

--============== STORED PROCEDURE WITH TRY CATCH AND RAISE ERROR ============--

EXEC spRaisError
GO

/*
==============================  SECTION 04  ==============================
					INSERT UPDATE DELETE DATA THROUGH VIEW
==========================================================================
*/

--============== INSERT DATA through view ============--
SELECT * FROM VW_OrderSalesInfo
GO

INSERT INTO VW_OrderSalesInfo(traineeId,courseId, discount) VALUES(11, 5, .05)
INSERT INTO VW_OrderSalesInfo(traineeId,courseId, discount) VALUES(9, 10, .02)
INSERT INTO VW_OrderSalesInfo(traineeId,courseId, discount) VALUES(13, 3, .10)
GO
SELECT * FROM VW_OrderSalesInfo
GO

--============== UPDATE DATA through view ============--
UPDATE VW_OrderSalesInfo
SET discount = 0.5
WHERE courseId = 10
GO
SELECT * FROM VW_OrderSalesInfo
GO

--============== DELETE DATA through view ============--
DELETE FROM VW_OrderSalesInfo
WHERE traineeId = 16
GO
SELECT * FROM VW_OrderSalesInfo
GO

/*
==============================  SECTION 05  ==============================
						RETREIVE DATA USING FUNCTION
==========================================================================
*/

-- A Scalar Function to get monthly total net sales using two parameter @year & @month
SELECT dbo.fnCurrentYearSales() AS 'Currrent Year Net Sale'
GO


-- A Inline Table Valued Function to get monthly total sales, discount & net sales using two parameter @year & @month
SELECT * FROM dbo.fnMonthlyCourseSales(2022, 6)
GO


-- A Multi Statement Table Valued Function to get monthly net sales using two parameter @year & @month
SELECT * FROM dbo.fnMonthlySalesDetails(2022, 6)
GO

/*
==============================  SECTION 06  ==============================
							   TEST TRIGGER
==========================================================================
*/
--============== FOR/AFTER TRIGGER ON TABLE ============--

-- EX - 01
-- INSERT DATA IN Stockin TABLE and AUTOMATICALLY UPDATE STOCK IN Prodcut TABLE

SELECT * FROM tblProduct
SELECT * FROM tblStockIn

INSERT INTO tblStockIn(productId, qty) VALUES (4, 12)
GO

SELECT * FROM tblProduct
SELECT * FROM tblStockIn
GO

-- EX - 02
-- INSERT DATA ON tblProductForInfrastructure TABLE and AUTOMATICALLY UPDATE STOCK IN Prodcut TABLE

SELECT * FROM tblProduct
SELECT * FROM tblProductForInfrastructure

INSERT INTO tblProductForInfrastructure(productId, quantity) VALUES(4, 5)

SELECT * FROM tblProduct
SELECT * FROM tblProductForInfrastructure
GO


--============== INSTEAD OF TRIGGER ON TABLE ============--


--INSTEAD OF INSERT TRIGGER ON courseSales TO get price from course table and manipulate data in current table

SELECT * FROM courseSales
SELECT * FROM course
GO
INSERT INTO courseSales(traineeId, courseId, discount) VALUES
(15, 5, .10)
GO
SELECT * FROM courseSales
GO


--============== AN INSTEAD OF TRIGGER ON VIEW ============--

SELECT * FROM VW_OrderSalesInfo

INSERT INTO VW_OrderSalesInfo(traineeId,courseId, discount) VALUES(13, 3, .10)

SELECT * FROM VW_OrderSalesInfo
GO


/*
==============================  SECTION 07  ==============================
								  QUERY
==========================================================================
*/


--============== 7.01 A SELECT STATEMENT TO GET RESULT SET FROM A TABLE ============--

SELECT * FROM trainees
GO

--============== 7.02 A SELECT STATEMENT TO GET today course sales information FROM A VIEW ============--

SELECT * FROM VW_TodayCourseSales
GO

--============== 7.03 SELECT INTO > SAVE RESULT SET TO A NEW TEMPORARY TABLE ============--

SELECT * INTO #tmpProduct
FROM tblProduct
GO

SELECT * FROM #tmpProduct
GO

--============== 7.04 IMPLICIT JOIN WITH WHERE BY CLAUSE, ORDER BY CLAUSE ============--

-- GET DESIGNATION UNDER DEPARTMENT
SELECT designationTitle, departmentTitle FROM  designation, department
WHERE designation.departmentId = department.departmentId
ORDER BY departmentTitle ASC, designationTitle DESC
GO

--============== 7.05 INNER JOIN WITH GROUP BY CLAUSE ============--

-- GET SEMESTERWISE TRAINEE LIST
SELECT season.seasonName, COUNT(tr.traineeId) AS Students FROM traineeCourseInfo tcInfo
INNER JOIN trainees tr ON tr.traineeId = tcInfo.traineeId
INNER JOIN season ON season.seasonId = tcInfo.seasonId
GROUP BY season.seasonName
GO

--============== 7.06 OUTER JOIN ============--

SELECT * FROM traineeCourseInfo tcInfo
LEFT JOIN trainees tr ON tr.traineeId = tcInfo.traineeId
RIGHT JOIN season ON season.seasonId = tcInfo.seasonId
FULL JOIN [SHIFT] s ON s.shiftId = tcInfo.shiftId
GO

--============== 7.07 CROSS JOIN ============--

SELECT * FROM traineeCourseInfo tcInfo
CROSS JOIN instructor
GO

--============== 7.08 TOP CLAUSE WITH TIES ============--

SELECT TOP 5 WITH TIES course.courseTitle, seasonId FROM traineeCourseInfo
INNER JOIN course ON course.courseId = traineeCourseInfo.courseId
ORDER BY traineeId
GO

--============== 7.09 DISTINCT ============--

SELECT DISTINCT course.courseTitle, seasonId FROM traineeCourseInfo
INNER JOIN course ON course.courseId = traineeCourseInfo.courseId
ORDER BY course.courseTitle
GO

--============== 7.10 COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR ============--

SELECT * FROM trainees
WHERE maritalStatusId = 1
AND dob BETWEEN '1996-01-01' AND '1997-12-10'
AND NOT cityId = 4
AND postalCode > 1400
OR cityId = 2
GO

--============== 7.11 LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE ============--

SELECT * FROM trainees
WHERE name LIKE '%n'
AND cityId NOT IN ('1' ,'2')
AND reference IS NULL
GO

--============== 7.12 OFFSET FETCH ============--

-- OFFSET 5 ROWS
SELECT * FROM trainees
ORDER BY traineeId
OFFSET 5 ROWS
GO

-- OFFSET 10 ROWS AND GET NEXT 5 ROWS

SELECT * FROM trainees
ORDER BY traineeId
OFFSET 10 ROWS
FETCH NEXT 5 ROWS ONLY
GO

--============== 7.13 UNION ============--

SELECT * FROM employee
WHERE cityId IN ('1', '2', '3')

UNION

SELECT * FROM employee
WHERE cityId IN ('4', '5', '6')
GO

--============== 7.14 EXCEPT INTERSECT ============--

-- EXCEPT
SELECT * FROM employee

EXCEPT

SELECT * FROM employee
WHERE genderId = 2
GO

--INTERSECT

SELECT * FROM courseSales
WHERE traineeId > 10

INTERSECT

SELECT * FROM courseSales
WHERE traineeId > 15
GO

--============== 7.15 AGGREGATE FUNCTION ============--

SELECT	COUNT(*) 'Total Sales Count',
		SUM(netSale) 'Total Net Sale',
		AVG(netSale) 'Average Sale',
		MIN(courseFee) 'MIN COURSE FEE',
		(MAX(discount))*100 'MAX Discount %'
FROM courseSales
GO

--============== 7.16 AGGREGATE FUNCTION WITH GROUP BY & HAVING CLAUSE ============--

SELECT course.courseTitle, count(courseSales.courseId) Total, SUM(netSale) 'NET SALES' FROM courseSales
INNER JOIN course ON course.courseId = courseSales.courseId
GROUP BY course.courseTitle
HAVING SUM(netSale) > 50000
GO

--============== 7.17 ROLLUP & CUBE OPERATOR ============--

--ROLLUP
SELECT dp.departmentTitle, dg.designationTitle, SUM(employeeInfo.salary) Salary FROM employeeInfo
INNER JOIN designation dg ON dg.designationId = employeeInfo.designationId
INNER JOIN department dp ON dp.departmentId = dg.departmentId
GROUP BY  ROLLUP (dp.departmentTitle, dg.designationTitle)
ORDER BY dp.departmentTitle DESC, dg.designationTitle DESC
GO

-- CUBE
SELECT dp.departmentTitle, dg.designationTitle, SUM(employeeInfo.salary) AS 'Total Salary' FROM employeeInfo
INNER JOIN designation dg ON dg.designationId = employeeInfo.designationId
INNER JOIN department dp ON dp.departmentId = dg.departmentId
GROUP BY  CUBE (dp.departmentTitle, dg.designationTitle)
ORDER BY dp.departmentTitle DESC, dg.designationTitle DESC
GO

--============== 7.18 GROUPING SETS ============--

SELECT dp.departmentTitle, dg.designationTitle, SUM(employeeInfo.salary) AS 'Total Salary' FROM employeeInfo
INNER JOIN designation dg ON dg.designationId = employeeInfo.designationId
INNER JOIN department dp ON dp.departmentId = dg.departmentId
GROUP BY  GROUPING SETS (dp.departmentTitle, dg.designationTitle)
ORDER BY  dp.departmentTitle DESC, dg.designationTitle DESC
GO

--============== 7.19 SUB-QUERIES============--


--A subquery to findout trainees who have not enrolled yet

SELECT [name], dob, nid, email, phone, [address] FROM trainees
WHERE traineeId NOT IN (SELECT traineeId FROM courseSales)
ORDER BY [name]
GO

--A correlated subquery

SELECT cs.courseId, SUM(cs.netSale) 'NET SALES' FROM courseSales cs
GROUP BY  cs.courseId
HAVING SUM(cs.netSale) > (SELECT AVG(cs2.netSale) FROM courseSales cs2 WHERE cs.courseId = cs2.courseId)
GO

--============== 7.20 EXISTS ============--

SELECT [name], dob, nid, email, phone, [address] FROM trainees
WHERE NOT EXISTS 
			(SELECT * FROM courseSales
				WHERE courseSales.traineeId = trainees.traineeId)
GO

--============== 7.21 CTE ============--

-- A CTE TO GET MAXIMUM SALES COURSE
WITH courseCount AS
(
SELECT c.courseTitle, count(tcInfo.courseId) TotalCourse FROM traineeCourseInfo tcInfo
INNER JOIN course c ON c.courseId = tcInfo.courseId
GROUP BY c.courseTitle
)
SELECT courseTitle, TotalCourse from courseCount
WHERE TotalCourse = (SELECT MAX(TotalCourse) FROM courseCount)
GO

--============== 7.22 MERGE ============--

SELECT * FROM tblComments
SELECT * FROM tblCommentsInfo
GO

MERGE tblCommentsInfo AS SOURCE
USING tblComments AS TARGET
ON SOURCE.commentId = TARGET.commentId
WHEN MATCHED THEN
				UPDATE SET
				commentId = SOURCE.commentId,
				comment = SOURCE.comment;
GO

--============== 7.23 BUILT IN FUNCTION ============--

-- Get current date and time
SELECT GETDATE()
GO

-- GET STRING LENGTH
SELECT employeeId, LEN([name]) 'Name Length' FROM employee
GO

-- CONVERT DATA USING CAST()
SELECT CAST(1500 AS decimal(17,2)) AS DecimalNumber
GO

-- CONVERT DATA USING CONVERT()
DECLARE @currTime DATETIME = GETDATE()
SELECT CONVERT(VARCHAR, @currTime, 108) AS ConvertToTime
GO

-- CONVERT DATA USING TRY_CONVERT()
SELECT TRY_CONVERT(FLOAT, 'HELLO', 1) AS ReturnNull
GO

-- GET DIFFERENCE OF DATES
SELECT DATEDIFF(DAY, '2021-01-01', '2022-01-01') AS DAYinYear
GO

-- GET A MONTH NAME
SELECT DATENAME(MONTH, GETDATE()) AS 'Month'
GO

--============== 7.24 CASE ============--

SELECT employee.[name], 
eInfo.salary,
	CASE 
		WHEN (eInfo.salary < 40000) THEN 'Lower Salary'
		WHEN (eInfo.salary > 40000) THEN 'Good Salary'
		WHEN (eInfo.salary > 50000) THEN 'Better Salary'
		WHEN (eInfo.salary > 50000) THEN 'Great Salary'
END AS 'Status'
FROM employeeInfo eInfo
INNER JOIN employee ON eInfo.employeeId = employee.employeeId
GO

--============== 7.25 IIF ============--

SELECT employee.[name], 
eInfo.salary,
IIF((eInfo.salary > 50000), 'Great Salary', 'Lower Salary') AS 'Status'
FROM employeeInfo eInfo
INNER JOIN employee ON eInfo.employeeId = employee.employeeId
GO


--============== 7.26 COALESCE & ISNULL ============--

SELECT COALESCE(dp.departmentTitle, 'All Department') AS Department,
ISNULL(dg.designationTitle, 'All') AS Designation,
SUM(employeeInfo.salary) Salary
FROM employeeInfo
INNER JOIN designation dg ON dg.designationId = employeeInfo.designationId
INNER JOIN department dp ON dp.departmentId = dg.departmentId
GROUP BY  ROLLUP (dp.departmentTitle, dg.designationTitle)
ORDER BY dp.departmentTitle DESC, dg.designationTitle DESC
GO

--============== 7.27 WHILE ============--

	DECLARE @counter int
	SET @counter = 0

	WHILE @counter < 20

	BEGIN
	  SET @counter = @counter + 1
	  INSERT INTO tblComments(commentId, comment) VALUES((NEXT VALUE FOR [dbo].seqNum), NULL)
	END

	SELECT * FROM tblComments
GO

--============== 7.28 GROPING FUNCTION ============--

SELECT 
	CASE 
		WHEN GROUPING(dp.departmentTitle) = 1 THEN 'All Department'
		ELSE dp.departmentTitle
		END AS Department,
	CASE 
		WHEN GROUPING(dg.designationTitle) = 1 THEN 'All'
		ELSE dg.designationTitle
		END AS Designation,
	SUM(employeeInfo.salary) Salary

FROM employeeInfo
INNER JOIN designation dg ON dg.designationId = employeeInfo.designationId
INNER JOIN department dp ON dp.departmentId = dg.departmentId
GROUP BY  ROLLUP (dp.departmentTitle, dg.designationTitle)
ORDER BY dp.departmentTitle DESC, dg.designationTitle DESC
GO

--============== 7.29 RANKING FUNCTION ============--

SELECT 
RANK() OVER(ORDER BY traineeId) AS 'Rank',
DENSE_RANK() OVER(ORDER BY courseId) AS 'Dense_Rank',
NTILE(3) OVER(ORDER BY netSale) AS 'NTILE',
traineeId,
courseId, 
netSale
FROM courseSales
GO

--============== 7.30 IF ELSE & PRINT ============--

DECLARE @totalSales MONEY
SELECT @totalSales = SUM((netSale))
FROM courseSales
WHERE YEAR(courseSales.salesDate) = YEAR(GETDATE())
IF @totalSales > 1000000
	BEGIN
		PRINT 'Great ! The sales is greater than target in this year !!'
	END
ELSE
	BEGIN
		PRINT 'Didn''t Reached the goal !'
	END
GO

--============== 7.31 TRY CATCH ============--

BEGIN TRY
	DELETE FROM course
	PRINT 'SUCCESSFULLY DELETED'
END TRY

BEGIN CATCH
		DECLARE @Error VARCHAR(200) = 'Error' + CONVERT(varchar, ERROR_NUMBER(), 1) + ' : ' + ERROR_MESSAGE()
		PRINT (@Error)
END CATCH
GO

--============== 7.32 GOTO ============--

DECLARE @value INT
SET @value = 0

WHILE @value <= 10
	BEGIN
	   IF @value = 2
		  GOTO printMsg
	   SET @value = @value + 1

	   	IF @value = 9
		  GOTO printMsg2
	   SET @value = @value + 1
	END
printMsg:
   PRINT 'Crossed Value 2'
printMsg2:
   PRINT 'Crossed Value 9'
GO

--============== 7.33 WAITFOR ============--

PRINT 'HELLO'
WAITFOR DELAY '00:00:03'
PRINT 'GOOD LUCK'
GO

--============== 7.34 SYSTEM STORED PROCEDURE(sp_helptext) TO GET UNENCRYPTED STORED PROCEDURE SCRIPT  ============--

EXEC sp_helptext spUpdateTrainee
GO

--============== 7.35 TRANSACTION WITH SAVE POINT  ============--

SELECT * INTO #Product
FROM tblProduct
GO
SELECT * FROM #Product
GO

BEGIN TRANSACTION
	DELETE FROM #Product WHERE productId = 5
	SAVE TRANSACTION tran1
		DELETE FROM #Product WHERE productId = 6
		SAVE TRANSACTION tran2
			DELETE FROM #Product WHERE productId = 7
			SAVE TRANSACTION tran3

			SELECT * FROM #Product

		ROLLBACK TRANSACTION tran2
		SELECT * FROM #Product
	ROLLBACK TRANSACTION tran1
	SELECT * FROM #Product
COMMIT TRANSACTION
GO
-------------------------------------------------------------------------------------------------------

