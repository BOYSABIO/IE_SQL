-- PRIMARY KEY (COLUMN OR COMBINATION OF COLUMNS) (MUST BE NOT NULL / UNIQUE)
CREATE TABLE CLASS (
CLASS VARCHAR(5) NOT NULL,
BUILDING VARCHAR(5) NOT NULL,
CAPACITY SMALLINT,
PRIMARY KEY (CLASS,BUILDING));

CREATE TABLE CLASS (
CLASS VARCHAR(5) NOT NULL,
BUILDING VARCHAR(5) NOT NULL,
CAPACITY SMALLINT);

ALTER TABLE CLASS
ADD PRIMARY KEY (CLASS,BUILDING); -- AFTER TABLE CREATION

-- FOREIGN KEYS (MUST MATCH PRIMARY KEY) (SAME NUMBER OF COL / DATATYPE) (CAN BE MORE THAN 1)
CREATE TABLE STUDENTS (
STUDENT_ID SMALLINT NOT NULL PRIMARY KEY,
NAME VARCHAR(20) NOT NULL,
CLASSROOM VARCHAR(5) REFERENCES CLASS(CLASS)); -- IF PRIMARY KEY has MORE than one COLUMN, you cannot use this

CREATE TABLE STUDENTS (
STUDENT_ID SMALLINT NOT NULL PRIMARY KEY,
NAME VARCHAR(20) NOT NULL,
CLASSROOM VARCHAR(5),
FOREIGN KEY (CLASSROOM) REFERENCES CLASS(CLASS));

ALTER TABLE STUDENTS
ADD FOREIGN KEY (CLASSROOM)
REFERENCES CLASS(CLASS);

-- INSERT RULES
You can insert any new row in the parent table (CLASS table)
that complies with the following restrictions:
✓ The CLASS column value can't be NULL.
✓ The CLASS column value can't already exist in the table.
It must be a non repeatable value.

❑You can't insert a new row in the child table where its
foreign key's value doesn't exist with the same value at
the primary key of the parent table.

❑If all foreign key's columns admit NULL values, then you
can store NULL values in them.

In other words, there is a golden rule that states you can't
assign a student to a non existing classroom. Only in the
case that you don't know where to assign that student yet,
you can keep a NULL value. Be aware that this is possible
only if CLASSROOM isn't defined as NOT NULL.'


-- UPDATE RULES
❑You can't update the foreign key value in the child table, if
such a value does not exist in the primary key of the
parent table.

❑ Only in the case that all foreign key's columns admit NULL
values, then you can update those values to NULL.

❑ You can't update the value of the primary key at the
parent table, if there are values in the child table that are
related with the old value of the primary key.'


-- DELETE RULES
❑ Removing rows from the child table doesn't affect Referential
Integrity. You can do it without producing any harm.

❑ Removing rows from the parent table when there isn't any
depending row at the child table, doesn't affect data integrity.

❑ Removing rows from the parent table when there are depending
rows at the child table, depends on the established delete rule:'
o ON DELETE RESTRICT: You receive an error (Default Value).
o ON DELETE CASCADE: All depending rows are also deleted.
o ON DELETE SET NULL: All foreign key's values are set to NULL.'







