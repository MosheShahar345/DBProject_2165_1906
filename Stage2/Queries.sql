SELECT A.A_id, A.Start_date, A.End_date, O.O_name,
       (SELECT COUNT(*)
        FROM Assigned_personnel AP
        WHERE AP.A_id = A.A_id) AS Personnel_Count
FROM Assignments A
JOIN Assigned_operation AO ON A.A_id = AO.A_id
JOIN Operations_ O ON AO.O_id = O.O_id
ORDER BY A.A_id;


SELECT IR.Submitted_by, P.P_name,
       (SELECT COUNT(*)
        FROM Intelligence_reports IR2
        WHERE IR2.Submitted_by = IR.Submitted_by) AS Report_Count
FROM Intelligence_reports IR
JOIN Personnel P ON IR.Submitted_by = P.P_id
GROUP BY IR.Submitted_by, P.P_name
ORDER BY Report_Count DESC;


SELECT TO_CHAR(O.Start_date, 'YYYY-MM') AS Start_Month,
       (SELECT AVG(O2.End_date - O2.Start_date)
        FROM Operations_ O2
        WHERE TO_CHAR(O2.Start_date, 'YYYY-MM') = TO_CHAR(O.Start_date, 'YYYY-MM')) AS Avg_Duration_Days
FROM Operations_ O
GROUP BY TO_CHAR(O.Start_date, 'YYYY-MM')
ORDER BY Start_Month;


SELECT O_id, O_name, Start_date, End_date, Num_Assigned_Personnel
FROM (
    SELECT O.O_id, O.O_name, O.Start_date, O.End_date, 
           COUNT(AP.P_id) AS Num_Assigned_Personnel
    FROM Operations_ O
    JOIN Assigned_operation AO ON O.O_id = AO.O_id
    JOIN Assignments A ON AO.A_id = A.A_id
    JOIN Assigned_personnel AP ON A.A_id = AP.A_id
    GROUP BY O.O_id, O.O_name, O.Start_date, O.End_date
)T
ORDER BY Num_Assigned_Personnel DESC
FETCH FIRST 3 ROWS ONLY;





UPDATE Equipment
SET Status = 'Taken'
WHERE E_id IN (SELECT E_id FROM Assignments);

UPDATE Personnel
SET Rank_ = 'Samal'
WHERE P_id IN (
    SELECT P_id
    FROM Assigned_personnel
    GROUP BY P_id
    HAVING COUNT(A_id) > 3
) AND Rank_ = 'Turai';




DELETE FROM Equipment
WHERE E_id NOT IN (SELECT E_id FROM Assignments);

DELETE FROM Intelligence_reports
WHERE Date_submitted < TO_DATE('08/04/1948', 'DD/MM/YYYY');
