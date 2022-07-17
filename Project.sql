--"C:\Users\mifth\OneDrive\Desktop\CSE 3110\DATABASE PROJECT\Project.sql"


-- Drop a table

DROP TABLE teachers;
DROP TABLE routine;
DROP TABLE completed; 
DROP TABLE registration;
DROP TABLE students;
DROP TABLE courses;


--creation of TABLE students

create TABLE students(
    s_roll NUMBER(7) NOT NULL,
    s_name VARCHAR(20),
    primary key(s_roll)
);

--ADDING COLUMN:
ALTER TABLE STUDENTS ADD (s_last_name VARCHAR(20));


--insertion of TABLE students
INSERT INTO students (s_roll, s_name, s_last_name) VALUES (1807057, 'MIFRA','AKHTER');
INSERT INTO students (s_roll, s_name, s_last_name) VALUES (1807037, 'PRITHUL', 'BISWAS');
INSERT INTO students (s_roll, s_name, s_last_name) VALUES (1807005, 'NAFIUL', 'ALAM');



--creation of table courses

create table courses(
	c_num varchar(10) NOT NULL,
	c_title varchar(30),
	pre_req varchar(30),
	primary key (c_num)
);

--insertion of table courses
INSERT INTO courses (c_num, c_title, pre_req) VALUES ('CSE 3109', 'DATABASE MANAGEMENT SYSTEM','OOP');
INSERT INTO courses (c_num, c_title, pre_req) VALUES ('CSE 3119', 'SOFTWARE DEVELOPMENT','ANDROID DEVELOPMENT');
INSERT INTO courses (c_num, c_title, pre_req) VALUES ('CSE 3101', 'THEORY OF COMPUTATION','DISCRETTE MATHEMATICS');

--creation of TABLE registration


create table registration(
	c_num varchar(10) NOT NULL,
	c_check varchar(30) NOT NULL,
	s_roll number(7) NOT NULL
	--foreign key(c_num) references courses(c_num) on delete cascade,
	--foreign key(s_roll) references students(s_roll) on delete cascade,
	--primary key(c_num,s_roll,c_check)
);

--Adding CONSTRAINT into TABLE registration

ALTER TABLE registration ADD CONSTRAINT registration_fk1 
	foreign key(c_num) references courses(c_num) on delete cascade;

ALTER TABLE registration ADD CONSTRAINT registration_fk2 
	foreign key(s_roll) references students(s_roll) on delete cascade;

ALTER TABLE registration ADD CONSTRAINT registration_pk 
	primary key(c_num,s_roll,c_check);


--insertion of TABLE Registration
INSERT INTO registration (c_num, c_check,s_roll) VALUES ('CSE 3109', 'OOP', 1807057);
INSERT INTO registration (c_num, c_check,s_roll) VALUES ('CSE 3119','ANDROID DEVELOPMENT', 1807057);
INSERT INTO registration (c_num, c_check,s_roll) VALUES ('CSE 3101', 'DISCRETTE MATHEMATICS', 1807057);
INSERT INTO registration (c_num, c_check,s_roll) VALUES ('CSE 3109', 'OOP', 1807037);
INSERT INTO registration (c_num, c_check,s_roll) VALUES ('CSE 3119','ANDROID DEVELOPMENT', 1807037);
INSERT INTO registration (c_num, c_check,s_roll) VALUES ('CSE 3101', 'DISCRETTE MATHEMATICS', 1807037);
INSERT INTO registration (c_num, c_check,s_roll) VALUES ('CSE 3109', 'OOP', 1807005);
INSERT INTO registration (c_num, c_check,s_roll) VALUES ('CSE 3119', 'ANDROID DEVELOPMENT', 1807005);
INSERT INTO registration (c_num, c_check,s_roll) VALUES ('CSE 3101', 'DISCRETTE MATHEMATICS', 1807005);


--creation of TABLE teachers


create table teachers(
	t_id number(4) NOT NULL,
	t_name varchar(15) NOT NULL,
	tcourse_id varchar(10),
	primary key(t_id, t_name),
	foreign key(tcourse_id) references courses(c_num) on delete cascade
);

--insertion of TABLE teachers
INSERT INTO teachers (t_id, t_name,tcourse_id) VALUES (1001,'MR. X','CSE 3101');
INSERT INTO teachers (t_id, t_name,tcourse_id) VALUES (1002,'MS. Y','CSE 3101');
INSERT INTO teachers (t_id, t_name,tcourse_id) VALUES (1003,'MR. W','CSE 3109');
INSERT INTO teachers (t_id, t_name,tcourse_id) VALUES (1004,'MS. Z','CSE 3109');
INSERT INTO teachers (t_id, t_name,tcourse_id) VALUES (1005,'MS. Q','CSE 3119');
INSERT INTO teachers (t_id, t_name,tcourse_id) VALUES (1006,'MR. P','CSE 3119');


--creation of TABLE routine


create table routine(
	c_num varchar(10) NOT NULL,
	r_date date NOT NULL,
	time number(5,2),
	duration number(3),
	t_id number(4),
	foreign key(c_num) references courses(c_num) on delete cascade,
	primary key(c_num,r_date)
);

--insertion of TABLE routine
INSERT INTO routine (c_num, r_date,time,duration, t_id) VALUES ('CSE 3119','22-JUN-2022',8.55,50,1005);
INSERT INTO routine (c_num, r_date,time,duration, t_id) VALUES ('CSE 3109','22-JUN-2022',9.45,50,1003);
INSERT INTO routine (c_num, r_date,time,duration, t_id) VALUES ('CSE 3109','23-JUN-2022',10.45,50,1004);
INSERT INTO routine (c_num, r_date,time,duration, t_id) VALUES ('CSE 3101','23-JUN-2022',11.35,50,1001);
INSERT INTO routine (c_num, r_date,time,duration, t_id) VALUES ('CSE 3119','23-JUN-2022',12.25,50,1006);
INSERT INTO routine (c_num, r_date,time,duration, t_id) VALUES ('CSE 3109','24-JUN-2022',8.55,50,1003);


--creation of TABLE completed


create table completed(
	s_roll varchar(10) NOT NULL,
	c_check varchar(30) ,
	pass varchar(4) NOT NULL,
	c_num varchar(10) NOT NULL,
	foreign key (c_num) references courses(c_num) on delete cascade,
	primary key(s_roll,pass)
);

--INSERTION of TABLE completed
INSERT INTO completed (s_roll, c_check, pass, c_num) VALUES (1807057,'OOP', 'YES', 'CSE 3109');
INSERT INTO completed (s_roll, c_check, pass, c_num) VALUES (1807057,'OOP', 'NO', 'CSE 3109');
INSERT INTO completed (s_roll, c_check, pass, c_num) VALUES (1807037,'ANDROID DEVELOPMENT', 'YES', 'CSE 3101');
INSERT INTO completed (s_roll, c_check, pass, c_num) VALUES (1807037,'ANDROID DEVELOPMENT', 'NO', 'CSE 3101');
INSERT INTO completed (s_roll, c_check, pass, c_num) VALUES (1807005, 'DISCRETTE MATHEMATICS', 'YES', 'CSE 3119');
INSERT INTO completed (s_roll, c_check, pass, c_num) VALUES (1807005, 'DISCRETTE MATHEMATICS', 'NO', 'CSE 3119');


SET SERVEROUTPUT ON
begin
DBMS_OUTPUT.PUT_LINE ('STUDENTS TABLE : ');
end;
/
SELECT * from students;
SET SERVEROUTPUT ON
begin
dbms_output.put_line('COURSES TABLE : ');
end;
/
SELECT * from courses;
SET SERVEROUTPUT ON
begin
dbms_output.put_line('TEACHERS TABLE : ');
end;
/
SELECT * from teachers;
SET SERVEROUTPUT ON
begin
dbms_output.put_line('REGISTRATION TABLE : ');
end;
/
SELECT * from registration;
SET SERVEROUTPUT ON
begin
dbms_output.put_line('ROUTINE TABLE : ');
end;
/
SELECT * from routine;
SET SERVEROUTPUT ON
begin
dbms_output.put_line('COMPLETED TABLE : ');
end;
/
SELECT * from completed;


--RENAMING COLUMN:
select * from students;
ALTER TABLE STUDENTS RENAME COLUMN S_NAME TO STUDENT_NAME;
select * from students;

--DROP COLUMN:
ALTER TABLE STUDENTS DROP COLUMN STUDENT_NAME;
select * from students;

--DIFFERENT OPERATIONS
SELECT (t_name) AS TEACHER_NAME FROM teachers;
--DISTINCT COURSES(TOTAL 3 COURSES TAKEN BY 6 TEACHERS
SELECT DISTINCT(tcourse_id) AS COURSES FROM teachers;
SELECT tcourse_id AS course_number FROM teachers WHERE tcourse_id LIKE '%311%';
SELECT t_id,t_name,tcourse_id FROM teachers ORDER BY t_id DESC;
SELECT t_id,t_name,tcourse_id FROM teachers ORDER BY t_id aSC;

--NESTED QUERY
--SELECT TEACHERS WHO HAVE CLASS BEFORE 11.35 AM(THEIR CLASSES WILL BE RESCHEDULED)
SELECT tcourse_id,t_id,t_name FROM teachers WHERE tcourse_id IN(SELECT c_num FROM routine WHERE time<11.35 AND TO_CHAR(r_date, 'DD-MON-YYYY') = '22-JUN-2022' And routine.t_id=teachers.t_id);

--USE OF AGGREGATE FUNCTION

SELECT COUNT(*),COUNT(t_id) AS TOTAL_TEACHERS FROM teachers;

--TOTAL CLASSES AND TOTAL CLASS TIME
 
SELECT COUNT(c_num) AS TOTAL_CLASS, SUM(duration) AS TOTAL_DURATION, AVG(duration), AVG(NVL(duration,0)) 
FROM ROUTINE 
WHERE TO_CHAR(r_date, 'DD-MON-YYYY') = '23-JUN-2022';

--SET OPERATIONS FOR CHECKING PRE REQUIRED SUBJECT INFO

SELECT c_num,c_title,pre_req as info FROM courses UNION SELECT c_num,c_check,pass FROM completed;

SELECT c_num,pre_req AS required FROM courses intersect SELECT c_num,c_check FROM completed;

--USING JOIN FOR CKECKING TO PRE-REQUISITE SUBJECT FOR EACH STUDENTS CHECKING
SELECT s.s_last_name,r.c_num,r.c_check from students s natural join registration r;

--TRIGGER ADDED
CREATE OR REPLACE TRIGGER check_time BEFORE INSERT OR UPDATE ON
routine
FOR EACH ROW
BEGIN
IF :new.duration > 50  OR :new.duration < 50 THEN
RAISE_APPLICATION_ERROR(-20000,'Class time invalid');
END IF;
END;
/
INSERT INTO routine (c_num, r_date,time,duration, t_id) VALUES ('CSE 3109','24-JUN-2022',8.55,40,1003);

--PROCEDURE ADDED FOR ROUTINE INSERTING

CREATE OR REPLACE PROCEDURE add_insert (
	course routine.c_num%TYPE,
	rdate routine.r_date%TYPE,
	rduration routine.duration%TYPE) IS
BEGIN
	INSERT INTO routine (c_num, r_date,duration)
	VALUES (course, rdate,rduration);
 	--COMMIT;
END add_insert;
/
SHOW ERRORS

BEGIN
 add_insert('CSE 3109','25-JUN-2022',40);
END;
/













