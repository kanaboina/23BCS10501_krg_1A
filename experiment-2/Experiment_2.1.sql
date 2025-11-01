
-- organizational hierarchy explorer
-- create
CREATE TABLE TBL_EMPLOYEE (
  empId int primary key,
  name varchar(15) not null,
  dept varchar(10) not null,
  managerId int null,
  foreign key(managerId) references TBL_EMPLOYEE(empId)
);
-- alter table tbl add constraint fk_employee foreign key(managerId) references TBL_EMPLOYEE(EMPID)
-- insert
INSERT INTO TBL_EMPLOYEE(empId,name,dept,managerId) VALUES (1, 'Clark', 'Sales', null);
INSERT INTO TBL_EMPLOYEE(empId,name,dept,managerId) VALUES (2, 'Dave', 'Accounting', 1);
INSERT INTO TBL_EMPLOYEE(empId,name,dept,managerId) VALUES (3, 'Ava', 'Accounting',1);
INSERT INTO TBL_EMPLOYEE(empId,name,dept,managerId) VALUES (4, 'Eve', 'Sales',2);
INSERT INTO TBL_EMPLOYEE(empId,name,dept,managerId) VALUES (5, 'Borris', 'Marketing',3);

-- fetch 


-- CREATE TABLE TBL_EMPLOYEE (
--     EmpID INT PRIMARY KEY,
--     name VARCHAR(50) NOT NULL,
--     dept VARCHAR(50) NOT NULL,
--     ManagerID INT NULL  -- Self-reference to EmpID
-- );


-- ALTER TABLE TBL_EMPLOYEE
-- ADD CONSTRAINT FK_Manager FOREIGN KEY (ManagerID) REFERENCES TBL_EMPLOYEE(EmpID);


-- -- Insert data into Employee table
-- INSERT INTO TBL_EMPLOYEE (EmpID, name, dept, ManagerID)
-- VALUES
-- (1, 'Alice', 'HR', NULL),        -- Top-level manager
-- (2, 'Bob', 'Finance', 1),
-- (3, 'Charlie', 'IT', 1),
-- (4, 'David', 'Finance', 2),
-- (5, 'Eve', 'IT', 3),
-- (6, 'Frank', 'HR', 1);

select e.empId, e.name, ep.name, ep.dept from
TBL_EMPLOYEE as e
left outer join 
TBL_EMPLOYEE as ep
on e.managerid=ep.empId;






