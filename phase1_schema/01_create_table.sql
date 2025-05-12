-- Dimension tables
CREATE TABLE dim_patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    gender VARCHAR(10),
    birth_date DATE,
    address VARCHAR(255)
);

CREATE TABLE dim_doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(100),
    experience_years INT
);

CREATE TABLE dim_departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE dim_diagnosis (
    diagnosis_code VARCHAR(50) PRIMARY KEY,
    diagnosis_description VARCHAR(255),
    category VARCHAR(100)
);

-- Fact table with matching types

CREATE TABLE fact_visits (
    visit_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    department_id INT NOT NULL,
    admit_date DATE,
    discharge_date DATE,
    diagnosis_code VARCHAR(50),
    cost DECIMAL(10, 2),
    readmitted boolean,
    FOREIGN KEY (patient_id) REFERENCES dim_patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES dim_doctors(doctor_id),
    FOREIGN KEY (department_id) REFERENCES dim_departments(department_id),
    FOREIGN KEY (diagnosis_code) REFERENCES dim_diagnosis(diagnosis_code)
);
