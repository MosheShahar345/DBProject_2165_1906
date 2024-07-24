------------------ pov of new ------------------

CREATE VIEW IntegratedDetailsView AS
SELECT 
    t.TripID,
    t.TripDate,
    t.Destination,
    v.VehicleID,
    v.Model_ AS VehicleModel,
    v.AquisitionDate,
    v.Status AS VehicleStatus,
    b.BaseID,
    b.BaseName,
    b.Location_ AS BaseLocation,
    a.AccidentID,
    a.DateOfAccident,
    a.DamageLevel,
    mr.RecordID,
    mr.DateOfMaintenance,
    mr.Description_ AS MaintenanceDescription
FROM 
    Trip t
LEFT JOIN 
    HadTrip ht ON t.TripID = ht.TripID
LEFT JOIN 
    Vehicle v ON ht.VehicleID = v.VehicleID
LEFT JOIN 
    Base b ON v.BaseID = b.BaseID
LEFT JOIN 
    HadAccident ha ON v.VehicleID = ha.VehicleID
LEFT JOIN 
    Accident a ON ha.AccidentID = a.AccidentID
LEFT JOIN 
    MaintenanceRecord mr ON v.VehicleID = mr.VehicleID;


SELECT 
    VehicleID,
    VehicleModel,
    COUNT(TripID) AS TotalTrips
FROM 
    IntegratedDetailsView
GROUP BY 
    VehicleID, VehicleModel
ORDER BY 
    TotalTrips;
    
    
SELECT 
    VehicleID,
    VehicleModel,
    BaseName,
    BaseLocation,
    RecordID,
    DateOfMaintenance,
    MaintenanceDescription
FROM 
    IntegratedDetailsView
WHERE 
    DateOfMaintenance > TO_DATE(&<name="Maintenance Date" hint="Enter the maintenance date in format DD/MM/YYYY" type="date">, 'DD/MM/YYYY')
ORDER BY 
    DateOfMaintenance DESC;
    
    
------------------ pov of original ------------------
    
CREATE VIEW AssignmentDetailsView AS
SELECT 
    a.A_id,
    s.SoldierID,
    s.Name_ AS SoldierName,
    s.Rank_,
    r.R_name,
    e.E_id,
    e.Type_,
    e.Status,
    o.O_id,
    o.O_name,
    o.Objective,
    a.Start_date AS AssignmentStartDate,
    a.End_date AS AssignmentEndDate
FROM 
    Assignments a
JOIN 
    Assigned_personnel ap ON a.A_id = ap.A_id
JOIN 
    Soldier s ON ap.P_id = s.SoldierID
JOIN 
    Role_ r ON s.R_id = r.R_id
JOIN 
    Equipment e ON a.E_id = e.E_id
JOIN 
    Assigned_operation ao ON a.A_id = ao.A_id
JOIN 
    Operations_ o ON ao.O_id = o.O_id;


SELECT 
    SoldierID,
    SoldierName,
    Rank_,
    R_name AS RoleName,
    COUNT(A_id) AS NumberOfAssignments,
    LISTAGG(O_name, ', ') WITHIN GROUP (ORDER BY O_name) AS OperationsInvolved
FROM 
    AssignmentDetailsView
WHERE 
    SoldierName = &<name="Soldier Name" hint="Enter the soldier's name" type="string">
GROUP BY 
    SoldierID, SoldierName, Rank_, R_name
ORDER BY 
    NumberOfAssignments DESC;


SELECT 
    o.O_id,
    o.O_name,
    e.Type_ AS EquipmentType,
    COUNT(e.E_id) AS EquipmentCount
FROM 
    AssignmentDetailsView adv
JOIN 
    Equipment e ON adv.E_id = e.E_id
JOIN 
    Operations_ o ON adv.O_id = o.O_id
GROUP BY 
    o.O_id, o.O_name, e.Type_
ORDER BY 
    o.O_id, EquipmentCount DESC;
    
