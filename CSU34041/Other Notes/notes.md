# 2

from mcq:

examples:
- CREATE TABLE temp_instuctor LIKE instructor (creates a new table 'temp instructor' that has the same schema as 'instructor').
- CREATE TABLE employee(name varchar, id integer); is a data definition language.
- How to create a table - CREATE TABLE name;
- Delete columns from a table - ALTER TABLE TableName DROP COLUMN ColumnName;
- Add columns to a table - ALTER TABLE TableName ADD ColumnName;


SQL data definition
- Data Definition Language (DDL) is used to define the structure of the relation, deleting relations and relating schemas.
- The SQL command to create a table is CREATE TABLE.
- The role of CONTRAINTS in defining a table in mySQL is -
  1. Declaring primary keys 
  2. Restrictions on columns
- SQL CONSTRAINTS include - i. NOT NULL - no column can have NULL - below (Referential integrity).
							ii. DEFAULT - provides defalut value when not specified by an INSERT statement.
							iii. UNIQUE - ensures all values in a column are different.
							iv. PRIMARY - uniquely defines each row/record in a database table.
							v. FOREIGN - uniquely indentifies each row/record in any database table.
							vi. CHECK - ensures all the values in a column meet a certain condition.
							vii. INDEX - used to create and retreive data from a db quickly.
- CONSTRAINTS i. can be sprcified when CREATE TABLE
			  ii. use ALTER TABLE to create constraints after the table is create.
- A primary key SHOULD be defined as NOT NULL.
- A primary key is required in a table.
- DEFAULT can specify the cells in a column when they must be filled with an immediate value.
- The DROP TABLE statement deletes the table structure along with the table data.
- SQL ALTER can be used to change the table structure.
- To remove a relation from an SQL database, DROP TABLE is used.

from reading:

mics
- Integrity constraints are used to ensure accuracy and consistency of the data.

Creating a table
- Tables are created using CREATE TABLE.
- Each Column has a Name, Type, Size (depending on the type) and optional integrity contraints.

- The table name must be system wide unique, this causes contraints.
- Qualified table name convention - username concatenated with the table name seperated by a dot.
- Short name sufficient as system would generally know when a qualifier is needed and adds it when necessary.


Table constraints-
- Demonstrate the control that the SQL standard allows over the data processed.
- Tables in a database determinr its stucture.
- Definition of a database includes the realtionships among tables in a database.
- SQL2 standard allows constrains to be explicitly named, to allow manipulation and checks as well as actions to take if violations occur.
- Tables always include the PRIMARY KEY. FOREIGN KEY can REFERENCE anything from any record.
- SEARCH CONDITION: CHECK ensures that certain conditions are satisfied, can be used with LIKE, IN, BETWEEN etc.
- SEARCH CONDITION: ASSERTIONS - restricts the contents of a database as a whole among multiple tables.

Domain Definition
- a domain is a named collection of data values tat effectively function as an additional data type.
- once CREATE DOMAIN, can be referenced as if it were a data type within a table def.
- To increate the maximum width of a CHAR/NUMBER field use ALTER TABLE with MODIFY.
- MODIFY can also add NULL specification.

#3
mcq:

- INSERT into employee VALUE(1002, Joey, 2000);
- INSERT into ColName(Col1, Col2, Col3) VALUES (Val1, Val2, Val3);
- UPDATE Set Col_Name = Value;
- To remove rows from a table CUSTOMER - DELETE FROM CUSTOMER WHERE...
- Deletes all the entried but retains structure of the relation - DELETE FROM INSTRUCTOR;

- Data manipulation language is used to execute SQL.
- UPDATE and ALTER, DELETE, CREATE belong to DML.
- Query mechanism performs the following functions: 
  i. Syntax correction
  ii. Permission checks for query execution and data access.
- Adding a row: INSERT.
- When using INSERT, Rows can either be inserted into a table one at a time or in group.
- INSERT statement adds one or more records to any single table in a relational database.
- INSERT can be used in place of UPDATE.
- MODIFY allows change in one or more fields in a record.
- A DELETE command operates on one relation.

from reading:
- Relational databse is a collection of tables consisting of two parts:
  i. structure of tables and their columns.
  ii. the data to be stored in these cols.
- SQL provides language facilities for:
  i. enable the definition of their structure (DDL)
  ii. allow for maintenance and manipulation of the data processed. (Data Manipulation Language)
- A DML is the subset of the SQL Language which invoke actions from the DBMS to manipulate the data in the database.
- These actions guarantee integrity.
- The application programs uses DML commands to reflect changes in the real world data.
- DML statements enable the following (all beging with any of):
  i. SELECT - queriying data from a database - can be specified using clauses.
  ^^^^^MANIPULATING
  ii. INSERT - addring rows. <<<<- POPULATING
  iii. UPDATE - changing existing data values in rows. 
  iv. DELETE certain rows from certain tables.
- Due to rational closure - statements can be nested to for a single query.
- Some systems allow modifications done based on information stored in other databases.
- Possible to pull values from a table into another using SELECT, with some added restrictions.

INSERT
- Adds new rows to a table, can specify new VALUES using the clause.
- if only INSERTS some values in a row, others are set to NULL.
- MUST use qualified table name.
- ANSI/IO standard mandates unqualified column names.
- if a column list is omitted, INSERT will add a new row giving DEFAULT value from CREATE TABLE if not specified.
- if in a NULL insert situation but the column is defined to be NOT NULL, INSERT returns an error.
- When a column list is omitted, NULL must be used in values to expicitly assign NULL values.
- Multi-row insert statement, source of the new rows are a db query specified in the statement.
- The query cannot contain ORDER BY clause

#4
mcq:
- SELECT, FROM, WHERE is the order of keywords for sql.
- A subquery in an SQL SELECT statement is enclosed in parenthesis.
- SELECT NAME FROM CUSTOMER WHERE STATE = 'VA'; == SELECT NAME FROM CUSTOMER WHERE STATE IN ('VA');
- define what columns should be displayed in SQL SELECT 
  i. use FROM to the name source tables and list the columns to be shown after SELECT.
- DISTINCT quantifier used to remove duplicates in rows.
- ORDER BY sorts rows.
- BETWEEN is used for ranges.
- By default, the order by clause lists items in ascending order.
- WHERE limits the row data that are returned.
- WHERE is useful when an exact match is not possile in a SELECT.
- The SQL keyword LIKE is used with wildcards.
- When three or more AND and OR conditions are combined, it is easier to use the SQL keywords BOTH IN and NOT IN;
- Aggregate functions are functions that take a collection of values as input and return a single value.
- Avg() is used to find the mean.
- All aggregate functions except Count(*) ignore null values in their input collection.
- A Boolean data type that can take values true, false, and unknown.

5#
- Create a view - CREATE VIEW
- To update an SQL view, the DBMS must be able to associate the column(s)
  to be updated with a particular underlying table.
- Views are used to hide columns and rows and also to hide complicated sql statements.
- Reason for using views to hide columns: to simplify a result and prevent
  the display of sensitive data.
- Advantage of placing computations in sql views -
  i. to save users from having to write expressions
  ii. to ensure that the resuls are consistent.
- a subquery has a distinct form that cannot be duplicated by a join.
- JOIN - can be useful for retrieving data from two or more tables into
         the results set.
- INNER, OUTER, CROSS, SELF are all supported.	
- An INNER join is a type of join in which mached (as per condition), records
  from both the tables will be displayed.
- A SELF join is a normal join which
  i. a table data will be joined to itself
  ii. will be suitable for comparing table column values with itself

There are three different ways of writing an application if SQL is needed also: direct invocation (directly invoke SQL statements), embedded SQL (embedded SQL statements directly included to the target language) and module language (statements written separately then called from host language. SQL provides support for seven languages; Ada, C, COBOL, FORTRAN, MUMPS, Pascal
(extended Pascal) and PL/I. Actions of the programming language case the SQL statements to be executed. Execution is either static or dynamic.
Static execution often called static SQL because the source text of the statements
does not change while the application is running ( exact wording). Dynamic Execution, when the precise text of statements is not known, the application programmer would allow text to be processed during execution. Rules for embedded SQL: every statement must be preceded by EXEC SQL, exceptions are BEGIN DECLARE SECTION, END DECLARE SECTION and ESCAPE; end embedded SQL statement with terminator depending on host language. SQL constructs embedded in host language is treated as a comment. Comments can appear anywhere in an SQL construct but not between EXEC SQL, EXEC SQL BEGIN DECLARE SECTION and EXEC SQL END DECLARE SECTION. Lower case letters are allowed for SQL keywords and user-defined names. Special rules for C: terminator is a semi-colon, must not be contained within an #inlude file and not modified by a #define directive. Labels required the same, subject to restrictions of C. An embedded SQL program consists of statements in  the host language and embedded SQL constructs. Every static embedded SQL application consists of declaratives ( exchange data, host variables can be referenced without restriction ) and statements (include: DECLARE CURSOR, WHENEVER, FETCH interations through tuples, etc.).

- Build dynamic SQL statements with a query and parameters, using exec.
- Dynamic sql statement easily built using stored procedure.
- A query string can be constructed and prepared at run time - EXEC SQL PREPARE.
- Cobol- semicolin is END-EXEC.
