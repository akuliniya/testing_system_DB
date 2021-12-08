CREATE TABLE Exams (
    Id SERIAL,
    Exam_name VARCHAR(40) NOT NULL,
	
	CONSTRAINT exam_id_pk PRIMARY KEY(Id),	
	CONSTRAINT exam_name_unique_key UNIQUE(Exam_name)
)

CREATE TABLE Questions (
	Id SERIAL,
	Ordinal_number INTEGER NOT NULL,
    Question VARCHAR(1000) NOT NULL,
	Exam_id INTEGER,
	
	CONSTRAINT question_id_pk PRIMARY KEY(Id),
	CONSTRAINT exam_id_fk FOREIGN KEY (Exam_id) REFERENCES Exams (Id) 
)

CREATE TABLE Answers (
    Id SERIAL,	
	Option_number INTEGER NOT NULL,
	Answer VARCHAR(40) NOT NULL,
	Is_correct BOOLEAN NOT NULL DEFAULT FALSE,
	Question_id INTEGER,
	
	CONSTRAINT answer_id_pk PRIMARY KEY(Id),
	CONSTRAINT question_id_fk FOREIGN KEY (Question_id) REFERENCES Questions (Id) 
)

CREATE TABLE Students (
    Id SERIAL,
    First_name VARCHAR(40) NOT NULL,
	Second_name VARCHAR(40),
	Last_name VARCHAR(40) NOT NULL,
	
	CONSTRAINT student_id_pk PRIMARY KEY(Id)
)

CREATE TABLE Results (
    --Id INTEGER NOT NULL IDENTITY (1,1),	
	Student_id INTEGER,
	Exam_id INTEGER,
	Question_id INTEGER,
	Selected_option_number INTEGER,	
	
	CONSTRAINT selected_option_in_question_pk PRIMARY KEY(Student_id, Exam_id, Question_id, Selected_option_number),
	CONSTRAINT student_id_fk FOREIGN KEY (Student_id) REFERENCES Students (Id), 
	CONSTRAINT exam_id_fk FOREIGN KEY (Exam_id) REFERENCES Exams (Id), 
	CONSTRAINT question_id_fk FOREIGN KEY (Question_id) REFERENCES Questions (Id) 
)

CREATE TABLE Exam_estimations (	
	Student_id INTEGER,
	Exam_id INTEGER,
	Estimation VARCHAR(40),
	
	CONSTRAINT student_exam_estimation_pk PRIMARY KEY(Student_id, Exam_id, Estimation),
	CONSTRAINT check_estimation_key CHECK (Estimation IN ('BAD', 'SATISFACTORY', 'GOOD', 'PERFECT'))
)


