# Member Information
use member_db_design;
CREATE TABLE Members (
    Uid INT PRIMARY KEY
);

INSERT INTO Members (Uid) VALUES
    (222),
    (111),
    (444),
    (333);

SELECT * FROM Members;

ALTER TABLE Members
ADD Email VARCHAR(13);

ALTER TABLE Members
DROP COLUMN Email;

ALTER TABLE Members
ADD Name VARCHAR(13);

UPDATE Members SET Name = 'Chandu' WHERE Uid = 111;
UPDATE Members SET Name = 'Ravi' WHERE Uid = 222;
UPDATE Members SET Name = 'Charvi' WHERE Uid = 333;
UPDATE Members SET Name = 'Anjana' WHERE Uid = 444;

ALTER TABLE Members
ADD Gender VARCHAR(13);

UPDATE Members SET Gender = 'Female' WHERE Uid = 111;
UPDATE Members SET Gender = 'Male' WHERE Uid = 222;
UPDATE Members SET Gender = 'Female' WHERE Uid = 333;
UPDATE Members SET Gender = 'Female' WHERE Uid = 444;

SELECT * FROM Members;


# 1.PERSONAL INFORMATION

CREATE TABLE PersonalDetails (
    Uid INT PRIMARY KEY,
    Name VARCHAR(20),
    Age INT CHECK (Age > 18),
    PAN VARCHAR(13),
    FOREIGN KEY (Uid) REFERENCES Members(Uid)
);

INSERT INTO PersonalDetails (Uid, Name, Age) VALUES
    (111, 'Chandu', 24),
    (222, 'Ravi', 30),
    (333, 'Charvi', 20),
    (444, 'Anjana', 23);

UPDATE PersonalDetails SET Name = 'Niru' WHERE Uid = 111;

UPDATE PersonalDetails SET PAN = 'BMZPV326' WHERE Uid = 111;
UPDATE PersonalDetails SET PAN = 'CGCG22' WHERE Uid = 222;
UPDATE PersonalDetails SET PAN = 'GGG32' WHERE Uid = 333;
UPDATE PersonalDetails SET PAN = 'FG578F' WHERE Uid = 444;

SELECT * FROM PersonalDetails;



# 2.EDUCATIONAL INFORMATION
CREATE TABLE EducationInformation (
    Uid INT,
    CollegeName VARCHAR(30),
    Marks INT,
    Percentage INT,
    Class VARCHAR(5),
    RollNo INT UNIQUE,
    FOREIGN KEY (Uid) REFERENCES Members(Uid)
);

INSERT INTO EducationInformation (Uid, CollegeName, Marks, Percentage, Class) VALUES
    (111, 'GVP', 800, 80, 'CSE'),
    (333, 'Chaitanya', 700, 70, 'ECE'),
    (222, 'Narayana', 600, 60, 'EEE');

UPDATE EducationInformation SET RollNo = 101 WHERE Uid = 111;
UPDATE EducationInformation SET RollNo = 102 WHERE Uid = 222;
UPDATE EducationInformation SET RollNo = 103 WHERE Uid = 333;

SELECT * FROM EducationInformation;

# 3.EMPLOYMENT DETAILS
CREATE TABLE EmployeeDetails (
    Uid INT PRIMARY KEY,
    Name VARCHAR(30),
    Salary INT,
    CompanyName VARCHAR(15),
    Role VARCHAR(15) NOT NULL,
    FOREIGN KEY (Uid) REFERENCES Members(Uid)
);

INSERT INTO EmployeeDetails (Uid, Name, Salary, CompanyName) VALUES
    (111, 'Chandu', 6000, 'IBC'),
    (222, 'Ravi', 7000, 'IBC'),
    (333, 'Charvi', 8000, 'IBC'),
    (444, 'Anjana', 9000, 'IBC');

UPDATE EmployeeDetails SET Role = 'Developer' WHERE Uid = 111;
UPDATE EmployeeDetails SET Role = 'Tester' WHERE Uid = 222;
UPDATE EmployeeDetails SET Role = 'HR' WHERE Uid = 333;
UPDATE EmployeeDetails SET Role = 'Team Lead' WHERE Uid = 444;

SELECT * FROM EmployeeDetails;


# 4. CONTACT DETAILS
CREATE TABLE ContactInfo (
    Uid INT,
    PhoneNumber BIGINT,
    Email VARCHAR(20) UNIQUE,
    LinkedInId VARCHAR(30),
    FOREIGN KEY (Uid) REFERENCES Members(Uid)
);

INSERT INTO ContactInfo (Uid, PhoneNumber, Email) VALUES
    (222, 1234567890, 'abc@gmail.com'),
    (333, 2345678909, 'xyz@gmail.com');
COMMIT;

UPDATE ContactInfo SET LinkedInId = 'abc_dhf' WHERE Uid = 222;
UPDATE ContactInfo SET LinkedInId = 'app_dev' WHERE Uid = 333;

ALTER TABLE ContactInfo
DROP COLUMN LinkedInId;

SELECT * FROM ContactInfo;

# 5.ADDRESS DETAILS 

CREATE TABLE AddressInformation (
    Uid INT,
    City VARCHAR(20),
    State VARCHAR(20),
    Pincode INT NOT NULL,
    Country VARCHAR(20),
    FOREIGN KEY (Uid) REFERENCES Members(Uid)
);

INSERT INTO AddressInformation (Uid, City, State, Pincode, Country) VALUES
    (111, 'Durg', 'CG', 491441, 'India'),
    (222, 'Rajnandgaon', 'CG', 491442, 'India'),
    (333, 'Vizag', 'AP', 532201, 'India');

SELECT * FROM AddressInformation;

 # 6.Bank details           
CREATE TABLE BankInfo (
    AccNum BIGINT PRIMARY KEY,
    Code VARCHAR(10),
    BankName VARCHAR(20),
    Uid INT,
    Name VARCHAR(30),
    FOREIGN KEY (Uid) REFERENCES Members(Uid)
);

INSERT INTO BankInfo (AccNum, Code, BankName, Uid) VALUES
    (12341, '123AXL', 'Axis', 111),
    (76543, '321BOB', 'BOB', 222),
    (11111, '566HDFC', 'HDFC', 333);
COMMIT;

UPDATE BankInfo SET Name = 'Ravi' WHERE Uid = 222;
UPDATE BankInfo SET Name = 'Chandu' WHERE Uid = 111;
UPDATE BankInfo SET Name = 'Anjana' WHERE Uid = 444;
UPDATE BankInfo SET Name = 'Charvi' WHERE Uid = 333;

SELECT * FROM BankInfo;
COMMIT;

