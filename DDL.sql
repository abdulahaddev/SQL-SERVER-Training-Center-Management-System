
/*
					SQL Project Name : Training Center Management System(TCMS)
							      By : Abdul Ahad   

 --------------------------------------------------------------------------------

Table of Contents: DDL
			=> SECTION 01: Created a Database [TCMS]
			=> SECTION 02: Created Appropriate Tables with column definition related to the project
			=> SECTION 03: ALTER, DROP AND MODIFY TABLES & COLUMNS
			=> SECTION 04: CREATE CLUSTERED AND NONCLUSTERED INDEX
			=> SECTION 05: CREATE SEQUENCE & ALTER SEQUENCE
			=> SECTION 06: CREATE A VIEW & ALTER VIEW
			=> SECTION 07: STORED STORED PROCEDURE & ALTER STORED PROCEDURE
			=> SECTION 08: CREATE FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED) & ALTER FUNCTION
			=> SECTION 09: CREATE TRIGGER (FOR/AFTER TRIGGER)
			=> SECTION 10: CREATE TRIGGER (INSTEAD OF TRIGGER)
*/


/*
==============================  SECTION 01  ==============================
	   CHECK DATABASE EXISTANCE & CREATE DATABASE WITH ATTRIBUTES
==========================================================================
*/

USE master
GO

IF DB_ID('TCMS') IS NOT NULL
DROP DATABASE TCMS
GO

CREATE DATABASE TCMS
ON
(
	name = 'tcm_data',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\tcm_data.mdf',
	size = 5MB,
	maxsize = 50MB,
	filegrowth = 5%
)
LOG ON
(
	name = 'tcm_log',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\tcm_log.ldf',
	size = 8MB,
	maxsize = 40MB,
	filegrowth = 5MB
)
GO

USE TCMS
GO


/*
==============================  SECTION 02  ==============================
		          CREATE TABLES WITH COLUMN DEFINITION 
==========================================================================
*/

--============== Table with IDENTITY, PRIMARY KEY & nullability CONSTRAINT... ============--

-- USE SCHEMA
CREATE TABLE gender
(
	genderId INT IDENTITY PRIMARY KEY,
	genderTitle CHAR(10) NOT NULL
)
GO
CREATE TABLE religion
(
	religionId INT IDENTITY PRIMARY KEY,
	religionTitle CHAR(15) NOT NULL
)
GO
CREATE TABLE bloodGroup
(
	bloodGroupId INT IDENTITY PRIMARY KEY,
	bloodGroupTitle CHAR(2) NOT NULL
)
GO
CREATE TABLE country
(
	countryId INT IDENTITY PRIMARY KEY,
	countryName CHAR(15) NOT NULL
)
GO
CREATE TABLE city
(
	cityid INT IDENTITY PRIMARY KEY,
	cityname CHAR(15) NOT NULL,
)
GO
CREATE TABLE maritalStatus
(
	maritalStatusId INT IDENTITY PRIMARY KEY,
	[status] VARCHAR(10) NOT NULL
)
GO
CREATE TABLE [shift]
(
	shiftId INT IDENTITY PRIMARY KEY,
	shiftTitle CHAR(9) NOT NULL
)
GO
CREATE TABLE season
(
	seasonId INT IDENTITY PRIMARY KEY,
	seasonName VARCHAR(15) NOT NULL
)
GO
CREATE TABLE course
(
	courseId INT IDENTITY PRIMARY KEY,
	courseTitle VARCHAR(40) NOT NULL,
	courseDuration CHAR(5) NOT NULL,
)
GO
CREATE TABLE traineeCategory
(
	categoryId UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
	categoryName VARCHAR(40) NOT NULL,
)
GO
--============== Table with PRIMARY KEY & FOREIGN KEY & DEFAULT CONSTRAINT... ============--
CREATE TABLE trainees
(
	traineeId INT IDENTITY PRIMARY KEY,
	[name] VARCHAR(50) NOT NULL,
	dob DATE NOT NULL,
	genderId INT REFERENCES gender(genderId),
	maritalStatusId INT REFERENCES maritalStatus(maritalStatusId),
	bloodGroupId INT REFERENCES bloodGroup(bloodGroupId),
	nid CHAR(10) UNIQUE,
	father VARCHAR(50) NOT NULL,
	mother VARCHAR(50) NOT NULL,
	email VARCHAR(40) UNIQUE,
	phone CHAR(20) UNIQUE,
	[address] VARCHAR(70) NOT NULL,
	cityId INT REFERENCES city(cityId),
	countryId INT REFERENCES country(countryId),
	postalCode NCHAR(12) DEFAULT NULL,
	reference VARCHAR(70) DEFAULT 'N/A',
	closingDate DATE NULL,
	closingRemarks NVARCHAR(200) NULL,
	website VARCHAR(30) NULL
)
GO
--============== Table with CHECK CONSTRAINT & set CONSTRAINT name ============--
CREATE TABLE instructor
(
	instructorId INT IDENTITY PRIMARY KEY,
	[name] VARCHAR(50) NOT NULL,
	dob DATE NOT NULL,
	genderId INT REFERENCES gender(genderId),
	maritalStatusId INT REFERENCES maritalStatus(maritalStatusId),
	bloodGroupId INT REFERENCES bloodGroup(bloodGroupId),
	nid CHAR(10) UNIQUE CHECK(nid LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	email VARCHAR(40) UNIQUE CONSTRAINT ck_emailCheck CHECK (email LIKE '%@%' ),
	phone CHAR(20) UNIQUE CHECK(phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	[address] VARCHAR(70) NOT NULL,
	cityId INT REFERENCES city(cityId),
	countryId INT REFERENCES country(countryId),
	postalCode CHAR(12) DEFAULT NULL,
	payRate MONEY DEFAULT 0.00
)
GO
--============== Table with composite PRIMARY KEY ============--
CREATE TABLE traineeCourseInfo
(
	traineeId INT REFERENCES trainees(traineeId),
	courseId INT REFERENCES course(courseId),
	seasonId INT REFERENCES season(seasonId),
	shiftId INT REFERENCES [shift](shiftId),
	instructorId INT REFERENCES instructor(instructorId),
	PRIMARY KEY(traineeId,courseId,seasonId,shiftId,instructorId)
)
GO
CREATE TABLE courseSales
(
	salesId INT IDENTITY(7001, 1) PRIMARY KEY,
	salesDate DATETIME DEFAULT GETDATE(),
	traineeId INT REFERENCES trainees(traineeId),
	courseId INT REFERENCES course(courseId),
	courseFee MONEY DEFAULT 0.00,
	discount MONEY DEFAULT 0.00,
	netSale AS (courseFee * (1-discount)),
	CONSTRAINT discountCheck CHECK(discount >= 0.00)
)
GO
CREATE TABLE department
(
	departmentId INT IDENTITY PRIMARY KEY,
	departmentTitle VARCHAR(50) NOT NULL
)
GO
CREATE TABLE designation
(
	designationId INT IDENTITY PRIMARY KEY,
	designationTitle VARCHAR(50) NOT NULL,
	departmentId INT REFERENCES department(departmentId)
)
GO
CREATE TABLE employee
(
	employeeId INT IDENTITY PRIMARY KEY,
	[name] VARCHAR(50) NOT NULL,
	dob DATE NOT NULL,
	genderId INT REFERENCES gender(genderId),
	maritalStatusId INT REFERENCES maritalStatus(maritalStatusId),
	bloodGroupId INT REFERENCES bloodGroup(bloodGroupId),
	nid CHAR(10) UNIQUE CHECK(nid LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	email VARCHAR(40) UNIQUE CONSTRAINT ck_email CHECK (email LIKE '%@%' ),
	phone CHAR(20) UNIQUE CHECK(phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	[address] VARCHAR(70) NOT NULL,
	cityId INT REFERENCES city(cityId),
	countryId INT REFERENCES country(countryId),
	postalCode CHAR(12) DEFAULT NULL,
)
GO
CREATE TABLE employeeInfo
(
	employeeId INT REFERENCES employee(employeeId),
	designationId INT REFERENCES designation(designationId),
	salary MONEY DEFAULT 0.00,
	vat FLOAT DEFAULT .03,
	netSalary AS (salary * (1 - vat))
	PRIMARY KEY (employeeId, designationId)
)
GO
CREATE TABLE tblProduct
(
	productId INT IDENTITY PRIMARY KEY,
	productName VARCHAR(40) NOT NULL,
	unitPrice MONEY NOT NULL,
	stock INT DEFAULT 0
)
GO
CREATE TABLE tblStockIn
(
	stockId INT IDENTITY PRIMARY KEY,
	stockDate DATETIME DEFAULT GETDATE(),
	productId INT REFERENCES tblProduct(productId),
	qty INT NOT NULL
)
GO
CREATE TABLE tblProductForInfrastructure
(
	OrderId INT IDENTITY PRIMARY KEY,
	OrderDate DATETIME DEFAULT GETDATE(),
	productId INT REFERENCES tblProduct(productId),
	quantity INT NOT NULL
)
GO
CREATE TABLE tblComments
(
	commentId INT,
	comment NVARCHAR(100) NULL
)
GO
--============== CREATE A SCHEMA ============--

CREATE SCHEMA tcm
GO
--============== USE SCHEMA IN A TABLE ============--

CREATE TABLE tcm.tblCommentsInfo
(
	commentId INT,
	comment NVARCHAR(100) NULL,
	commenterAge INT NULL
)
GO

/*
==============================  SECTION 03  ==============================
		          ALTER, DROP AND MODIFY TABLES & COLUMNS
==========================================================================
*/


--============== ALTER TABLE SCHEMA AND TRANSFER TO [DBO] ============--

ALTER SCHEMA dbo TRANSFER tcm.tblCommentsInfo
GO

--============== Update column definition ============--

ALTER TABLE bloodGroup
ALTER COLUMN bloodGroupTitle CHAR(10) NOT NULL
GO

--============== ADD column with DEFAULT CONSTRAINT ============--

ALTER TABLE course
ADD courseFee MONEY DEFAULT 0.00
GO

--============== ADD CHECK CONSTRAINT with defining name ============--

ALTER TABLE trainees
ADD CONSTRAINT CK_nidValidate CHECK(nid LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
CONSTRAINT CK_phoneValidate CHECK(phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
CONSTRAINT CK_emailValidate CHECK(email LIKE '%@%' )
GO

--============== DROP COLUMN ============--

ALTER TABLE trainees
DROP COLUMN website
GO

--============== DROP TABLE ============--

IF OBJECT_ID('traineeCategory') IS NOT NULL
DROP TABLE traineeCategory
GO

--============== DROP SCHEMA ============--

DROP SCHEMA tcm
GO

/*
==============================  SECTION 04  ==============================
		          CREATE CLUSTERED AND NONCLUSTERED INDEX
==========================================================================
*/

-- Clustered Index
CREATE CLUSTERED INDEX IX_tblComments
ON tblComments
(
	commentId
)
GO

-- Nonclustered Index
CREATE UNIQUE NONCLUSTERED INDEX IX_courseSalesDate
ON employee
(
	nid,
	phone
)
GO

/*
==============================  SECTION 05  ==============================
							 CREATE SEQUENCE
==========================================================================
*/

CREATE SEQUENCE seqNum
	AS INT
	START WITH 1
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 200
	CYCLE
	CACHE 10
GO

--============== ALTER SEQUENCE ============--

ALTER SEQUENCE seqNum
	MAXVALUE 200
	CYCLE
	CACHE 9
GO

/*
==============================  SECTION 06  ==============================
							  CREATE A VIEW
==========================================================================
*/

CREATE VIEW VW_OrderSalesInfo
AS
SELECT traineeId, courseId, courseFee, discount FROM courseSales
GO

-- VIEW WITH ENCRYPTION, SCHEMABINDING & WITH CHECK OPTION
-- A VIEW to get today course sales information

CREATE VIEW VW_TodayCourseSales
WITH SCHEMABINDING, ENCRYPTION
AS
SELECT salesId, traineeId, courseId, courseFee, discount, netSale FROM dbo.courseSales
WHERE CONVERT(DATE, salesDate) = CONVERT(DATE, GETDATE())
WITH CHECK OPTION
GO



--============== ALTER VIEW ============--

ALTER VIEW VW_OrderSalesInfo
AS
SELECT traineeId, courseId, courseFee, discount, netSale FROM courseSales
GO

/*
==============================  SECTION 07  ==============================
							 STORED PROCEDURE
==========================================================================
*/
--============== STORED PROCEDURE for insert data using parameter ============--
CREATE PROCEDURE spInsertTrainee	@name VARCHAR(50),
									@dob DATE,
									@genderId INT,
									@maritalStatusId INT,
									@bloodGroupId INT,
									@nid CHAR(10),
									@father VARCHAR(50),
									@mother VARCHAR(50),
									@email VARCHAR(40),
									@phone CHAR(20),
									@address VARCHAR(70),
									@cityId INT,
									@countryId INT,
									@postalCode NCHAR(12),
									@reference VARCHAR(70),
									@closingDate DATE,
									@closingRemarks NVARCHAR(200)
AS
BEGIN
	INSERT INTO trainees([name], dob, genderId, maritalStatusId, bloodGroupId, nid, father, mother, email, phone, [address], cityId, countryId, postalCode, reference, closingDate, closingRemarks) 
	VALUES(@name, @dob, @genderId, @maritalStatusId, @bloodGroupId, @nid, @father, @mother, @email, @phone, @address, @cityId, @countryId, @postalCode, @reference, @closingDate, @closingRemarks)
END
GO

--============== STORED PROCEDURE for insert data with OUTPUT parameter ============--
CREATE PROCEDURE spInsertInstructor	@name VARCHAR(50),
									@dob DATE,
									@genderId INT,
									@maritalStatusId INT,
									@bloodGroupId INT,
									@nid CHAR(10),
									@email VARCHAR(40),
									@phone CHAR(20),
									@address VARCHAR(70),
									@cityId INT,
									@countryId INT,
									@postalCode NCHAR(12),
									@payRate MONEY,
									@Id INT OUTPUT
AS
BEGIN
	INSERT INTO instructor([name], dob, genderId, maritalStatusId, bloodGroupId, nid, email, phone, [address], cityId, countryId, postalCode, payRate) 
	VALUES(@name, @dob, @genderId, @maritalStatusId, @bloodGroupId, @nid, @email, @phone, @address, @cityId, @countryId, @postalCode, @payRate)
	SELECT @Id = IDENT_CURRENT('instructor')
END
GO


--============== STORED PROCEDURE for UPDATE data ============--
CREATE PROCEDURE spUpdateTrainee	@traineeId INT,
									@closingDate DATE
AS
BEGIN
	UPDATE trainees
	SET
	closingDate = @closingDate
	WHERE traineeId = @traineeId
END
GO


--============== STORED PROCEDURE for DELETE Table data ============--

CREATE PROCEDURE spDeleteCourseSales	@salesId INT
AS
BEGIN
	DELETE FROM courseSales
	WHERE salesId = @salesId
END
GO

--============== TRY CATCH IN A STORED PROCEDURE & RAISERROR WITH ERROR NUMBER AND ERROR MESSAGE ============--

CREATE PROCEDURE spRaisError
AS
BEGIN
	BEGIN TRY
		DELETE FROM course
	END TRY
	BEGIN CATCH
		DECLARE @Error VARCHAR(200) = 'Error' + CONVERT(varchar, ERROR_NUMBER(), 1) + ' : ' + ERROR_MESSAGE()
		RAISERROR(@Error, 1, 1)
	END CATCH
END
GO
--============== ALTER STORED PROCEDURE ============--

ALTER PROCEDURE spUpdateTrainee	@traineeId INT,
								@closingDate DATE,
								@closingRemarks NVARCHAR(200)
AS
BEGIN
	UPDATE trainees
	SET
	closingDate = @closingDate,
	closingRemarks = @closingRemarks
	WHERE traineeId = @traineeId
END
GO

/*
==============================  SECTION 08  ==============================
								 FUNCTION
==========================================================================
*/

--============== A SCALAR FUNCTION ============--
-- A Scalar Function to get Current Year Total Net Sales

CREATE FUNCTION fnCurrentYearSales()
RETURNS MONEY
AS
BEGIN
	DECLARE @totalSales MONEY

	SELECT @totalSales = SUM((netSale))
	FROM courseSales
	WHERE YEAR(courseSales.salesDate) = YEAR(GETDATE())

	RETURN @totalSales
END
GO

--============== A SIMPLE TABLE VALUED FUNCTION ============--
-- A Inline Table Valued Function to get monthly total sales, discount & net sales using two parameter @year & @month

CREATE FUNCTION fnMonthlyCourseSales(@year INT, @month INT)
RETURNS TABLE
AS
RETURN
(
	SELECT 
			SUM(courseFee) AS 'Total Sales',
			SUM(netSale) AS 'Net Sales'
	FROM courseSales
	WHERE YEAR(courseSales.salesDate) = @year AND MONTH(courseSales.salesDate) = @month

)
GO

--============== A MULTISTATEMENT TABLE VALUED FUNCTION ============--

-- Function to get monthly net sales using two parameter @year & @month
CREATE FUNCTION fnMonthlySalesDetails(@year INT, @month INT)
RETURNS @sales TABLE
(
	[Sales Id] INT,
	[Sales Date] DATETIME,
	[Trainee Name] VARCHAR(50),
	[Course Title] VARCHAR(50),
	[Course Fee] MONEY,
	Discount MONEY,
	[Net Sale] MONEY
)
AS
BEGIN	
	INSERT INTO @sales
	SELECT
	courseSales.salesId,
	courseSales.salesDate,
	trainees.[name],
	course.courseTitle,
	courseSales.courseFee,
	courseSales.discount,
	courseSales.netSale
	FROM courseSales
	INNER JOIN trainees ON trainees.traineeId = courseSales.traineeId
	INNER JOIN course ON course.courseId = courseSales.courseId
	WHERE YEAR(courseSales.salesDate) = @year AND MONTH(courseSales.salesDate) = @month

	RETURN
END
GO

--============== ALTER FUNCTION ============--

ALTER FUNCTION fnMonthlyCourseSales(@year INT, @month INT)
RETURNS TABLE
AS
RETURN
(
	SELECT 
	SUM(courseFee) AS 'Total Sales',
	SUM(discount) AS 'Total Discount',
	SUM(netSale) AS 'Net Sales'
	FROM courseSales
	WHERE YEAR(courseSales.salesDate) = @year AND MONTH(courseSales.salesDate) = @month
)
GO
/*
==============================  SECTION 09  ==============================
							FOR/AFTER TRIGGER
==========================================================================
*/

-- Create trigger on Stockin table and update stock in product table
CREATE TRIGGER trStockIn
ON tblStockIn
FOR INSERT
AS
BEGIN
	DECLARE @pid INT
	DECLARE @stock INT

	SELECT
	@pid = productId,
	@stock = inserted.qty
	FROM inserted

	UPDATE tblProduct
	SET stock = stock + @stock
	WHERE productId = @pid
	PRINT 'Stock updated via Stock Entry'
END
GO

--============== AN AFTER/FOR TRIGGER FOR INSERT, UPDATE, DELETE ============--

-- Create trigger on tblProductForInfrastructure table and update stock in product table
CREATE TRIGGER trProductStockManage
ON tblProductForInfrastructure
FOR INSERT, UPDATE, DELETE
AS
	BEGIN
		DECLARE @pid INT
		DECLARE @qty INT
				-- Check if this trigger is executed only for updated
				IF (EXISTS(SELECT * FROM INSERTED) AND EXISTS(SELECT * FROM DELETED))
					BEGIN
						UPDATE tblProduct
						SET stock = (CASE
										WHEN i.quantity > d.quantity THEN stock - (i.quantity-d.quantity)
										WHEN i.quantity < d.quantity THEN stock + (d.quantity-i.quantity)
										ELSE i.quantity
									END)
						FROM inserted As i
						INNER JOIN deleted AS d
						ON i.productId = d.productId
						WHERE tblProduct.productId = i.productId
						PRINT 'Stock updated via modified sales entry'
					END
				--Check if this trigger is for only for inserted
				ELSE IF (EXISTS(SELECT * FROM INSERTED) AND NOT EXISTS(SELECT * FROM DELETED))
					BEGIN
						SELECT
						@pid = productid,
						@qty = quantity
						FROM inserted

						UPDATE tblProduct
						SET stock = stock - @qty
						WHERE productId = @pid
						PRINT 'Stock updated via new sales'
					END
				-- Check if this trigger is executed only for deleted
				ELSE IF (EXISTS(SELECT * FROM DELETED) AND NOT EXISTS(SELECT * FROM INSERTED))
					BEGIN
						SELECT
						@pid = productid,
						@qty = quantity
						FROM deleted

						UPDATE tblProduct
						SET stock = stock + @qty
						WHERE productId = @pid
						PRINT 'Stock updated due to deleted sales id'
					END
				-- If not match any condition then rollback the transaction
				ELSE ROLLBACK TRANSACTION
		END
GO
/*
==============================  SECTION 10  ==============================
							INSTEAD OF TRIGGER
==========================================================================
*/

-- Trigger For get price from another table and manipulate data in current table
CREATE TRIGGER trcourseSales
ON courseSales
INSTEAD OF INSERT
AS
BEGIN
	IF ((SELECT COUNT(*) FROM inserted) > 0)
		BEGIN
			INSERT INTO courseSales(traineeId, courseId, courseFee, discount)
			SELECT
			i.traineeId,
			i.courseId,
			course.courseFee,
			discount
			from inserted i
			INNER JOIN course ON course.courseId = i.courseId
		END
	ELSE
	BEGIN
		PRINT 'Error Occured for Inserting Data Into courseSales Table !'
	END
END
GO

--============== AN INSTEAD OF TRIGGER ON VIEW ============--

CREATE TRIGGER trViewInsteadInsert
ON VW_OrderSalesInfo
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO courseSales(traineeId, courseId)
	SELECT i.traineeId, i.courseId FROM inserted i
END
GO

--============== ALTER TRIGGER ============--

ALTER TRIGGER trViewInsteadInsert
ON VW_OrderSalesInfo
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO courseSales(traineeId, courseId, discount)
	SELECT i.traineeId, i.courseId, i.discount FROM inserted i
END
GO
