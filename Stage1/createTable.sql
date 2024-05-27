CREATE TABLE Operations_ 
( 
  O_id INT NOT NULL, 
  O_name VARCHAR2(50) NOT NULL, 
  Star_date DATE NOT NULL, 
  End_date DATE NOT NULL, 
  Objective VARCHAR2(200) NOT NULL, 
  PRIMARY KEY (O_id) 
); 
 
CREATE TABLE Assignments 
( 
  A_id INT NOT NULL, 
  P_id INT NOT NULL, 
  O_id INT NOT NULL, 
  E_id INT NOT NULL, 
  Star_date DATE NOT NULL, 
  End_date DATE NOT NULL, 
  PRIMARY KEY (A_Id) 
); 
 
CREATE TABLE Intelligence_reports 
( 
  I_id INT NOT NULL, 
  O_id INT NOT NULL, 
  Submitted_by VARCHAR2(50) NOT NULL, 
  Date_submitted DATE NOT NULL, 
  Content_ VARCHAR2(1000) NOT NULL, 
  PRIMARY KEY (I_id), 
  FOREIGN KEY (O_id) REFERENCES Operations_(O_id) 
); 
 
CREATE TABLE Role_ 
( 
  R_id INT NOT NULL, 
  R_name VARCHAR2(50) NOT NULL, 
  Description_ VARCHAR2(200) NOT NULL, 
  PRIMARY KEY (R_id) 
); 
 
CREATE TABLE Equipment 
( 
  E_id INT NOT NULL, 
  Type_ VARCHAR2(50) NOT NULL, 
  Status INT NOT NULL, 
  PRIMARY KEY (E_id)
); 
 
CREATE TABLE Personnel 
( 
  P_id INT NOT NULL, 
  R_id INT NOT NULL, 
  P_name VARCHAR2(50) NOT NULL, 
  Rank_ VARCHAR2(50) NOT NULL,
  PRIMARY KEY (P_id), 
  FOREIGN KEY (R_id) REFERENCES Role_(R_id) 
);

CREATE TABLE Submits 
( 
  P_id INT NOT NULL, 
  I_id INT NOT NULL, 
  PRIMARY KEY (P_id, I_id), 
  FOREIGN KEY (P_id) REFERENCES Personnel(P_id), 
  FOREIGN KEY (I_id) REFERENCES Intelligence_reports(I_id) 
); 
 
CREATE TABLE Assigned_personnel 
( 
  A_id INT NOT NULL, 
  P_id INT NOT NULL, 
  PRIMARY KEY (A_id, P_id), 
  FOREIGN KEY (A_id) REFERENCES Assignments(A_id), 
  FOREIGN KEY (P_id) REFERENCES Personnel(P_id) 
);

CREATE TABLE Assigned_operation 
( 
  A_id INT NOT NULL, 
  O_id INT NOT NULL, 
  PRIMARY KEY (A_id, O_id), 
  FOREIGN KEY (A_id) REFERENCES Assignments(A_id), 
  FOREIGN KEY (O_id) REFERENCES Operations_(O_id) 
);
