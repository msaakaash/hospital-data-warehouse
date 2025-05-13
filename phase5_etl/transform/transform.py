import pandas as pd
import os

input_dir = "../extract/"
output_dir = "../transform/"

# Ensure output directory exists
os.makedirs(output_dir, exist_ok=True)

# Clean patients
patients = pd.read_csv(input_dir + "patients.csv")
patients.dropna(inplace=True)
patients["name"] = patients["name"].str.title()
patients.to_csv(output_dir + "cleaned_patients.csv", index=False)

# Clean doctors
doctors = pd.read_csv(input_dir + "doctors.csv")
doctors["name"] = doctors["name"].str.title()
doctors.fillna({"experience_years": 0}, inplace=True)
doctors.to_csv(output_dir + "cleaned_doctors.csv", index=False)

# Clean departments
departments = pd.read_csv(input_dir + "departments.csv")
departments.drop_duplicates(inplace=True)
departments.to_csv(output_dir + "cleaned_departments.csv", index=False)

# Clean diagnosis
diagnosis = pd.read_csv(input_dir + "diagnosis.csv")
diagnosis.drop_duplicates(subset="diagnosis_code", inplace=True)
diagnosis.to_csv(output_dir + "cleaned_diagnosis.csv", index=False)

# Clean visits
visits = pd.read_csv(input_dir + "visits.csv")
visits.fillna({"readmitted": False}, inplace=True)
visits.to_csv(output_dir + "cleaned_visits.csv", index=False)

print("Transformation complete. Cleaned files saved.")
