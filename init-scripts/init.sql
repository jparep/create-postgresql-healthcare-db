-- Create the schema (optional but recommended)
CREATE SCHEMA IF NOT EXISTS vital_health_db;

-- Create the Patients table
CREATE TABLE vital_health_db.patients (
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    dob DATE,
    gender VARCHAR(50),
    contact_info TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the Medical Records table
CREATE TABLE vital_health_db.medical_records (
    record_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES vital_health_db.patients(patient_id) ON DELETE CASCADE,
    diagnosis TEXT,
    treatment TEXT,
    doctor_name VARCHAR(255),
    record_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the Billing table
CREATE TABLE vital_health_db.billing (
    bill_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES vital_health_db.patients(patient_id) ON DELETE CASCADE,
    amount DECIMAL(10,2), -- Using DECIMAL instead of FLOAT for accurate currency storage
    payment_status VARCHAR(50) CHECK (payment_status IN ('Pending', 'Paid', 'Overdue')),
    invoice_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- End of init script
-- docker-compose up -d
-- psql -U dbuser -d vital_health_db -h localhost -p 5433

