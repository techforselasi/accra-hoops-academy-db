CREATE DATABASE IF NOT EXISTS Accra_Hoops_Academy_DB;
USE Accra_Hoops_Academy_DB;	

CREATE TABLE IF NOT EXISTS Student (
    Student_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Date_of_Birth DATE NOT NULL,
    Email_Address VARCHAR(100) UNIQUE,
    Student_Guardian_Phone_Number VARCHAR(20) NOT NULL,
    Enrollment_Date DATE NOT NULL
);-- DONT FORGET TO EDIT THIS ATTRIBUTE 'ENROLLMENT TO ENROLMENT'

CREATE TABLE IF NOT EXISTS Coach (
    Coach_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Email_Address VARCHAR(100) UNIQUE,
    Phone_Number VARCHAR(20) NOT NULL,
    Specialisation VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Program (
    Program_ID INT AUTO_INCREMENT PRIMARY KEY,
    Program_Name VARCHAR(100) UNIQUE NOT NULL,
    Program_Fee DECIMAL(10,2) NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Facility (
    Facility_ID INT AUTO_INCREMENT PRIMARY KEY,
    Facility_Name VARCHAR(100) UNIQUE NOT NULL,
    Capacity INT,
    Facility_Type VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Product (
    Product_ID INT AUTO_INCREMENT PRIMARY KEY,
    Product_Name VARCHAR(100) UNIQUE NOT NULL,
    Cost_Price DECIMAL(10,2) NOT NULL,
    Selling_Price DECIMAL(10,2) NOT NULL,
    Current_Stock_Level INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Training_Sessions (
    Session_ID INT AUTO_INCREMENT PRIMARY KEY,
    Session_Date DATE NOT NULL,
    Start_Time TIME NOT NULL,
    End_Time TIME NOT NULL,
    Program_ID INT NOT NULL,
    Coach_ID INT, 
    Facility_ID INT NOT NULL,
    FOREIGN KEY (Program_ID) REFERENCES Program(Program_ID),
    FOREIGN KEY (Coach_ID) REFERENCES Coach(Coach_ID),
    FOREIGN KEY (Facility_ID) REFERENCES Facility(Facility_ID)
);

CREATE TABLE IF NOT EXISTS Enrolment (
    Enrolment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Enrolment_Date DATE NOT NULL,
    Enrolment_Status VARCHAR(20) NOT NULL,
    Student_ID INT NOT NULL,
    Program_ID INT NOT NULL,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Program_ID) REFERENCES Program(Program_ID)
);

CREATE TABLE IF NOT EXISTS Payment (
    Payment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Payment_Date DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Payment_Method VARCHAR(50) NOT NULL,
    Student_ID INT NOT NULL,
    Program_ID INT,  
    Product_ID INT,   
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Program_ID) REFERENCES Program(Program_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);


INSERT INTO Student (First_Name, Last_Name, Date_of_Birth, Email_Address, Student_Guardian_Phone_Number, Enrollment_Date) VALUES
('Kwame', 'Nkrumah', '2010-03-15', 'kwame.n@example.com', '+233241234567', '2023-09-01'),
('Ama', 'Serwaa', '2011-07-22', 'ama.s@example.com', '+233551234568', '2023-09-01'),
('Leslie', 'Kagatse', '2004-11-19', 'lesliekagatse@example.com', '+233557413169', '2023-10-10'),
('Adwoa', 'Adom', '2012-05-05', 'adwoa.a@example.com', '+233271234570', '2024-01-15'),
('Yaw', 'Danquah', '2010-11-11', 'yaw.d@example.com', '+233541234571', '2024-02-20');

INSERT INTO Coach (First_Name, Last_Name, Email_Address, Phone_Number, Specialisation) VALUES
('Akua', 'Ofori', 'akua.o@example.com', '+233245001001', 'Ball Handling'),
('Kwasi', 'Boadu', 'kwasi.b@example.com', '+233545001002', 'Shooting'),
('Nana', 'Opoku', 'nana.o@example.com', '+233205001003', 'Defense'),
('Yaa', 'Asantewaa', 'yaa.a@example.com', '+233275001004', 'Fitness & Conditioning'),
('Kojo', 'Annan', 'kojo.a@example.com', '+233555001005', NULL);

INSERT INTO Program (Program_Name, Program_Fee, Start_Date, End_Date) VALUES
('Basketball Fundamentals', 250.00, '2024-09-01', '2024-12-15'),
('Advanced Shooting Clinic', 300.00, '2024-10-01', '2024-11-30'),
('Youth Development League', 400.00, '2025-01-10', '2025-05-20'),
('Elite Training Camp', 500.00, '2025-07-01', '2025-07-31'),
('Personalized Coaching', 150.00, '2024-08-01', '2025-07-31'); 

INSERT INTO Facility (Facility_Name, Capacity, Facility_Type) VALUES
('Main Basketball Court', 50, 'Court'),
('Gymnasium', 100, 'Gym'),
('Outdoor Half Court', 20, 'Court'),
('Strength & Conditioning Room', 30, 'Gym'),
('Rehabilitation Center', 15, 'Medical');

INSERT INTO Product (Product_Name, Cost_Price, Selling_Price, Current_Stock_Level) VALUES
('Team Jersey (Size M)', 25.00, 45.00, 50),
('Basketball (Size 7)', 15.00, 30.00, 30),
('Ankle Brace', 10.00, 25.00, 40),
('Water Bottle (Accra Hoops Logo)', 5.00, 12.00, 75),
('Basketball Shorts (Size L)', 20.00, 38.00, 60);

INSERT INTO Training_Sessions (Session_Date, Start_Time, End_Time, Program_ID, Coach_ID, Facility_ID) VALUES
('2024-09-05', '09:00:00', '10:30:00', 1, 1, 1), 
('2024-09-06', '14:00:00', '15:30:00', 1, 2, 1), 
('2024-10-10', '18:00:00', '19:00:00', 2, 3, 2), 
('2025-01-15', '10:00:00', '11:00:00', 3, NULL, 3), 
('2025-07-05', '08:00:00', '12:00:00', 4, 4, 4); 

INSERT INTO Enrolment (Enrolment_Date, Enrolment_Status, Student_ID, Program_ID) VALUES
('2023-09-01', 'Active', 1, 1), 
('2023-09-01', 'Active', 2, 1), 
('2023-10-10', 'Active', 3, 2), 
('2024-01-15', 'Active', 4, 3), 
('2024-02-20', 'Active', 5, 1); 


INSERT INTO Payment (Payment_Date, Amount, Payment_Method, Student_ID, Program_ID, Product_ID) VALUES
('2023-09-01', 250.00, 'Mobile Money', 1, 1, NULL),  -- Kwame Nkrumah pays for Basketball Fundamentals
('2023-09-01', 45.00, 'Cash', 1, NULL, 1),      -- Kwame Nkrumah buys a Team Jersey
('2023-10-10', 300.00, 'Bank Transfer', 3, 2, NULL), -- Leslie Kagatse pays for Advanced Shooting Clinic
('2024-01-15', 400.00, 'Mobile Money', 4, 3, NULL),  -- Adwoa Adom pays for Youth Development League
('2024-02-20', 30.00, 'Cash', 5, NULL, 2);      -- Yaw Danquah buys a Basketball

-- SHOWING TABLES WITH SAMPLED DATA INSIDE
SELECT * FROM Student;

SELECT * FROM Coach;

SELECT * FROM Program;

SELECT * FROM Facility;

SELECT * FROM Payment;

SELECT * FROM Training_Sessions;

SELECT * FROM Product;

SELECT * FROM Enrolment;

-- QUERY DEMONSTRATION
SELECT
    Student_ID,
    First_Name,
    Last_Name,
    Email_Address
FROM
    Student
ORDER BY
    Last_Name ASC;
 
 --  SELECTING WITH SPECIFIC CONDITIONS 
    SELECT
    S.First_Name,
    S.Last_Name,
    E.Enrolment_Date,
    P.Program_Name
FROM
    Student AS S
JOIN
    Enrolment AS E ON S.Student_ID = E.Student_ID
JOIN
    Program AS P ON E.Program_ID = P.Program_ID
WHERE
    P.Program_Name = 'Basketball Fundamentals' AND E.Enrolment_Date > '2023-10-01';
    
    SELECT
    P.Program_Name,
    COUNT(E.Student_ID) AS Number_of_Students_Enroled
FROM
    Program AS P
JOIN
    Enrolment AS E ON P.Program_ID = E.Program_ID
GROUP BY
    P.Program_Name
ORDER BY
    Number_of_Students_Enroled DESC;

-- UPDATING STOCK
SELECT Product_ID, Product_Name, Current_Stock_Level
FROM Product
WHERE Product_Name = 'Team Jersey (Size M)';

UPDATE Product
SET
    Current_Stock_Level = 45
WHERE
    Product_Name = 'Team Jersey (Size M)';

SELECT Product_ID, Product_Name, Current_Stock_Level
FROM Product
WHERE Product_Name = 'Team Jersey (Size M)';

-- DELETING DATA
SELECT * FROM Training_Sessions WHERE Session_ID = 1;
DELETE FROM Training_Sessions
WHERE Session_ID = 1;
SELECT * FROM Training_Sessions WHERE Session_ID = 1;











