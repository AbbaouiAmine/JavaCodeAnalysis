/*=====================================*/
/*Database verification*/
/*=====================================*/
/*Select database*/
use loganimalssniffer;
/*Tables values*/
select * from logjdk;
select * from javaCode;javacode
/*=====================================*/
/* Select JDK statistics*/
/*=====================================*/
/*===> JDK Simple statistic*/
select count(*) as 'Total',j.name 
from logjdk as l,javaCode as j 
where  CAST(l.java as DECIMAL(9,2))=CAST(j.java as DECIMAL(9,2)) group by l.java;

/*===>Porcentage statistic*/
select concat((
	count(*)/(select count(*) 
	from logjdk as l,javaCode as j 
	where  CAST(l.java as DECIMAL(9,2))=CAST(j.java as DECIMAL(9,2))))*100 ,"%") as 'Total',j.name 
from logjdk as l,javaCode as j 
where  CAST(l.java as DECIMAL(9,2))=CAST(j.java as DECIMAL(9,2)) group by l.java;

select count(*) from logjdk as l,javaCode as j 
where  CAST(l.java as DECIMAL(9,2))=CAST(j.java as DECIMAL(9,2)) ;



/*=====================================*/
/* JDK >6 statistics*/
/*=====================================*/
/*Select  APIs > 6*/
select * from logjdk as l 
where  CAST(l.java as DECIMAL(9,2))>50;

/*Select  APIs detail > 6*/
select substring_index(substring_index(`path`,':',-1),':',1) as 'APIs'  from logjdk as l 
where  CAST(l.java as DECIMAL(9,2))>50;

select count(substring_index(substring_index(`path`,':',-1),':',1)) as 'total of APIs'  from logjdk as l 
where  CAST(l.java as DECIMAL(9,2))>50;

/*Select  APIs for package sopra detail > 6*/
select substring_index(substring_index(`path`,':',-1),':',1) as 'APIs'  from logjdk as l 
where  CAST(l.java as DECIMAL(9,2))>50;
/*Calcule du pourcentage des APIs Sopra : 0.3798 (0.0147+0.3651) */
select count(substring_index(substring_index(`path`,':',-1),':',1))/(select count(substring_index(substring_index(`path`,':',-1),':',1))  from logjdk as l 
where  CAST(l.java as DECIMAL(9,2))>50) as 'APIs'  
from logjdk as l 
where  CAST(l.java as DECIMAL(9,2))>50 and l.path like '%soprabanking/%';

/*Calcule du pourcentage des autres APIs : 0.6202*/

select count(substring_index(substring_index(`path`,':',-1),':',1))/(select count(substring_index(substring_index(`path`,':',-1),':',1))  from logjdk as l 
where  CAST(l.java as DECIMAL(9,2))>50) as 'APIs'  
from logjdk as l 
where  CAST(l.java as DECIMAL(9,2))>50 and l.path not like '%sopra%';



select count(substring_index(substring_index(`path`,':',-1),':',1)) as 'APIs'  from logjdk as l 
where  CAST(l.java as DECIMAL(9,2))>50 and l.path like '%sopra%';

/*Select  packages detail > 6*/
select substring_index(substring_index(substring_index(substring_index(`path`,':',-1),':',1),'/',-2),'/',1)as 'APIs'  from logjdk as l 
where  CAST(l.java as DECIMAL(9,2))>50;
select substring_index(substring_index(substring_index(substring_index(`path`,':',-1),':',1),'/',-2),'/',1)as 'APIs'  from logjdk as l 
where  CAST(l.java as DECIMAL(9,2))>50 group by APIs;

select substring_index(substring_index(substring_index(substring_index(`path`,':',-1),':',1),'/',-3),'/',2)as 'APIs',
count(substring_index(substring_index(substring_index(substring_index(`path`,':',-1),':',1),'/',-2),'/',1)) as 'Total'  
from logjdk as l 
where  CAST(l.java as DECIMAL(9,2))>50 and l.path not like '%sopra%' group by APIs;





