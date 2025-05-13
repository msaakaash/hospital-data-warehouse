import pandas as pd
import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="password",
    database="hospital"
)
cursor = conn.cursor()

# Define helper
def load_csv_to_table(csv_path, table_name):
    df = pd.read_csv(csv_path)
    for _, row in df.iterrows():
        placeholders = ', '.join(['%s'] * len(row))
        sql = f"INSERT INTO {table_name} VALUES ({placeholders})"
        cursor.execute(sql, tuple(row))
    conn.commit()
    print(f"Loaded data into {table_name}")

# Load all cleaned CSVs
load_csv_to_table("../transform/cleaned_patients.csv", "dim_patients")
load_csv_to_table("../transform/cleaned_doctors.csv", "dim_doctors")
load_csv_to_table("../transform/cleaned_departments.csv", "dim_departments")
load_csv_to_table("../transform/cleaned_diagnosis.csv", "dim_diagnosis")
load_csv_to_table("../transform/cleaned_visits.csv", "fact_visits")

cursor.close()
conn.close()
