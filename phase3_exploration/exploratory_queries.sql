--Top 5 Departments by Total Visit Cost
SELECT d.department_name, SUM(f.cost) AS total_cost
FROM fact_visits f
JOIN dim_departments d ON f.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_cost DESC
LIMIT 5;

--Doctors with Most Patients
SELECT doc.name AS doctor_name, COUNT(*) AS num_patients
FROM fact_visits f
JOIN dim_doctors doc ON f.doctor_id = doc.doctor_id
GROUP BY f.doctor_id
ORDER BY num_patients DESC
LIMIT 5;

-- Most Common Diagnoses
SELECT diag.diagnosis_description, COUNT(*) AS diagnosis_count
FROM fact_visits f
JOIN dim_diagnosis diag ON f.diagnosis_code = diag.diagnosis_code
GROUP BY f.diagnosis_code
ORDER BY diagnosis_count DESC
LIMIT 5;

--Age Group Analysis
SELECT
  CASE
    WHEN TIMESTAMPDIFF(YEAR, p.birth_date, CURDATE()) < 18 THEN 'Child'
    WHEN TIMESTAMPDIFF(YEAR, p.birth_date, CURDATE()) BETWEEN 18 AND 60 THEN 'Adult'
    ELSE 'Senior'
  END AS age_group,
  COUNT(*) AS num_visits
FROM fact_visits f
JOIN dim_patients p ON f.patient_id = p.patient_id
GROUP BY age_group;

--Readmission Rates by Department