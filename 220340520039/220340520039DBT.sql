create table DEPT
(
DEPTNO int,
DNAME varchar(15),
LOC varchar(10)
);
insert into DEPT values 
(10 ,'ACCOUNTING','NEW YORK'),
(20 , 'RESEARCH' , 'DALLAS'),
(30,'SALES', 'CHICAGO'),
(40,' OPERATIONS', 'BOSTON');

create table EMP
(
EMPNO int,
ENAME varchar(10),
JOB varchar(9),
HIREDATE date,
SAL float,
COMM float,
DEPTNO int
);

INSERT INTO EMP VALUES
(7839 ,'KING', 'MANAGER', '1991-11-17' ,5000, NULL ,10),
(7698, 'BLAKE', 'CLERK', '1981-05-01' ,2850 ,NULL ,30),
(7782, 'CLARK', 'MANAGER' ,'1981-06-09' ,2450, NULL ,10),
(7566, 'JONES' ,'CLERK' ,'1981-04-02', 2975, NULL, 20),
(7654 ,'MARTIN' ,'SALESMAN' ,'1981-09-28', 1250, 1400, 30),
(7499, 'ALLEN' ,'SALESMAN' ,'1981-02-20', 1600, 300 ,30);

-- Q3Display all the employees where SAL between 2500 and 5000 (inclusive of both).*/

select ename from emp where sal between 2500 and 5001;

-- Q4 Display all the ENAMEs in descending order of ENAME.*/

select ENAME from EMP
 order by ENAME DESC;

-- Q5  Display all the JOBs in lowercase.
SELECT lower(JOB)  FROM EMP;

-- q6 Display the ENAMEs and the lengths of the ENAMEs

select ENAME,length(ENAME) from EMP;

-- Q7  Display the DEPTNO and the count of employees who belong to that DEPTNO .
 SELECT DEPTNO,COUNT(*) FROM EMP
 GROUP BY DEPTNO;

-- Q8. Display the DNAMEs and the ENAMEs who belong to that DNAME.
SELECT EMP.ENAME,DEPT.DNAME FROM EMP,DEPT
WHERE EMP.DEPTNO=DEPT.DEPTNO;

-- Q9. Display the position at which the string ‘AR’ occurs in the ename.
SELECT ENAME,instr(ename,'AR') FROM EMP;

-- 10. Display the HRA for each employee given that HRA is 20% of SAL.
SELECT ENAME,SAL*0.20 AS 'HRA' from EMP;


 -- =================== SECTION 2====================
 /* Q 1  Write a stored procedure by the name of PROC1 that accepts two varchar strings
as parameters. Your procedure should then determine if the first varchar string 
exists inside the varchar string. For example, if string1 = ‘DAC’ and string2 = 
‘CDAC, then string1 exists inside string2. The stored procedure should insert the 
appropriate message into a suitable TEMPP output table. Calling program for the 
stored procedure need not be written.*/

create table TEMPP
(
str1 varchar(20),
str2 varchar(20),
result varchar(50)
);
delimiter //
create procedure PROC1( x varchar(20), y varchar(20))
begin
declare s int;
set s=instr(y,x);
if s > 0 then
insert  into TEMPP values(x,y,'String1 exist in String 2');
else 
insert into TEMPP values (x,y,'String1 not  exist in String 2');
end if ;
end ; //
delimiter ;

call PROC1('DAC','CDAC');
SELECT * FROM TEMPP;

/* Q2 Create a stored function by the name of FUNC1 to take three parameters, the 
sides of a triangle. The function should return a Boolean value:- TRUE if the 
triangle is valid, FALSE otherwise. A triangle is valid if the length of each side is 
less than the sum of the lengths of the other two sides. Check if the dimensions 
entered can form a valid triangle. Calling program for the stored function need not 
be written. */

create table result
(
side1 int,
side2 int,
side3 int,
result varchar(20)
);
delimiter //
create function FUNC1(side1 int,side2 int,side3 int)
returns varchar(20)
deterministic 
begin
if side1 + side2 > side3 and side2 +side3 > side1 and side1 + side3 > side2 then
return 'TRUE';
else
return 'false';
end if;
end ; //
delimiter ;

delimiter //
  create procedure  FUNC1(side1 int,side2 int, side3 int)
  begin
  declare d varchar(20);
  set d=FUNC1(side1,side2,side3);
  insert into result values(side1,side2,side3,d);
 end ; //
  delimiter ;
  
  call FUNC1(5,6,7);
  select * from result;
  
  


