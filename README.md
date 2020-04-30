# Java code analysis

## Step 1 : execute commande : 

`java  -jar animaljar   testjar > rpath`
 - animaljar : path to animalsniffer jar.
 - testjar : path to your jar or your directory
 - rpath : path to .txt file to save output
 ## Step 2 : create database to stock output
 ### Database
 - `create database loganimalssniffer`
 - `use loganimalssniffer`
 ### Tables
 - `create table javaCode(java varchar(25),name varchar(25));`
 - `create table logjdk(java varchar(25),path varchar(25));`
 
 ## Step 3 : load out put to database  
### Load java codes
```
 INSERT INTO javacode(java,name)  
VALUES  
('56 (0x38 hex)',	'Java SE 12'),
('55 (0x37 hex)',	'Java SE 11'),
('54',	'Java SE 10'),
('53',	'Java SE 9'),
('52',	'Java SE 8'),
('51',	'Java SE 7'),
('50',	'Java SE 6.0'),
('49',	'Java SE 5.0'),
('48',	'JDK 1.4'),
('47',	'JDK 1.3'),
('46',	'JDK 1.2'),
('45',	'JDK 1.1');
```
### load animalsniffer output 

`LOAD DATA INFILE 'rpath' INTO TABLE logjdk FIELDS TERMINATED BY ' ';`

 ## Step 4 : Select information
 
 ###Select JDK statistics
 ```
select count(*) as 'Total',j.name 
from logjdk as l,javaCode as j 
where  CAST(l.java as DECIMAL(9,2))=CAST(j.java as DECIMAL(9,2)) group by l.java;
 ```
 
  ###Percentage statistics
 ```
select concat((
	count(*)/(select count(*) 
	from logjdk as l,javaCode as j 
	where  CAST(l.java as DECIMAL(9,2))=CAST(j.java as DECIMAL(9,2))))*100 ,"%") as 'Total',j.name 
from logjdk as l,javaCode as j 
where  CAST(l.java as DECIMAL(9,2))=CAST(j.java as DECIMAL(9,2)) group by l.java;
 ```

 
 


