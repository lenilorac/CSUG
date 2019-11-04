#Database Concepts

##Database basics
**Database** - a logically coherent collection of related data, which should provide the following

- **A single source of information** - for where it's used.
- **Independence** - from its stored location.
- **Concurrency Control** - no interference between applications/users operating on it simultaneously.
- **Data Integrity Control** - including type, domain values and internal relationships.
- **Data Security** - guards privacy on information.
- **Data Model** - the set of concepts characterising the wat in which data is organised.
- DBMS - collection of programs that enable users to **create and maintain** (define, construct, manipulate) a database, which usually supports one particular data model.

##Hierarchical

- Represents data as **hierarchical tree structures**.
- Each hierarchy represents a number of related records.
- Most have a query language, may differ, not standardised.

##Network

- Represents data as **record types**.
- Also represents a limited kind of relationship between records.
- The network data model (i.e. CODASYL DBTG Model) has an associative record-at-a-time language that must be embedded in the application program language (e.g. COBOL).

##Relational

- Represent information as a **collection of tables**.
- Most relational DBMSs support SQL (Structured Query Language, high level language).

##Object Oriented

- Represents information as **objects** which contain both **data and operations** which can process that data.
- Standard for O-O data models not yet put forward but agreements have been made.

##Benfits of using databases

- Allow applicaitons and users to share informaiton in a **controlled manner**.
- **Concurent control** of database retrievals and operations.
- **Isolation of application programs and data** - many users may access the same information.
- **Denial of Unauthorised Access**.
- Representation of **complex data-types and relationships**.
- Enforcement of **integrity constraints** on data.
- Provide **automatic backup and recovery**.

##The Relational Model

###Background

- Originally arose from work done by E.F. Codd at IBM reserach laboratories.
- Idea - to organise all data items into a number of relations. (Each relation resembles a table. Data can thus be inserted, modified, deleted and queried based on these data tables.

###Value

- **Smallest updatable** portion of a table.
- Specified by the **intersection of a column and a row**.

###Columns

- A **set of values** of the **same data-type** which may vary over time.
- A specification includes its **type and integrity constraints** on the values it may hold.
- Column names (i.e. **attributes** names).

###Rows

- A non-empty set of values. Also called **tuples**.
- In relational databases, a **table** is termed a **relation**, **row** -> **tuple**, **column** -> **attribute**.
- Data may be stored in files and records on disk but the **storage formats are hidden from the user**.
- Database **queries** are merely **retrival operations** performed across one or more tables.
- Model is based on set theory relational algebra.

A relation is a special type of set, where:

- A set is a collection of values of the same type.
- A set has no implied ordering.
- A set has not duplicate element.

##Conclusion

- Operations supported by a relational database are **set oriented** and **NOT record oriented**.
- A single relaional query can operate over a set of values, unlike (C and PASCAL which operate on a 'record-at-a-time' fashion).

