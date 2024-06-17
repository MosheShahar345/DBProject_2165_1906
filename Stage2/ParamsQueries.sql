SELECT
    O.O_id,
    O.O_name,
    O.Start_date,
    O.End_date,
    O.Objective
FROM
    Operations_ O
WHERE
     O.Start_date >= &<name="Start Date" hint="Enter the start date in format DD/MM/YYYY" type="date"> 
    AND O.End_date <= &<name="End Date" hint="Enter the end date in format DD/MM/YYYY" type="date"> 
ORDER BY
    O.Start_date;

SELECT
    E.E_id,
    E.Type_,
    E.Status
FROM
    Equipment E
WHERE
    E.Status = &<name="Equipment Status" list="Taken,Available" hint="Choose the status of the equipment" type="string"> 
ORDER BY
    E.E_id;


SELECT
    P.P_id,
    P.P_name,
    P.Rank_,
    R.R_name
FROM
    Personnel P
JOIN
    Role_ R ON P.R_id = R.R_id
WHERE
    P.Rank_ = &<name="Rank" hint="Enter the personnel rank" type="string"> 
ORDER BY
    P.P_id;
    
    
SELECT
    I.I_id,
    I.O_id,
    I.Submitted_by,
    I.Date_submitted,
    I.Content_
FROM
    Intelligence_reports I
WHERE
    I.Submitted_by = &<name="Submitted By" hint="Enter the submitter's name" type="string"> 
ORDER BY
    I.Date_submitted;
