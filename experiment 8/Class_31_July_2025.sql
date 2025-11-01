-- We are given two tables Person and MovieRating


CREATE TABLE Person (
    PersonID INT IDENTITY(1,1) PRIMARY KEY, -- Auto-increment primary key
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Email VARCHAR(100)
);

INSERT INTO Person (FirstName, LastName, Age, Email)
VALUES 
('John', 'Doe', 30, 'john.doe@example.com'),
('Jane', 'Smith', 25, 'jane.smith@example.com'),
('Ravi', 'Kumar', 28, 'ravi.kumar@example.in');


CREATE TABLE MovieRating (
    RatingID INT IDENTITY(1,1) PRIMARY KEY,
    PersonID INT,         -- FK to Person table
    MovieName VARCHAR(100),
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    RatingDate DATE,
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);


-- Suppose PersonID 1 and 2 rated movies
INSERT INTO MovieRating (PersonID, MovieName, Rating, RatingDate)
VALUES
(1, 'Inception', 5, '2023-01-01'),
(1, 'Interstellar', 4, '2023-01-03'),
(2, 'Titanic', 3, '2023-02-10');

-- Use these two tables to get the number of rated movies by a person, exclude who didn't rate the movies
/*SELECT A.PersonID, COUNT(B.Rating) AS [NUMBER OF RATED MOVIES]
FROM Person as A LEFT OUTER JOIN MovieRating as B
ON A.PersonID = B.PersonID
GROUP BY A.PersonID
HAVING COUNT(B.Rating) >= 1; */


-- Better Approach
SELECT PersonID, COUNT(Rating) as [Number of Rated Movies]
FROM MovieRating
GROUP BY PersonID
HAVING Count(Rating) >= 1;


--Q2 - Find the User whose name start and ends with same Character for example: Anna having 'a' in start and end of name.

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100)
);


INSERT INTO Users (user_id, name) VALUES
(1, 'Anna'),
(2, 'Bob'),
(3, 'Alice'),
(4, 'Eve'),
(5, 'David')


-- Way 1
SELECT name
FROM Users
WHERE SUBSTRING(name, 1, 1) = SUBSTRING(name, LEN(name), 1)

-- Way 2
SELECT Name
FROM Users
WHERE LEFT(name, 1) = RIGHT(name, 1);

--Q3 Write q query to find the number of orders 
-- that were delivered in a different calendar month than they were ordered, but within the same calendar year

CREATE TABLE Orderss (
    OrderId INT PRIMARY KEY,
    OrderDate DATETIME,
    DeliveryDate DATETIME
);

INSERT INTO Orderss (OrderId, OrderDate, DeliveryDate) VALUES
(1, '2025-01-15', '2025-01-20'), -- Same month
(2, '2025-02-28', '2025-03-01'), -- Different month, same year
(3, '2025-03-15', '2025-03-25'), -- Same month
(4, '2025-04-30', '2025-05-01'), -- Different month, same year
(5, '2024-12-31', '2025-01-01'), -- Different year
(6, '2025-06-10', '2025-06-15'), -- Same month
(7, '2025-07-01', '2025-08-01'); -- Different month, same year

SELECT COUNT(*) as [Number of Such Records]
FROM Orderss 
WHERE MONTH(OrderDate) != MONTH(DeliveryDate)
AND YEAR(OrderDate) = YEAR(DeliveryDate);




--Q4 - Find the Working Hours of Each Employee

CREATE TABLE EmployeeLogs (
    log_id INT PRIMARY KEY,
    emp_id INT,
    emp_name VARCHAR(100),
    log_time DATETIME,
    log_type VARCHAR(10)  -- 'IN' or 'OUT'
);

INSERT INTO EmployeeLogs (log_id, emp_id, emp_name, log_time, log_type) VALUES
(1, 101, 'Alice', '2025-07-20 08:50:00', 'IN'),
(2, 101, 'Alice', '2025-07-20 17:15:00', 'OUT'),
(3, 102, 'Bob',   '2025-07-20 09:05:00', 'IN'),
(4, 102, 'Bob',   '2025-07-20 18:00:00', 'OUT'),
(5, 101, 'Alice', '2025-07-21 08:55:00', 'IN'),
(6, 101, 'Alice', '2025-07-21 17:00:00', 'OUT'),
(7, 102, 'Bob',   '2025-07-21 09:10:00', 'IN');  -- Incomplete, no OUT


/*
Solution - the Self join here works as the cross join: n x n;
each row is mapped with other;
so we find out which is loggedin time by a.log_id - b.log_id = 1
for the last row we are also checking emp_id must be equal so that we are just checking In and Out of the same employee.
*/

Select A.emp_id, A.emp_name, FORMAT(A.log_time, 'yyyy-MM-dd') as 'word_date', b.log_time, a.log_time,
CAST ((DATEDIFF(MINUTE, B.log_time, A.log_time) * 1.00)/60 AS DECIMAL(10, 2)) as 'working_hours'
FROM EmployeeLogs as A JOIN EmployeeLogs as B
ON
A.emp_id = B.emp_id AND (A.log_id - B.log_id) = 1;