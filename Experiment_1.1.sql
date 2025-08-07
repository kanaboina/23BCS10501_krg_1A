/*
Easy-Level Problem
Problem Title: Author-Book Relationship Using Joins and Basic SQL Operations
Procedure (Step-by-Step):
Design two tables — one for storing author details and the other for book details.

Ensure a foreign key relationship from the book to its respective author.

Insert at least three records in each table.

Perform an INNER JOIN to link each book with its author using the common author ID.

Select the book title, author name, and author’s country.

Sample Output Description:

When the join is performed, we get a list where each book title is shown along with its author’s name and their country.
*/


-- create
CREATE TABLE TBL_AUTHORS (
  AUTH_ID int primary key,
  AUTH_NAME varchar(20)
);
CREATE TABLE TBL_BOOKS (
  BOOK_ID INT primary key,
  BOOK_NAME varchar(20),
  AUTH_ID int,
  foreign key (AUTH_ID) references TBL_AUTHORS(AUTH_ID)
)
-- insert
INSERT INTO TBL_AUTHORS VALUES (1, 'Fyodor Dostoevsky');
INSERT INTO TBL_AUTHORS VALUES (2, 'Franz Kafka');
INSERT INTO TBL_AUTHORS VALUES (3, 'J.K. Rowling');

INSERT INTO TBL_BOOKS VALUES (1, 'Metamorphosis',2);
INSERT INTO TBL_BOOKS VALUES (2, 'Harry Potter',3);
INSERT INTO TBL_BOOKS VALUES (3, 'Crime and Punishment',1);

-- fetch 

-- Select * from TBL_AUTHORS;
-- Select * from TBL_BOOKS;

-- Joins

-- INNER
-- outer (left and right and full)
-- exclusive (left and right)
-- self
-- 

Select TBL_BOOKS.BOOK_ID, TBL_BOOKS.BOOK_NAME ,TBL_AUTHORS.*
from TBL_AUTHORS
inner Join
TBL_BOOKS
on 
TBL_AUTHORS.AUTH_ID=TBL_BOOKS.AUTH_ID;
