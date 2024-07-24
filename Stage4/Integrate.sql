CREATE TABLE Base
(
  BaseID INT NOT NULL,
  BaseName VARCHAR2(30) NOT NULL,
  Location_ VARCHAR2(30) NOT NULL,
  PRIMARY KEY (BaseID)
);

CREATE TABLE Trip
(
  TripID INT NOT NULL,
  TripDate DATE NOT NULL,
  Destination VARCHAR2(30) NOT NULL,
  PRIMARY KEY (TripID)
);

CREATE TABLE Accident
(
  AccidentID INT NOT NULL,
  DateOfAccident DATE NOT NULL,
  DamageLevel INT NOT NULL,
  PRIMARY KEY (AccidentID)
);

CREATE TABLE HasTrips
(
  SoldierID INT NOT NULL,
  TripID INT NOT NULL,
  PRIMARY KEY (SoldierID, TripID),
  FOREIGN KEY (SoldierID) REFERENCES Soldier(SoldierID),
  FOREIGN KEY (TripID) REFERENCES Trip(TripID)
);

CREATE TABLE Vehicle
(
  VehicleID INT NOT NULL,
  Model_ VARCHAR2(30) NOT NULL,
  AquisitionDate DATE NOT NULL,
  Status VARCHAR2(30) NOT NULL,
  BaseID INT,
  A_id INT, 
  PRIMARY KEY (VehicleID),
  FOREIGN KEY (BaseID) REFERENCES Base(BaseID),
  FOREIGN KEY (A_id) REFERENCES Assignments(A_id)
);

CREATE TABLE MaintenanceRecord
(
  RecordID INT NOT NULL,
  DateOfMaintenance DATE NOT NULL,
  Description_ VARCHAR2(200) NOT NULL,
  VehicleID INT,
  PRIMARY KEY (RecordID),
  FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID)
);

CREATE TABLE DriveAt
(
  DateOfDrive DATE NOT NULL,
  SoldierID INT NOT NULL,
  VehicleID INT NOT NULL,
  PRIMARY KEY (SoldierID, VehicleID),
  FOREIGN KEY (SoldierID) REFERENCES Soldier(SoldierID),
  FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID)
);

CREATE TABLE HadTrip
(
  VehicleID INT NOT NULL,
  TripID INT NOT NULL,
  PRIMARY KEY (VehicleID, TripID),
  FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID),
  FOREIGN KEY (TripID) REFERENCES Trip(TripID)
);

CREATE TABLE MadeMaintenance
(
  SoldierID INT NOT NULL,
  RecordID INT NOT NULL,
  PRIMARY KEY (SoldierID, RecordID),
  FOREIGN KEY (SoldierID) REFERENCES Soldier(SoldierID),
  FOREIGN KEY (RecordID) REFERENCES MaintenanceRecord(RecordID)
);

CREATE TABLE HadAccident
(
  AccidentID INT NOT NULL,
  VehicleID INT NOT NULL,
  PRIMARY KEY (AccidentID, VehicleID),
  FOREIGN KEY (AccidentID) REFERENCES Accident(AccidentID),
  FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID)
);

ALTER TABLE Personnel
ADD DateOfBirth DATE;

ALTER TABLE Personnel RENAME TO Soldier;
ALTER TABLE Soldier RENAME COLUMN P_id TO SoldierID;
ALTER TABLE Soldier RENAME COLUMN P_name TO Name_;

BEGIN
    FOR rec IN (SELECT P_id FROM Personnel) LOOP
        UPDATE Personnel
        SET DateOfBirth = TRUNC(
            TO_DATE('1960-01-01', 'YYYY-MM-DD') + 
            ROUND(DBMS_RANDOM.VALUE(0, 16500))
        )
        WHERE P_id = rec.P_id;
    END LOOP;
    COMMIT;
END;
