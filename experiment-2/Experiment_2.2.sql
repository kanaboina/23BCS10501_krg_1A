
CREATE TABLE tbl_year(
 ID INT,
 YEAR INT,
 NPV INT
)
INSERT INTO tbl_year(ID, YEAR, NPV) 
VALUES
(1,2018,100),
(7,2020,30),
(13,2019,40),
(1,2019,113),
(2,2008,121),
(3,2002,12),
(11,2020,99),
(7,2019,0);

CREATE TABLE tbl_query(
ID INT,
YEAR INT
);
INSERT INTO tbl_query(ID, YEAR) 
VALUES
(1,2019),
(2,2008),
(3,2009),
(7,2018),
(7,2019),
(7,2020),
(13,2019);


select tbl_query.id, tbl_query.year, isnull(tbl_year.npv,0) as NPV from
tbl_query 
left outer join
tbl_year
on tbl_year.id=tbl_query.id and tbl_year.year=tbl_query.year
order by tbl_query.id, tbl_query.year;

