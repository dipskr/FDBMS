Create database Application_form;
USE Application_form;
DROP TABLE student;
CREATE TABLE student (
    D_ID INT NOT NULL,
    S_ID INT NOT NULL,
    S_Name VARCHAR(30) NOT NULL,
    S_Gender ENUM('M', 'F') NOT NULL,
    S_Age INT NOT NULL,
    S_Email VARCHAR(50) NOT NULL,
    S_Phone VARCHAR(15) NOT NULL,
    S_Address VARCHAR(60) NOT NULL,
    Q_10th_marks DECIMAL(5 , 2 ) NOT NULL,
    Q_Stream VARCHAR(20) NOT NULL,
    Q_12th_marks DECIMAL(5 , 2 ) NOT NULL,
    Q_Graduation_marks DECIMAL(5 , 2 ) NOT NULL,
    Q_CAT_percentile DECIMAL(5 , 2 ) NOT NULL,
    PRIMARY KEY (D_ID , S_ID),
    FOREIGN KEY (D_ID)
        REFERENCES departments (D_ID)
);
select * from student;
insert into student values(11001, 025001, "Aashika Jain", "F", 21, "aashika@gmail.com", "9911002201", "Delhi", 93.12, "Commerce", 90.13, 83.21, 91.27 ),
(11004, 025002, "Abhiram Mologu", "M", 21, "abhiram@gmail.com", "9911002202", "Hydrabad", 86.2, "Science", 88.19, 73.71, 88.71),
(11002, 025003, "Abhishek Das", "M", 23, "abhishek@gmail.com", "9911002203", "Rourkela",  86.55, "Commerce", 89.33, 82.45, 84.34 ),
(11001, 025004, "Achyut Sinha", "M", 23, "achyut@gmail.com", "9911002204", "Patna", 88.64, "Science", 67.46, 71.43, 85.34 ),
(11003, 025005, "Akshay Vashistha", "M", 25, "akshay@gmail.com", "9911002205", "Delhi", 78.53, "Science", 76.45, 81.43, 89.65 ),
(11001, 025006, "Alakshendra Sharma", "M", 23, "alakshendra@gmail.com", "9911002206", "Delhi", 87.44, "Commerce", 81.28, 69.45, 83.89 ),
(11004, 025007, "Anisha Siwas", "F", 22, "anisha@gmail.com", "9911002207", "Faridabad",  87.23, "Arts", 91.45, 87.21, 96.37 ),
(11003, 025008, "Arpit Govila", "M", 25, "arpit@gmail.com", "9911002208", "Kanpur",  81.89, "Science", 84.34, 84.67, 98.88 ),
(11003, 025009, "Arunita Banerji", "F", 25, "arunita@gmail.com", "9911002209", "Kolkata", 97.00, "Science", 88.67, 79.14, 92.77),
(11002, 025010, "Ayushi Arora", "F", 21, "ayushi@gmail.com", "9911002210", "Hisar", 89.91, "Commerce", 89.56, 76.24, 90.76),
(11004, 025011, "Bagya Shree C.M.", "F", 24, "bagya@gmail.com", "9911002211", "Chennai", 96.32, "Science", 84.34, 86.12, 88.98)
;
SELECT 
    *
FROM
    student;

drop table departments;
CREATE TABLE Departments (
    D_ID INT NOT NULL,
    D_Name VARCHAR(30) NOT NULL,
    D_AllocatedSeats INT NOT NULL,
    D_Num_ofFaculties INT NOT NULL,
    A_ID INT NOT NULL,
    PRIMARY KEY (D_ID),
    FOREIGN KEY (A_ID)
        REFERENCES admin (A_ID)
);
insert into departments values(11001, "Marketing", 120, 18, 3001),
( 11004, "BDA", 60, 09, 3004),
( 11002, "Finance", 120, 15, 3002),
(11003, "Operations", 60, 12, 3003);

SELECT 
    *
FROM
    departments;

drop table admin;
 CREATE TABLE Admin (
    A_ID INT NOT NULL,
    A_Name VARCHAR(30) NOT NULL,
    PRIMARY KEY (A_ID)
);
 
 Insert into Admin values(3001, "Swati Raval"),
 (3004,  "Sham Prasad"),
(3002,  "Ishan Sharma"),
(3003,  "Ali Ashraf")
;
SELECT 
    *
FROM
    Admin;
    
    
    CREATE ROLE 'Dean', 'Secretary', 'Chairman';

GRANT ALL ON application_form.* TO 'Dean';
GRANT SELECT ON application_form.* TO 'Secretary';
GRANT INSERT, UPDATE ON application_form.student TO 'Secretary';
GRANT SELECT, INSERT, UPDATE ON application_form.departments TO 'Chairman';
GRANT SELECT, INSERT, UPDATE ON application_form.admin TO 'Chairman';
   
   CREATE USER 'Deepak'@'localhost' IDENTIFIED BY 'Deepak';
CREATE USER 'Prashant'@'localhost' IDENTIFIED BY 'Prashant';
CREATE USER 'Goutham'@'localhost' IDENTIFIED BY 'Goutham';

GRANT 'Dean' TO 'Deepak'@'localhost';
GRANT 'Secretary' TO 'Prashant'@'localhost';
GRANT 'Chairman' TO 'Goutham'@'localhost';





 

 
