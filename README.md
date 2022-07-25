# Product Wiki

All things related to product - processes, best practices, setup guides, and more!

---

## Guides & Processes

---

[Getting Started](https://www.notion.so/Getting-Started-cc5f31e246fc42a896ba4dd1e0c6db31)

[ER Diagram](https://www.notion.so/ER-Diagram-28ce331c69634884ad77331ac665efcc)

[Various Tables](https://www.notion.so/Various-Tables-dd416b4b845342ff97b26d1a398bf2e9)

[Normalisation](https://www.notion.so/Normalisation-be87da93c5b9413ea012a9c21fffb6a0)

[Results](https://www.notion.so/Results-a9e59eee8f63419abf39e4da203823b1)

---

```markdown
✨Getting Started
```

The goal of this project is to create a database management system to house data on an online student portal. This will manage the students’ information during the online semester.

Each student's individual log-in details are stored in the database, enabling them to access the portal. Students can see their marks, assignment submissions, and attendance in various courses they are enrolled in. Additionally, the database contains data about students' names, roll numbers, and graduation years.

Additionally, the database contains data on the faculty members who use it, such as their names, email addresses, the subjects they teach, and the number of students who attended classes they were enrolled in. Additionally, the database contains a list of all assignments, exams, and grades received by students registered for each subject.

Finally, this database aims to efficiently manage all the resources for the smooth functioning of the online semester.

---

:

```markdown
🐙 E-R Diagram
```

![image12.png](Product%20Wiki%20b4e669838fcb406f8ad6d0a840bf9f19/image12.png)

```markdown
🚩 Various Tables 
```

**Student_table** 

- Student_Name (VARCHAR(60) NOT NULL)
- Passing_Year(NUMBER NOT NULL)
- Roll_Number(NUMBER NOT NULL)
- UG_OR_PG (VARCHAR(40) NOT NULL)
- User_ID(VARCHAR (60) NOT NULL)
- Student_password(VARCHAR(60) NOT NULL)

PRIMARY KEY={Roll_Number}

**Faculty**

- Faculty_ID(VARCHAR(40) NOT NULL)
- Faculty_Name(VARCHAR(40) NOT NULL)
- Email(VARCHAR(60) NOT NULL)

PRIMARY KEY={Faculty_Id}

**Exam_Type**

- Exam__Type(VARCHAR(40) NOT NULL)
- Total_Marks(INT NOT NULL)
- Exam_Duration(VARCHAR(40) NOT NULL)

PRIMARY KEY={Exam__Type}

**Subject**

- Subject_Name (VARCHAR(40) NOT NULL)
- Credits (INT NOT NULL)
- Semester (VARCHAR(10) NOT NULL)
- Faculty_ID (VARCHAR(40) NOT NULL)

PRIMARY KEY(Subject_Name)

FOREIGN KEY(Faculty_Id) REFERENCES  Faculty(Faculty_Id) )

**Exam**

- Exam_Code (VARCHAR(20) NOT NULL)
- Exam__Type (VARCHAR(40) NOT NULL)
- Subject_Name (VARCHAR(40) NOT NULL)

PRIMARY KEY(Exam_Code)

FOREIGN KEY(Exam__Type) REFERENCES Exam_Type(Exam__Type),

FOREIGN KEY(Subject_Name) REFERENCES Subject(Subject_Name)

**Course_Enrolled**

- Subject_Name (VARCHAR(40) NOT NULL)
- Roll_Number (NUMBER NOT NULL)
- Attendance (VARCHAR(20) NOT NULL)

PRIMARY KEY(Subject_Name,Roll_Number)

FOREIGN KEY(Subject_Name) REFERENCES Subject(Subject_Name)

FOREIGN KEY( Roll_Number ) REFERENCES Student_table( Roll_Number )

**Assignment**

- Assignmnet_Name (VARCHAR(40) NOT NULL)
- Deadline (DATE NOT NULL)
- Total_Marks (INT NOT NULL)
- Subject_Name (VARCHAR(40) NOT NULL)

PRIMARY KEY(Assignmnet_Name)

FOREIGN KEY(Subject_Name) REFERENCES Subject(Subject_Name)

**Assignment_Submission**

- Assignment_Marks_Scored (INT NOT NULL)
- Submission_date (DATE NOT NULL)
- Roll_Number (NUMBER NOT NULL)
- Assignmnet_Name (VARCHAR(40) NOT NULL)

PRIMARY KEY(Assignmnet_Name,Roll_Number),

FOREIGN KEY( Roll_Number ) REFERENCES Student_table( Roll_Number ),

FOREIGN KEY( Assignmnet_Name ) REFERENCES Assignment( Assignmnet_Name )

**Exam_Score**

- Exam_Code ( VARCHAR(20) NOT NULL)
- Roll_Number (NUMBER NOT NULL)
- Marks_Scored ( INT NOT NULL)
- PRIMARY KEY(Exam_Code,Roll_Number)

FOREIGN KEY( Exam_Code ) REFERENCES  Exam(Exam_Code)

FOREIGN KEY( Roll_Number ) REFERENCES Student_table( Roll_Number )

[https://lh5.googleusercontent.com/NzP775hfXcX-4pswqfpmowk8fIlQqbGT6uG-ZBY3gzzscDnll3XhmJJrGmtr5-BfxVma-YkyMI-kRCaIOPjhMRBjn9l3CQJfPPOmmTCZONQ3jd26Sfo6-pC-03YvhyqxiuLWiLpp_NrF9PBpfhpt3GI](https://lh5.googleusercontent.com/NzP775hfXcX-4pswqfpmowk8fIlQqbGT6uG-ZBY3gzzscDnll3XhmJJrGmtr5-BfxVma-YkyMI-kRCaIOPjhMRBjn9l3CQJfPPOmmTCZONQ3jd26Sfo6-pC-03YvhyqxiuLWiLpp_NrF9PBpfhpt3GI)

```markdown
  **NORMALISATION**
```

**Student_table**

Roll_Number->

{Student_Name,Passing_Year,UG_OR_PG,User_ID,Student_Password}

The primary key is Roll_Number.

There is no partial dependency; therefore, the table is in 2NF.

There is no transitive dependency; therefore, the table is in 3NF.

All dependencies are from Candidate Key. Therefore, the table is

BCNF

**Faculty**

Faculty_ID->{Faculty_Name,Email}

The primary key is Faculty_ID.

There is no partial dependency; therefore, the table is in 2NF.

There is no transitive dependency; therefore, the table is in 3NF.

All dependencies are from Candidate Key. Therefore, the table is

BCNF

**Exam**

Exam_Code->Exam__Type,Subject_Name

Exam__Type->{Total_Marks,Exam_Duration}

We divide the table into two tables to eliminate transitive dependency. We make an Exam_Type table which has the primary key as Exam__Type and we add Subject_Name. RELATIONSHIP TESTING

NOW Exam__Type AND Exam ARE IN BCNF FORM.

**Assignment**

Assignment_Name->{Deadline,Total_Marks,Subject_Name}

The primary key is Assignment_Name.

There is no partial dependency; therefore, the table is in 2NF.

There is no transitive dependency; therefore, the table is in 3NF.

All dependencies are from Candidate Key. Therefore, the table is

BCNF.

**Subject**

Subject_Name->{Credits,Semester,Faculty_ID}

The primary key is Subject_Name.

There is no partial dependency; therefore, the table is in 2NF.

There is no transitive dependency; therefore, the table is in 3NF.

All dependencies are from Candidate Key. Therefore, the table is

BCNF.

**Exam_Score**

{Exam_Code,Roll_Number}->Marks_Scored

Prime Attributes=Exam_Code,Roll_Number

Non Prime Attribute=Marks_Scored.

The primary keys are "Exam_Code" and "Roll_Number”.

There is no partial dependency; therefore, the table is in 2NF.

There is no transitive dependency; therefore, the table is in 3NF.

ALL DEPENDENCIES ARE FROM CANDIDATE KEY, THEREFORE THE TABLE IS  BCNF.

**Course_Enrolled**

{Subject_Name,Roll_Number}->Attendance

Prime Attributes=Subject_Name,Roll_Number

Non Prime Attribute=Attendance.

The primary keys are: "Subject_Name," "Roll_Number."

There is no partial dependency; therefore, the table is in 2NF.

There is no transitive dependency; therefore, the table is in 3NF.

All dependencies are from Candidate Key. Therefore, the table is

BCNF

**Assignment_Submission**

{Assignment_Name,Roll_Number}

- >{Assignment_Marks_Scored,Submission_date}

Assignment_Name, Assignment_Roll_Number

Non Prime Attribute=Assignment_Marks_Scored,Submission_date.

The primary keys are "Assignment_Marks" and "Roll_Number".

There is no partial dependency; therefore, the table is in 2NF.

There is no transitive dependency; therefore, the table is in 3NF.

All dependencies are from the Candidate Key. Therefore, the table is

BCNF

```markdown
**Results🎇🎊**
```

**Student_table**

![image2.png](Product%20Wiki%20b4e669838fcb406f8ad6d0a840bf9f19/image2.png)

**Exam**

![image4.png](Product%20Wiki%20b4e669838fcb406f8ad6d0a840bf9f19/image4.png)

**Faculty**

![image3.png](Product%20Wiki%20b4e669838fcb406f8ad6d0a840bf9f19/image3.png)

**Subject**

![image5.png](Product%20Wiki%20b4e669838fcb406f8ad6d0a840bf9f19/image5.png)

**Exam__Type**

![image13.png](Product%20Wiki%20b4e669838fcb406f8ad6d0a840bf9f19/image13.png)

**Assignment**

![image7.png](Product%20Wiki%20b4e669838fcb406f8ad6d0a840bf9f19/image7.png)

**Exam_Score**

![image10.png](Product%20Wiki%20b4e669838fcb406f8ad6d0a840bf9f19/image10.png)

![image6.png](Product%20Wiki%20b4e669838fcb406f8ad6d0a840bf9f19/image6.png)

**Course_Enrolled**

![image8.png](Product%20Wiki%20b4e669838fcb406f8ad6d0a840bf9f19/image8.png)

**Assignment_Submission**

![image9.png](Product%20Wiki%20b4e669838fcb406f8ad6d0a840bf9f19/image9.png)