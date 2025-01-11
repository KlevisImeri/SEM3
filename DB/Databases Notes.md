---

---
---
#### Knowledge
Data
> No logic meaning just bits.

Information
> procced data into contexts 

Knowledge
> pieces of information

![[Pasted image 20230906184939.png]]

---
#### Database 
> A database is a structured collection of knowledge on a subset of the real world, typically stored electronically in a computer system.
> Controlled by database management system (DBMS).

Instance of Database
> The current contents of the database

DBMS
> Is a software (programing system) that provides tools for the users to manage the database:
> - store (structured)
> - access/query (efficiently)
> - security

DBMS should have:
- Support for data model(s)
- Support for certain high-level languages
- Transaction Management (many users can access the same data without conflicts / concurrency control)
- Access Control (security of data and privileges)
- Resiliency (able to recover)

Tuples
> Ordered collection of objects of different types
---
#### Levels of Abstraction in DBMS:

![[data-abstraction-layer-diagram.svg]]
- Physical Level/Data Model:  ***|allocating space|***
	 1.  storage structures (files, indices, Tables, Records, ...)
- Logical Data Model/Conceptual level:  ***|rules + data structures|***
	 1. data model
	 2. schema
	 3. relationships
	 4. integrity constrains
	 5. security policies
- External Data Model/View Level: **|present data|**
	1.  Several views
	2.  simplify data
	3.  filter for specific users (protect)

This abstraction makes more easy to find bugs problem, manage and fix failures.

View (subscheme)
> Portion of conceptual database presented in a customized way. 
---
#### Data Models

Modeling
> Map a subset of world where we will store data

Modeling techniques:
- ER (entity-relationship)
- Relational Data Modeling

Data Model
> A data model is a mathematical way (formalism/tool) to describe a database.
> It consists of:
> - Describing data and the relationships.
> - Define Operations used to manipulate Data

Data Models differ from:
- **Purpose**
- How they deal with **Redundancy**
- Hoe they deal with many **Relationships **

MetaModel
> Rules for creating a model
---
#### ER Model
===========
Entity:
> an object/thing (physical or logical):
> - exits (real world)
> - distinguishable (by attributes types)

Entity sets (Strong) | Rectangle
>An attribute or set of attributes whose values uniquely identify each entity in an entity set is called a key for that entity set.


===========
Attributes Types | Circle
> Properties of Entity Sets

Domain
> The value types the attribute can take.

Keys | Circle with line
> A collection (1 or more) of attributes that uniquely define each entity in an entity set

===========
Relationship Instance 
>Is a k-tuple $(e_1, ..., e_k)$ where e1 to ek are related with logic (label/semantic)

Relationship  Sets/Types | diamond 
> Is a set of Relationship Instances that have the same related logic (labes/smantic)
> A relationship set among entity sets is an ordered list of entity sets.

Binary Relationship Type
> A relationship set where two entity sets are participating is called a binary relationship type

===========
Cardinalities of binary relationship 
> $a_b \in A ~~|~~ a \rightarrow b$
>Cardinality =  $\#a_b$

Binary Relationship Set Cardinalities  | Arrows 
> - 1:1  One-to-One
> - 1:N  One-to-Many
> - M:N  Many-to-Many
>  -M:1 Many-to-One

---
#### Extended ER Model
===========
Weak entity set | Rectangle with 2 borders
> It's an entity set that represents entities that can not be uniquely be identified by its attributes 

Determining relationship type | Diamond with 2 borders
> It's a relationship from a strong entity set to a week one which determines the weak entity set.

===========
Isa Hierarchies (Specialization) | Triangle D -> M
> A isa B = A inherits the attributes and some or all entities from B.  |A|<|B|

Borrowed Key Attribute Sets
> Are sets of key attributes of the generalized entity set that are borrowed by the specialized entity set.

---
#### The Relational Data Model
> - the notation for modeling
> - operations

**Domain**
> A set of values

**Relation**
> subset of the cartesian product of sets (domains)
>$r \subseteq D_1\times D_2\times...\times D_n$ 

**Members, Arity**
> members of relation ships are called tuples 
> arity(typle)=k=deg(typle)

**Relation $\iff$ table**
> row $\iff$ member (tuple)
> column $\iff$ attributes

===========
**Relationship schema**
> set of attributes for a relation 
> $R(attribute_1, attribute_2, ..., attribute_n)$

 
**Relational database scheme**
> The collection of the relation schemes of a database are called relational database scheme


## Physical Storage
m