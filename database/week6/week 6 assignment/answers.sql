-- Number 1. Simple Join


SELECT 
    provider_name,
    provider_specialty
FROM 
    providers;



-- Number 2. Inner Join
SELECT 
    p.patient_id,
    p.first_name,
    p.last_name,
    pr.provider_specialty
FROM 
    patients p
INNER JOIN 
    visits v ON p.patient_id = v.patient_id
INNER JOIN 
    providers pr ON v.provider_id = pr.provider_id;



-- Number 3. Left Join
SELECT 
    p.patient_id,
    p.first_name,
    p.last_name,
    v.date_of_visit
FROM 
    patients p
LEFT JOIN 
    visits v ON p.patient_id = v.patient_id;



-- Number 4. Join with Aggregation
SELECT 
    p.provider_name,
    COUNT(v.visit_id) as visit_count
FROM 
    providers p
LEFT JOIN 
    visits v ON p.provider_id = v.provider_id
GROUP BY 
    p.provider_name;




-- Number 5. Complex Join With Conditions
SELECT 
    p.patient_id,
    p.first_name,
    p.last_name,
    a.admission_date,
    a.discharge_date
FROM 
    patients p
INNER JOIN 
    visits v ON p.patient_id = v.patient_id
INNER JOIN 
    admissions a ON v.visit_id = a.visit_id;


-- Bonus Question
SELECT 
    p.first_name,
    p.last_name,
    p.date_of_birth,
    pr.provider_name,
    v.visit_date,
    v.blood_pressure_systolic,
    v.blood_pressure_diastolic,
    v.visit_status,
    a.admission_date,
    a.discharge_date
FROM 
    patients p
INNER JOIN 
    visits v ON p.patient_id = v.patient_id
INNER JOIN 
    providers pr ON v.provider_id = pr.provider_id
INNER JOIN 
    admissions a ON v.visit_id = a.visit_id
WHERE 
    a.discharge_disposition = 'Home'
ORDER BY 
    v.date_of_visit DESC;