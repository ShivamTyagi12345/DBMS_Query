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

[https://lh6.googleusercontent.com/WjgbxMIj0qkSJoS7oad7Rex_3weumjrFArYJN3LDoY8Qpl4B_aLuYjWfXb3IBbo0zeMNdXVrItIykDLAvJE4mWuRC6zLHekg-8xlM8LD08oQ8YofdB1hI-x-B3KdG0t_c7mIUW-7awTO50YSzrc8NoQ](https://lh6.googleusercontent.com/WjgbxMIj0qkSJoS7oad7Rex_3weumjrFArYJN3LDoY8Qpl4B_aLuYjWfXb3IBbo0zeMNdXVrItIykDLAvJE4mWuRC6zLHekg-8xlM8LD08oQ8YofdB1hI-x-B3KdG0t_c7mIUW-7awTO50YSzrc8NoQ)

**Exam**

[https://lh4.googleusercontent.com/eIIMxndSz7o7wQ_F4sGU6FyUMgJaRm0NUSo00Uc095kAMLgcoGBNs763s7Vy2qZtDhNURHKPFlra698emVgBbJDXrd8n7sqwo-xeYytLHeqiv0CCe6SLsiUq_xDR_rfCeodUXz91upoAG8MVYv46r0A](https://lh4.googleusercontent.com/eIIMxndSz7o7wQ_F4sGU6FyUMgJaRm0NUSo00Uc095kAMLgcoGBNs763s7Vy2qZtDhNURHKPFlra698emVgBbJDXrd8n7sqwo-xeYytLHeqiv0CCe6SLsiUq_xDR_rfCeodUXz91upoAG8MVYv46r0A)

**Faculty**

[https://lh6.googleusercontent.com/3M6kVUKCCTlRZUU8mPniT0wInBgT8mF8nSzUGq3OhdnukFexRL1eyhppRpVoSpDZ_hHhCVqd_bxO-ABZyKTXxKR1k0-wjXeFsvWiuRSL8QvbUlZ4eBLmDd6m-6zxLXWnRUiDgZpO8fyj30CPFYwvc_A](https://lh6.googleusercontent.com/3M6kVUKCCTlRZUU8mPniT0wInBgT8mF8nSzUGq3OhdnukFexRL1eyhppRpVoSpDZ_hHhCVqd_bxO-ABZyKTXxKR1k0-wjXeFsvWiuRSL8QvbUlZ4eBLmDd6m-6zxLXWnRUiDgZpO8fyj30CPFYwvc_A)

**Subject**

[https://lh4.googleusercontent.com/9XDJEvsNy8vZUqQHpaM3LLYT-89T6wfl4e6SLF21tQNULsVGgyiqUEpsxC9CXcaB5hs-EUVNIKPyZYwK2CTOIFNeXFcUVMwClzPnXdpMRs3zIS7Q7l0ubEQ7il6fGzlLeY_SLnN40kq5SPyr6Jw7Y-U](https://lh4.googleusercontent.com/9XDJEvsNy8vZUqQHpaM3LLYT-89T6wfl4e6SLF21tQNULsVGgyiqUEpsxC9CXcaB5hs-EUVNIKPyZYwK2CTOIFNeXFcUVMwClzPnXdpMRs3zIS7Q7l0ubEQ7il6fGzlLeY_SLnN40kq5SPyr6Jw7Y-U)

**Exam__Type**

[https://lh6.googleusercontent.com/CGV-oHfkrFsp_qxlVr-rzsqfvppxI2fu1xlkYSlH_SGR5pQm02n-WVHz4DbHpnDKzMi3IBWXP2x6bIj7akKmEVJPCK_EuO5d6Fo-CRVOM-xGsv_Cg0ylleamXO9pqTcRfN9umU9lgIvICuRnqe7oiqE](https://lh6.googleusercontent.com/CGV-oHfkrFsp_qxlVr-rzsqfvppxI2fu1xlkYSlH_SGR5pQm02n-WVHz4DbHpnDKzMi3IBWXP2x6bIj7akKmEVJPCK_EuO5d6Fo-CRVOM-xGsv_Cg0ylleamXO9pqTcRfN9umU9lgIvICuRnqe7oiqE)

**Assignment**

[https://lh5.googleusercontent.com/tJo5Do5Dztu0sV1jdA7FOgiWZjptS6PF-vrI-K_bxZGxng33PcTHe69ZmhsnOini1P7QT8NmmxXnELtiO4iFF1qEUaHcTxVGAi_G1VJgnQtT700C1-0RW17547mCMElgD_sz0d-0u91jx-IVmMovz34](https://lh5.googleusercontent.com/tJo5Do5Dztu0sV1jdA7FOgiWZjptS6PF-vrI-K_bxZGxng33PcTHe69ZmhsnOini1P7QT8NmmxXnELtiO4iFF1qEUaHcTxVGAi_G1VJgnQtT700C1-0RW17547mCMElgD_sz0d-0u91jx-IVmMovz34)

**Exam_Score**

[https://lh4.googleusercontent.com/OfqkFOIEypQRzBCBlU9fQa8rTHvf_XHXHWE6hvAv4AQ0TWpFdKsoRKFh3DpE7grcSq3PqBZcsfOklirRYoGzp6z68t1uHG6Czl2Dpt7wHmV5VuIv5aY713KhDQWOTS3rq-LH6KBdUERHqmpm9WeiuFE](https://lh4.googleusercontent.com/OfqkFOIEypQRzBCBlU9fQa8rTHvf_XHXHWE6hvAv4AQ0TWpFdKsoRKFh3DpE7grcSq3PqBZcsfOklirRYoGzp6z68t1uHG6Czl2Dpt7wHmV5VuIv5aY713KhDQWOTS3rq-LH6KBdUERHqmpm9WeiuFE)

[https://lh3.googleusercontent.com/BF_gE_3UDvAYzaKieKZNGTV1iKfFpH2ip8KWKl1HyoVPvnY2Wx-rai1LLYQd-h0s_-UKUcOHsOmNmrNNsrxwG-HpAyPtvEQdbQFcfhkJ91O1d4arDKMCQVwqcvftJLB8JPto_Kdk1Eq82tw9TqUOgxA](https://lh3.googleusercontent.com/BF_gE_3UDvAYzaKieKZNGTV1iKfFpH2ip8KWKl1HyoVPvnY2Wx-rai1LLYQd-h0s_-UKUcOHsOmNmrNNsrxwG-HpAyPtvEQdbQFcfhkJ91O1d4arDKMCQVwqcvftJLB8JPto_Kdk1Eq82tw9TqUOgxA)

**Course_Enrolled**

[https://lh5.googleusercontent.com/rHfUCka0JfKKLTgE4PGV5A_cQz9e7NDjUxNOJxekokNLO21GM4CyFnVfk_nJXwbNyPeeleSSP9dS2Lw_zEC7HMfe6FlR7np-4Yfj383FuUZUL_COV6-xvMhrYj4vZW64exaR-xFBTFht-VxD83lDKpM](https://lh5.googleusercontent.com/rHfUCka0JfKKLTgE4PGV5A_cQz9e7NDjUxNOJxekokNLO21GM4CyFnVfk_nJXwbNyPeeleSSP9dS2Lw_zEC7HMfe6FlR7np-4Yfj383FuUZUL_COV6-xvMhrYj4vZW64exaR-xFBTFht-VxD83lDKpM)

**Assignment_Submission**

[https://lh4.googleusercontent.com/ec87mbyyQPup5GzP3rP-GRn_1YS_YiovZBqsERStijhEL0wJZr0LknD1_D1GM_zp6T94UIp6YNm8X2qtxbMxo8Mt5q4hSy_zrco1wPeUDHqZzO53bSyt1PBJC6BMiekZvEH41FS9bVELmw5SdPqS4wA](https://lh4.googleusercontent.com/ec87mbyyQPup5GzP3rP-GRn_1YS_YiovZBqsERStijhEL0wJZr0LknD1_D1GM_zp6T94UIp6YNm8X2qtxbMxo8Mt5q4hSy_zrco1wPeUDHqZzO53bSyt1PBJC6BMiekZvEH41FS9bVELmw5SdPqS4wA)