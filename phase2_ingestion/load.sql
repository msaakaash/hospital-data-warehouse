-- store csv in the result of this directory
SHOW VARIABLES LIKE 'secure_file_priv';

GRANT FILE ON *.* TO 'root'@'localhost';
FLUSH PRIVILEGES;
-- Load data into dim_patients
LOAD DATA INFILE 'C:/Program Files/Mysql new/Uploads/dim_patients.csv'
INTO TABLE dim_patients
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(patient_id, name, gender, birth_date, address);

-- Load data into dim_doctors
LOAD DATA INFILE 'C:/Program Files/Mysql new/Uploads/dim_doctors.csv'
INTO TABLE dim_doctors
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(doctor_id, name, specialization, experience_years);

-- Load data into dim_departments
LOAD DATA INFILE 'C:/Program Files/Mysql new/Uploads/dim_departments.csv'
INTO TABLE dim_departments
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(department_id, department_name, location);

-- Load data into dim_diagnosis
LOAD DATA INFILE 'C:/Program Files/Mysql new/Uploads/dim_diagnosis.csv'
INTO TABLE dim_diagnosis
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(diagnosis_code, diagnosis_description, category);

-- Load data into fact_visits
LOAD DATA INFILE 'C:/Program Files/Mysql new/Uploads/fact_visits.csv'
INTO TABLE fact_visits
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(visit_id, patient_id, doctor_id, department_id, admit_date, discharge_date, diagnosis_code, cost, @readmitted)
SET readmitted = CASE
                    WHEN @readmitted = 'True' THEN 1
                    WHEN @readmitted = 'False' THEN 0
                    ELSE NULL
                 END;

SELECT * FROM fact_visits LIMIT 10;
