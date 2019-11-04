#Database Concepts

##Database basics
**Database** - a logically coherent collection of related data, which should provide the following

- [x] **A single source of information** - for where it's used.
- [x] **Independence** - from its stored location.
- [x] **Concurrency Control** - no interference between applications/users operating on it simultaneously.
- [x] **Data Integrity Control** - including type, domain values and internal relationships.
- [x] **Data Security** - guards privacy on information.
- [x] **Data Model** - the set of concepts characterising the wat in which data is organised.
- [x] DBMS - collection of programs that enable users to **create and maintain** (define, construct, manipulate) a database, which usually supports one particular data model.

##Hierarchical

- [x] Represents data as **hierarchical tree structures**.
- [x] Each hierarchy represents a number of related records.
- [x] Most have a query language, may differ, not standardised.

##Network

- [x] Represents data as **record types**.
- [x] Also represents a limited kind of relationship between records.
- [x] The network data model (i.e. CODASYL DBTG Model) has an associative record-at-a-time language that must be embedded in the application program language (e.g. COBOL).

##Relational

- [x] Represent information as a **collection of tables**.
- [x] Most relational DBMSs support SQL (Structured Query Language, high level language).

##Object Oriented

- [x] Represents information as **objects** which contain both **data and operations** which can process that data.
- [x] Standard for O-O data models not yet put forward but agreements have been made.

##Benfits of using databases

- [x] Allow applicaitons and users to share informaiton in a **controlled manner**.
- [x] **Concurent control** of database retrievals and operations.
- [x] **Isolation of application programs and data** - many users may access the same information.
- [x] **Denial of Unauthorised Access**.
- [x] Representation of **complex data-types and relationships**.
- [x] Enforcement of **integrity constraints** on data.
- [x] Provide **automatic backup and recovery**.

##The Relational Model

###Background

- [x] Originally arose from work done by E.F. Codd at IBM reserach laboratories.
- [x] Idea - to organise all data items into a number of relations. (Each relation resembles a table. Data can thus be inserted, modified, deleted and queried based on these data tables.

###Value

- [x] **Smallest updatable** portion of a table.
- [x] Specified by the **intersection of a column and a row**.

###Columns

- [x] A **set of values** of the **same data-type** which may vary over time.
- [x] A specification includes its **type and integrity constraints** on the values it may hold.
- [x] Column names (i.e. **attributes** names).

###Rows

- [x] A non-empty set of values. Also called **tuples**.
- [x] In relational databases, a **table** is termed a **relation**, **row** -> **tuple**, **column** -> **attribute**.
- [x] Data may be stored in files and records on disk but the **storage formats are hidden from the user**.
- [x] Database **queries** are merely **retrival operations** performed across one or more tables.
- [x] Model is based on set theory relational algebra.

A relation is a special type of set, where:

- [x] A set is a collection of values of the same type.
- [x] A set has no implied ordering.
- [x] A set has not duplicate element.

##Conclusion

- [x] Operations supported by a relational database are **set oriented** and **NOT record oriented**.
- [x] A single relaional query can operate over a set of values, unlike (C and PASCAL which operate on a 'record-at-a-time' fashion).

