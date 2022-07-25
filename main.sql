CREATE TABLE Student_table
( Student_Name  VARCHAR(60) NOT NULL,
 Passing_Year   NUMBER NOT NULL,
 Roll_Number    NUMBER NOT NULL,
 UG_OR_PG       VARCHAR(40) NOT NULL,
 User_ID        VARCHAR(60) NOT NULL,
 Student_password  VARCHAR(60) NOT NULL,
 PRIMARY KEY(Roll_Number) );
 
 CREATE TABLE Faculty
 (Faculty_Id     VARCHAR(40) NOT NULL,
  Faculty_Name   VARCHAR(40) NOT NULL,
  Email          VARCHAR(60) NOT NULL,
  PRIMARY KEY(Faculty_Id));
  
  CREATE TABLE Exam_Type
  ( Exam__Type   VARCHAR(40) NOT NULL,
    Total_Marks  INT NOT NULL,
    Exam_Duration VARCHAR(40) NOT NULL,
    PRIMARY KEY(Exam__Type));
    
  CREATE TABLE Subject
  ( Subject_Name VARCHAR(40) NOT NULL,
    Credits     INT NOT NULL,
    Semester    VARCHAR(10) NOT NULL,
    Faculty_Id     VARCHAR(40) NOT NULL,
      PRIMARY KEY(Subject_Name),
    FOREIGN KEY(Faculty_Id) REFERENCES  Faculty(Faculty_Id) );
    
 CREATE TABLE Exam
 (Exam_Code    VARCHAR(20) NOT NULL,
  Exam__Type   VARCHAR(40) NOT NULL,
  Subject_Name VARCHAR(40) NOT NULL,
  PRIMARY KEY(Exam_Code),
  FOREIGN KEY(Exam_Type) REFERENCES Exam_Type(Exam_Type),
  FOREIGN KEY(Subject_Name) REFERENCES Subject(Subject_Name));
   
  CREATE TABLE Course_Enrolled
  ( 
    Subject_Name VARCHAR(40) NOT NULL,
    Roll_Number    NUMBER NOT NULL,
    Attendance    VARCHAR(20) NOT NULL,
    PRIMARY KEY(Subject_Name,Roll_Number),
    FOREIGN KEY(Subject_Name) REFERENCES Subject(Subject_Name),
    FOREIGN KEY( Roll_Number ) REFERENCES Student_table( Roll_Number ));
    
 CREATE TABLE Assignment
 ( Assignmnet_Name VARCHAR(40) NOT NULL,
  Deadline     DATE  NOT NULL,
  Total_Marks  INT   NOT NULL,
  Subject_Name VARCHAR(40) NOT NULL,
  PRIMARY KEY(Assignmnet_Name),
  FOREIGN KEY(Subject_Name) REFERENCES Subject(Subject_Name));
    
 CREATE TABLE Assignment_Submission
 ( Assignment_Marks_Scored INT NOT NULL,
  Submission_date DATE NOT NULL,
  Roll_Number    NUMBER NOT NULL,
  Assignmnet_Name VARCHAR(40) NOT NULL,
  PRIMARY KEY(Assignmnet_Name,Roll_Number),
  FOREIGN KEY( Roll_Number ) REFERENCES Student_table( Roll_Number ),
  FOREIGN KEY( Assignmnet_Name ) REFERENCES Assignment( Assignmnet_Name ));
   
 CREATE TABLE Exam_Score
 (   Exam_Code    VARCHAR(20) NOT NULL,
     Roll_Number    NUMBER NOT NULL,
     Marks_Scored  INT NOT NULL,
     PRIMARY KEY(Exam_Code,Roll_Number),
     FOREIGN KEY( Exam_Code ) REFERENCES  Exam(Exam_Code),
     FOREIGN KEY( Roll_Number ) REFERENCES Student_table( Roll_Number ));

 
INSERT INTO Student_table VALUES('Narender choudhary',2024,207249,'UG','Nc962027','Password');
INSERT INTO Student_table VALUES('Rahul Sing ',2024,207250,'UG','Rc962028','Passwordone');
INSERT INTO Student_table VALUES('Saurav choudhary',2024,207251,'UG','Sc962029','Passwordtwo');
INSERT INTO Student_table VALUES('Atual shrama',2024,207252,'UG','At962030','Passwordthree');
INSERT INTO Student_table VALUES('Rajvee choudhary',2024,207253,'UG','Rc962031','Passwordfour');

INSERT INTO Faculty VALUES('Fltone','Dr krishna kumar','Krkumar23@gmail.com');
INSERT INTO Faculty VALUES('Flttwo','Dr surja kumar','srjkumar3@gmail.com');
INSERT INTO Faculty VALUES('Fltthree','Dr aditya sharma','adsrj2@gmail.com');
INSERT INTO Faculty VALUES('Fltfour','Dr shrman sing','drsrmn99@gmail.com');
INSERT INTO Faculty VALUES('Fltfive','Mrs sridevi','sridevi43@gmail.com');

INSERT INTO Exam_Type VALUES('Minor One',15,'20 Min');
INSERT INTO Exam_Type VALUES('MID SEM',30,'2 Hours');
INSERT INTO Exam_Type VALUES('Minor Two',15,'20 Min');
INSERT INTO Exam_Type VALUES('END SEM',40,'3 Hours');

INSERT INTO Subject VALUES('Data structures ',4,'Third Sem','Fltone');
INSERT INTO Subject VALUES('Operating system ',4,'Third Sem','Flttwo');
INSERT INTO Subject VALUES('Design Analysis Algorithm',4,'Third Sem','Fltthree');
INSERT INTO Subject VALUES('Computer Archeture ',4,'Third Sem','Fltfour');
INSERT INTO Subject VALUES('Digital Logic design ',4,'Third Sem','Fltfive');


INSERT INTO Exam VALUES('Dsa','Minor One','Data structures ');
INSERT INTO Exam VALUES('Dsa_MID','MID SEM','Data structures ');
INSERT INTO Exam VALUES('Dsa_M2','Minor Two','Data structures ');
INSERT INTO Exam VALUES('Dsa_END','END SEM','Data structures ');
INSERT INTO Exam VALUES('Os','Minor One','Operating system ');
INSERT INTO Exam VALUES('Os_MID','MID SEM','Operating system ');
INSERT INTO Exam VALUES('Os_M2','Minor Two','Operating system ');
INSERT INTO Exam VALUES('Os_END','END SEM','Operating system ');
INSERT INTO Exam VALUES('DAA','Minor One','Design Analysis Algorithm');
INSERT INTO Exam VALUES('DAA_MID','MID SEM','Design Analysis Algorithm');
INSERT INTO Exam VALUES('DAA_M2','Minor Two','Design Analysis Algorithm');
INSERT INTO Exam VALUES('DAA_END','END SEM','Design Analysis Algorithm');
INSERT INTO Exam VALUES('CA','Minor One','Computer Archeture ');
INSERT INTO Exam VALUES('CA_MID','MID SEM','Computer Archeture ');
INSERT INTO Exam VALUES('CA_M2','Minor Two','Computer Archeture ');
INSERT INTO Exam VALUES('CA_END','END SEM','Computer Archeture ');
INSERT INTO Exam VALUES('DLD','Minor One','Digital Logic design ');
INSERT INTO Exam VALUES('DLD_MID','MID SEM','Digital Logic design ');
INSERT INTO Exam VALUES('DLD_M2','Minor Two','Digital Logic design ');
INSERT INTO Exam VALUES('DLD_END','END SEM','Digital Logic design ');


INSERT INTO Course_Enrolled VALUES('Data structures ',207249,'78%');
INSERT INTO Course_Enrolled VALUES('Operating system ',207249,'78%');
INSERT INTO Course_Enrolled VALUES('Design Analysis Algorithm',207249,'78%');
INSERT INTO Course_Enrolled VALUES('Computer Archeture ',207249,'78%');
INSERT INTO Course_Enrolled VALUES('Digital Logic design ',207249,'78%');
INSERT INTO Course_Enrolled VALUES('Data structures ',207250,'80%');
INSERT INTO Course_Enrolled VALUES('Operating system ',207250,'80%');
INSERT INTO Course_Enrolled VALUES('Design Analysis Algorithm',207250,'80%');
INSERT INTO Course_Enrolled VALUES('Computer Archeture ',207250,'80%');
INSERT INTO Course_Enrolled VALUES('Digital Logic design ',207250,'80%');
INSERT INTO Course_Enrolled VALUES('Design Analysis Algorithm',207251,'82%');
INSERT INTO Course_Enrolled VALUES('Digital Logic design ',207251,'82%');
INSERT INTO Course_Enrolled VALUES('Computer Archeture ',207251,'82%');
INSERT INTO Course_Enrolled VALUES('Data structures ',207252,'87%');
INSERT INTO Course_Enrolled VALUES('Computer Archeture ',207252,'87%');
INSERT INTO Course_Enrolled VALUES('Data structures ',207253,'90%');


  INSERT INTO Assignment VALUES('Tree visliser',  to_date('2022-07-20', 'yyyy-mm-dd'),10,'Data structures ');
  INSERT INTO Assignment VALUES('OS design',  to_date('2022-07-20', 'yyyy-mm-dd'),10,'Operating system ');
  INSERT INTO Assignment VALUES('Dyanamic Progrming',  to_date('2022-07-21', 'yyyy-mm-dd'),10,'Design Analysis Algorithm');
  INSERT INTO Assignment VALUES('CPU Design',  to_date('2022-07-22', 'yyyy-mm-dd'),10,'Computer Archeture ');
  INSERT INTO Assignment VALUES('IC NUMBERS',  to_date('2022-07-23', 'yyyy-mm-dd'),10,'Digital Logic design ');

    


INSERT INTO Assignment_Submission VALUES(9, to_date('2022-07-20', 'yyyy-mm-dd'),207249,'Tree visliser');
INSERT INTO Assignment_Submission VALUES(8, to_date('2022-07-19', 'yyyy-mm-dd'),207249,'OS design');
INSERT INTO Assignment_Submission VALUES(5, to_date('2022-07-22', 'yyyy-mm-dd'),207249,'Dyanamic Progrming');
INSERT INTO Assignment_Submission VALUES(6, to_date('2022-07-22', 'yyyy-mm-dd'),207249,'CPU Design');
INSERT INTO Assignment_Submission VALUES(7, to_date('2022-07-25', 'yyyy-mm-dd'),207249,'IC NUMBERS');

INSERT INTO Assignment_Submission VALUES(9, to_date('2022-07-20', 'yyyy-mm-dd'),207250,'Tree visliser');
INSERT INTO Assignment_Submission VALUES(7, to_date('2022-07-22', 'yyyy-mm-dd'),207250,'OS design');
INSERT INTO Assignment_Submission VALUES(7, to_date('2022-07-23', 'yyyy-mm-dd'),207250,'Dyanamic Progrming');
INSERT INTO Assignment_Submission VALUES(8, to_date('2022-07-24', 'yyyy-mm-dd'),207250,'CPU Design');
INSERT INTO Assignment_Submission VALUES(6, to_date('2022-07-26', 'yyyy-mm-dd'),207250,'IC NUMBERS');

INSERT INTO Assignment_Submission VALUES(7, to_date('2022-07-23', 'yyyy-mm-dd'),207251,'Dyanamic Progrming');
INSERT INTO Assignment_Submission VALUES(8, to_date('2022-07-24', 'yyyy-mm-dd'),207251,'CPU Design');
INSERT INTO Assignment_Submission VALUES(6, to_date('2022-07-26', 'yyyy-mm-dd'),207251,'IC NUMBERS');

INSERT INTO Assignment_Submission VALUES(6, to_date('2022-07-23', 'yyyy-mm-dd'),207252,'Tree visliser');
INSERT INTO Assignment_Submission VALUES(9, to_date('2022-07-20', 'yyyy-mm-dd'),207252,'CPU Design');

INSERT INTO Assignment_Submission VALUES(10, to_date('2022-07-23', 'yyyy-mm-dd'),207253,'Tree visliser');


INSERT INTO Exam_Score VALUES('Dsa',207249,8);
INSERT INTO Exam_Score VALUES('Dsa_MID',207249,20);
INSERT INTO Exam_Score VALUES('Dsa_M2',207249,8);
INSERT INTO Exam_Score VALUES('Dsa_END',207249,30);

INSERT INTO Exam_Score VALUES('Dsa',207250,7);
INSERT INTO Exam_Score VALUES('Dsa_MID',207250,20);
INSERT INTO Exam_Score VALUES('Dsa_M2',207250,7);
INSERT INTO Exam_Score VALUES('Dsa_END',207250,30);

INSERT INTO Exam_Score VALUES('Dsa',207252,8);
INSERT INTO Exam_Score VALUES('Dsa_MID',207252,20);
INSERT INTO Exam_Score VALUES('Dsa_M2',207252,8);
INSERT INTO Exam_Score VALUES('Dsa_END',207252,30);

INSERT INTO Exam_Score VALUES('Dsa',207253,7);
INSERT INTO Exam_Score VALUES('Dsa_MID',207253,20);
INSERT INTO Exam_Score VALUES('Dsa_M2',207253,7);
INSERT INTO Exam_Score VALUES('Dsa_END',207253,30);

INSERT INTO Exam_Score VALUES('Os',207249,8);
INSERT INTO Exam_Score VALUES('Os_MID',207249,17);
INSERT INTO Exam_Score VALUES('Os_M2',207249,8);
INSERT INTO Exam_Score VALUES('Os_END',207249,23);

INSERT INTO Exam_Score VALUES('Os',207250,8);
INSERT INTO Exam_Score VALUES('Os_MID',207250,17);
INSERT INTO Exam_Score VALUES('Os_M2',207250,8);
INSERT INTO Exam_Score VALUES('Os_END',207250,34);

INSERT INTO Exam_Score VALUES('DAA',207249,8);
INSERT INTO Exam_Score VALUES('DAA_MID',207249,17);
INSERT INTO Exam_Score VALUES('DAA_M2',207249,2);
INSERT INTO Exam_Score VALUES('DAA_END',207249,20);

INSERT INTO Exam_Score VALUES('DAA',207250,9);
INSERT INTO Exam_Score VALUES('DAA_MID',207250,18);
INSERT INTO Exam_Score VALUES('DAA_M2',207250,3);
INSERT INTO Exam_Score VALUES('DAA_END',207250,34);

INSERT INTO Exam_Score VALUES('DAA',207251,5);
INSERT INTO Exam_Score VALUES('DAA_MID',207251,29);
INSERT INTO Exam_Score VALUES('DAA_M2',207251,6);
INSERT INTO Exam_Score VALUES('DAA_END',207251,34);



INSERT INTO Exam_Score VALUES('CA',207249,6);
INSERT INTO Exam_Score VALUES('CA_MID',207249,29);
INSERT INTO Exam_Score VALUES('CA_M2',207249,10);
INSERT INTO Exam_Score VALUES('CA_END',207249,23);

INSERT INTO Exam_Score VALUES('CA',207250,7);
INSERT INTO Exam_Score VALUES('CA_MID',207250,29);
INSERT INTO Exam_Score VALUES('CA_M2',207250,5);
INSERT INTO Exam_Score VALUES('CA_END',207250,33);

INSERT INTO Exam_Score VALUES('CA',207251,6);
INSERT INTO Exam_Score VALUES('CA_MID',207251,29);
INSERT INTO Exam_Score VALUES('CA_M2',207251,10);
INSERT INTO Exam_Score VALUES('CA_END',207251,33);

INSERT INTO Exam_Score VALUES('CA',207252,6);
INSERT INTO Exam_Score VALUES('CA_MID',207252,23);
INSERT INTO Exam_Score VALUES('CA_M2',207252,10);
INSERT INTO Exam_Score VALUES('CA_END',207252,31);

INSERT INTO Exam_Score VALUES('DLD',207249,7);
INSERT INTO Exam_Score VALUES('DLD_MID',207249,19);
INSERT INTO Exam_Score VALUES('DLD_M2',207249,6);
INSERT INTO Exam_Score VALUES('DLD_END',207249,24);

INSERT INTO Exam_Score VALUES('DLD',207250,7);
INSERT INTO Exam_Score VALUES('DLD_MID',207250,18);
INSERT INTO Exam_Score VALUES('DLD_M2',207250,7);
INSERT INTO Exam_Score VALUES('DLD_END',207250,29);

INSERT INTO Exam_Score VALUES('DLD',207251,7);
INSERT INTO Exam_Score VALUES('DLD_MID',207251,28);
INSERT INTO Exam_Score VALUES('DLD_M2',207251,6);
INSERT INTO Exam_Score VALUES('DLD_END',207251,19);