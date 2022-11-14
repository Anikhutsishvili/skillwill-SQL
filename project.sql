CREATE TABLE `student` (
  `student_ID` int PRIMARY KEY,
  `first_name` varchar(255) Not null,
  `last_name` varchar(255) Not null,
  `Email` varchar(255) Not null,
  `address` varchar(255) Not null,
  `birth_date` date Not null,
  `sex` char Not null,
  `second_address` varchar(255),
  `flat_number` int,
  `uni_ID` int,
  `faculty_ID` int
);

CREATE TABLE `lecturer` (
  `lecturer_ID` int PRIMARY KEY,
  `first_name` varchar(255)  Not null,
  `last_name` varchar(255) Not null,
  `Email` varchar(255) Not null,
  `rank` varchar(255)  Not null,
  `subject` varchar(255) Not null,
  `address` varchar(255) Not null,
  `birth_date` date Not null,
  `sex` char Not null,
  `account_number` varchar(255)  Not null,
  `second_address` varchar(255)  Not null,
  `flat_number` int,
  `uni_ID` int
);

CREATE TABLE `manager` (
  `manager_ID` int PRIMARY KEY,
  `first_name` varchar(255)  Not null,
  `last_name` varchar(255)  Not null,
  `phone_number` varchar(255),
  `Email` varchar(255) Not null,
  `uni_ID` int
);

CREATE TABLE `university` (
  `uni_ID` int PRIMARY KEY,
  `name` varchar(255) Not null
);

CREATE TABLE `faculty` (
  `faculty_ID` int PRIMARY KEY,
  `faculty_name` varchar(255) Not null
);

CREATE TABLE `course` (
  `course_ID` int PRIMARY KEY,
  `course_name` varchar(255) Not null Not null,
  `uni_ID` int
);

CREATE TABLE `subject` (
  `subject_ID` int PRIMARY KEY,
  `lecturer_ID` int,
  `subject_name` varchar(255)   Not null,
  `start_date` datetime Not null,
  `end_date` datetime Not null,
  `course_ID` int
);

CREATE TABLE `lecturer_subjects` (
  `lecture_schedule_ID` int PRIMARY KEY,
  `lecturer_ID` int,
  `subject_ID` int,
  `start_date` datetime,
  `end_date` datetime
);

CREATE TABLE `lecture` (
  `lecture_ID` int,
  `lecture_name` varchar(255)   Not null,
  `subject_ID` int Not null
);

CREATE TABLE `lecture_schedule` (
  `lecture_schedule_ID` int,
  `lecture_ID` int,
  `lecture_time` datetime
);

CREATE TABLE `student_lectures` (
  `student_lecture_ID` int,
  `student_ID` int,
  `lecture_schedule_ID` int
);

ALTER TABLE `student` ADD FOREIGN KEY (`uni_ID`) REFERENCES `university` (`uni_ID`);

ALTER TABLE `lecturer` ADD FOREIGN KEY (`uni_ID`) REFERENCES `university` (`uni_ID`);

ALTER TABLE `lecturer` ADD FOREIGN KEY (`lecturer_ID`) REFERENCES `subject` (`subject_name`);

ALTER TABLE `manager` ADD FOREIGN KEY (`uni_ID`) REFERENCES `university` (`uni_ID`);

ALTER TABLE `student` ADD FOREIGN KEY (`faculty_ID`) REFERENCES `faculty` (`faculty_ID`);

ALTER TABLE `course` ADD FOREIGN KEY (`uni_ID`) REFERENCES `university` (`uni_ID`);

ALTER TABLE `subject` ADD FOREIGN KEY (`course_ID`) REFERENCES `course` (`course_ID`);

ALTER TABLE `lecturer_subjects` ADD FOREIGN KEY (`lecturer_ID`) REFERENCES `lecturer` (`lecturer_ID`);

ALTER TABLE `lecturer_subjects` ADD FOREIGN KEY (`subject_ID`) REFERENCES `subject` (`subject_ID`);

ALTER TABLE `lecture` ADD FOREIGN KEY (`subject_ID`) REFERENCES `subject` (`subject_ID`);

ALTER TABLE `lecture_schedule` ADD FOREIGN KEY (`lecture_ID`) REFERENCES `lecture` (`lecture_ID`);

ALTER TABLE `student_lectures` ADD FOREIGN KEY (`student_ID`) REFERENCES `student` (`student_ID`);

ALTER TABLE `student_lectures` ADD FOREIGN KEY (`lecture_schedule_ID`) REFERENCES `lecture_schedule` (`lecture_schedule_ID`);
