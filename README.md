# Hospita Data Warehouse

A data warehouse project designed to demonstrate SQL and data modeling skills. It follows a star schema structure to track and analyze hospital visit records, patient data, diagnoses, and readmission trends.


## Project Objectives

- Design a dimensional model for healthcare data.
- Simulate hospital visit data using a **star schema**.
- Build a foundational warehouse for advanced analytics.
- Write SQL queries to derive insights on patient behavior, doctor performance, and readmission rates.

## Diagram

![Star Schema](./diagrams/star_schema.png)


## Phases

- Phase 1 – Schema Design & Setup
- Phase 2 – Sample Data Ingestion  
- Phase 3 – Query Building & Insights  
- Phase 4 – BI Dashboard & Deployment 
- Phase 5 – ETL pipeline
- Phase 6 - Analysis



## Star Schema Design

### Fact Table: `fact_visits`
Captures core metrics related to patient hospital visits.

| Column          | Type         | Description                     |
|-----------------|--------------|---------------------------------|
| visit_id        | SERIAL (PK)  | Unique visit identifier         |
| patient_id      | INT (FK)     | Reference to the patient        |
| doctor_id       | INT (FK)     | Reference to the doctor         |
| department_id   | INT (FK)     | Department involved             |
| admit_date      | DATE         | Date of admission               |
| discharge_date  | DATE         | Date of discharge               |
| diagnosis_code  | VARCHAR(50)  | Code of diagnosis               |
| cost            | DECIMAL      | Total cost of treatment         |
| readmitted      | BOOLEAN      | Readmission flag                |

### Dimension Tables

#### `dim_patients`
Stores patient demographic information.

#### `dim_doctors`
Stores doctor details and specialization.

#### `dim_departments`
Stores department-level metadata.

#### `dim_diagnosis`
Stores diagnosis code, description, and category.


## Sample Use Cases

- Track average length of stay by department.
- Analyze readmission rates by diagnosis.
- Rank doctors by total cost billed.


## Tools Used

- PostgreSQL (or MySQL)
- SQL
- ER Diagram Tools (dbdiagram.io / DrawSQL)
- CSV (for loading sample data)


## Contributing
Contributions are welcome! Please see [CONTRIBUTING.md](docs/CONTRIBUTING.md) for guidelines.

## Code of Conduct
Please read our [Code of Conduct](docs/CODE_OF_CONDUCT.md) before contributing to this project.

## Security
If you discover a vulnerability, please refer to our [Security Policy](docs/SECURITY.md) for instructions on how to report it responsibly.


## License  
This project is licensed under the [MIT License](LICENSE).  



## Author

[**Aakaash M S**](https://github.com/msaakaash)
