ALTER TABLE Personnel
ADD CONSTRAINT chk_rank CHECK (Rank_ IN ('Turai', 'Sgan Aluf', 'Samal Rishon', 'Aluf Mishne', 'Samal', 'Tat Aluf', 'Rasan', 'Segen Mishne', 'Aluf', 'Segen', 'Rabat', 'Seren', 'Rav Seren'));

ALTER TABLE Assignments
ADD CONSTRAINT chk_date CHECK (End_date > Start_date);

ALTER TABLE Equipment
MODIFY Status DEFAULT 'Available';
