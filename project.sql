CREATE TABLE `student` (
  `student_ID` int PRIMARY KEY,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `Email` varchar(255),
  `address` varchar(255),
  `birth_date` date,
  `sex` char,
  `second_address` varchar(255),
  `flat_number` int,
  `uni_ID` int,
  `faculty_ID` int
);

CREATE TABLE `lecturer` (
  `lecturer_ID` int PRIMARY KEY,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `Email` varchar(255),
  `rank` varchar(255),
  `subject` varchar(255),
  `address` varchar(255),
  `birth_date` date,
  `sex` char,
  `account_number` varchar(255),
  `second_address` varchar(255),
  `flat_number` int,
  `uni_ID` int
);

CREATE TABLE `manager` (
  `manager_ID` int PRIMARY KEY,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `phone_number` varchar(255),
  `Email` varchar(255),
  `uni_ID` int
);

CREATE TABLE `university` (
  `uni_ID` int PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `faculty` (
  `faculty_ID` int PRIMARY KEY,
  `faculty_name` varchar(255)
);

CREATE TABLE `course` (
  `course_ID` int PRIMARY KEY,
  `course_name` varchar(255),
  `uni_ID` int
);

CREATE TABLE `subject` (
  `subject_ID` int PRIMARY KEY,
  `lecturer_ID` int,
  `subject_name` varchar(255),
  `start_date` datetime,
  `end_date` datetime,
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
  `lecture_name` varchar(255),
  `subject_ID` int
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
