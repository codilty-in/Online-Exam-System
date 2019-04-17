
   /*    
        
         TABLES FOR DATABASE 'OQ'
         
   */


/*   STUDENT   */

CREATE TABLE  STUDENT 
   (	FIRSTNAME VARCHAR(200), 
   	LASTNAME VARCHAR(200),
   	EMAIL VARCHAR(400),
   	PHONE 	INT(15),
	USERPASS VARCHAR(200),	
	CONSTRAINT QUIZQUES_PK PRIMARY KEY (EMAIL) 		
   );



/*   QUIZ FACULTY   */

CREATE TABLE FACULTY 
   (	FIRSTNAME VARCHAR(200), 
   	LASTNAME VARCHAR(200),
   	EMAIL VARCHAR(400),
   	PHONE 	INT(15),
	USERPASS VARCHAR(200),
	 CONSTRAINT QUIZQUES_PK PRIMARY KEY (EMAIL) 	
   );


/*   QUIZ CONTACT   */

CREATE TABLE  CONTACT 
   (	NAME VARCHAR(100), 
	EMAIL VARCHAR(100), 
	SUBJECT VARCHAR(100), 
	MESSAGE VARCHAR(2000),
	 CONSTRAINT QUIZQUES_PK PRIMARY KEY (EMAIL) 	

   );



/*   QUIZ SUBJECTS   */


 CREATE TABLE SUBJECTS 
   (	
   	SID INT(10),
   	SUBJECT VARCHAR(150) UNIQUE NOT NULL, 
	 CONSTRAINT QUIZQUES_PK PRIMARY KEY (SID)
   );

   INSERT INTO SUBJECTS VALUES(1,"DATABASE AND MANAGEMENT SYSTEM"),
   (2,"OPERATING SYSTEM"),
   (3,"JAVA PROGRAMMING"),
   (4,"COMPILER DESIGN"),
   (5,"PYTHON"),
   (6,"NODE JS"),
   (7,"JAVASCRIPT"),
   (8,"DATA STRUCTURE"),
   (9,"COMPUTER NETWORK"),
   (10,"HTML"),
   (11,"DIGITAL LOGIC");


 /*   TOPICS    */

CREATE TABLE TOPICS 
   (	
   	TID INT(10) AUTO_INCREMENT,
   TOPIC VARCHAR(100) NOT NULL, 
   SID INT(10) ,
	 CONSTRAINT QUIZQUES_PK PRIMARY KEY (TID),
	  FOREIGN KEY (SID) REFERENCES SUBJECTS(SID) ON DELETE CASCADE ON DELETE SET NULL
   );

INSERT INTO TOPICS(TOPIC, SID) VALUES("Introduction To DBMS",1),
   ("Entity Relationship Model ",1),
   ("Relational Model",1),
   ("Relational Algebra",1),
   ("Functional Dependencies",1),
   ("Normalisation ",1),
   ("Transactions and Concurrency Control",1),
   ("Indexing, B and B+ trees",1),
   ("File Organization",1),
   ("OS 1",2),
   ("OS 2 ",2),
   ("OS 3",2),
   ("OS 4",2);




/*  QUETIONS FOR QUIZ    */

CREATE TABLE  QUIZINFO
   (  
      QID INT(10) NOT NULL AUTO_INCREMENT,
      NAME VARCHAR(2000), 
      SUBJECT VARCHAR(150),
      TOPIC VARCHAR(100),
      EMAIL VARCHAR(2000), 
       SUBMIT_DATE DATE,
       No_Of_Attempts int(10),
   CONSTRAINT QUIZQUES_PK PRIMARY KEY (QID)
   );

   INSERT INTO QUIZINFO VALUES(1,"FIRST","Database Management System","INTRODUCTION TO DBMS","vedanshu1998@gmail.com","2019-06-23",0),
(3,"SECOND","Database Management System","RELATIONAL ALGEBRA","vedanshu1998@gmail.com","2019-06-23",0),
(4,"THIRD","Database Management System","RELATIONAL MODEL","vedanshu1998@gmail.com","2019-06-23",0),
(5,"FOURTH","Database Management System","NORMALISATION","vedanshu1998@gmail.com","2019-06-23",0),
(6,"FIFTH","Database Management System","RELATIONAL ALGEBRA","trivedishivang80@gmail.com","2019-06-23",0),
(7,"SIXTH","Database Management System","RELATIONAL MODEL","trivedishivang80@gmail.com","2019-06-23",0),
(8,"SEVENTH","Database Management System","NORMALISATION","trivedishivang80@gmail.com","2019-06-23",0),
(9,"EIGHT","Database Management System","TRANSACTIONS AND Concurrency Control","trivedishivang80@gmail.com","2019-06-23",0);


CREATE TABLE  QUIZQUES 
   (  
    QUESTION VARCHAR(2000), 
   OPTION1 VARCHAR(2000), 
   OPTION2 VARCHAR(2000), 
   OPTION3 VARCHAR(2000), 
   OPTION4 VARCHAR(2000), 
   ANSWER VARCHAR(10),   
   QID INT(10),
       FOREIGN KEY (QID) REFERENCES QUIZINFO(QID) ON DELETE CASCADE ON UPDATE CASCADE
   );

   INSERT INTO QUIZQUES VALUES("A relational database consists of a collection of","Tables","Fields","Records","Keys",1,1),
   ("A ________ in a table represents a relationship among a set of values.","Column","Key","Row","Entry",3,1),
("The term _______ is used to refer to a row"," Attribute","Tuple"," Instance","Feild",2,1),
("The term attribute refers to a ___________ of a table.","Record","Column","Tuple","Key",2,1),
(" For each attribute of a relation, there is a set of permitted values, called the ________ of that attribute","Domain","Relation","Set","Schema",1,1),



("A relational database consists of a collection of","Tables","Fields","Records","Keys",1,9),
   ("A ________ in a table represents a relationship among a set of values.","Column","Key","Row","Entry",3,9),
("The term _______ is used to refer to a row"," Attribute","Tuple"," Instance","Feild",2,9),
("The term attribute refers to a ___________ of a table.","Record","Column","Tuple","Key",2,9),
(" For each attribute of a relation, there is a set of permitted values, called the ________ of that attribute","Domain","Relation","Set","Schema",1,9),



("A relational database consists of a collection of","Tables","Fields","Records","Keys",1,3),
   ("A ________ in a table represents a relationship among a set of values.","Column","Key","Row","Entry",3,3),
("The term _______ is used to refer to a row"," Attribute","Tuple"," Instance","Feild",2,3),
("The term attribute refers to a ___________ of a table.","Record","Column","Tuple","Key",2,3),
(" For each attribute of a relation, there is a set of permitted values, called the ________ of that attribute","Domain","Relation","Set","Schema",1,3),




("A relational database consists of a collection of","Tables","Fields","Records","Keys",1,4),
   ("A ________ in a table represents a relationship among a set of values.","Column","Key","Row","Entry",3,4),
("The term _______ is used to refer to a row"," Attribute","Tuple"," Instance","Feild",2,4),
("The term attribute refers to a ___________ of a table.","Record","Column","Tuple","Key",2,4),
(" For each attribute of a relation, there is a set of permitted values, called the ________ of that attribute","Domain","Relation","Set","Schema",1,4),



("A relational database consists of a collection of","Tables","Fields","Records","Keys",1,5),
   ("A ________ in a table represents a relationship among a set of values.","Column","Key","Row","Entry",3,5),
("The term _______ is used to refer to a row"," Attribute","Tuple"," Instance","Feild",2,5),
("The term attribute refers to a ___________ of a table.","Record","Column","Tuple","Key",2,5),
(" For each attribute of a relation, there is a set of permitted values, called the ________ of that attribute","Domain","Relation","Set","Schema",1,5),




("A relational database consists of a collection of","Tables","Fields","Records","Keys",1,6),
   ("A ________ in a table represents a relationship among a set of values.","Column","Key","Row","Entry",3,6),
("The term _______ is used to refer to a row"," Attribute","Tuple"," Instance","Feild",2,6),
("The term attribute refers to a ___________ of a table.","Record","Column","Tuple","Key",2,6),
(" For each attribute of a relation, there is a set of permitted values, called the ________ of that attribute","Domain","Relation","Set","Schema",1,6),




("A relational database consists of a collection of","Tables","Fields","Records","Keys",1,7),
   ("A ________ in a table represents a relationship among a set of values.","Column","Key","Row","Entry",3,7),
("The term _______ is used to refer to a row"," Attribute","Tuple"," Instance","Feild",2,7),
("The term attribute refers to a ___________ of a table.","Record","Column","Tuple","Key",2,7),
(" For each attribute of a relation, there is a set of permitted values, called the ________ of that attribute","Domain","Relation","Set","Schema",1,7),




("A relational database consists of a collection of","Tables","Fields","Records","Keys",1,8),
   ("A ________ in a table represents a relationship among a set of values.","Column","Key","Row","Entry",3,8),
("The term _______ is used to refer to a row"," Attribute","Tuple"," Instance","Feild",2,8),
("The term attribute refers to a ___________ of a table.","Record","Column","Tuple","Key",2,8),
(" For each attribute of a relation, there is a set of permitted values, called the ________ of that attribute","Domain","Relation","Set","Schema",1,8);





