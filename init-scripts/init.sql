-- Create the schema (optional but recommended)
CREATE SCHEMA IF NOT EXISTS vital_health_db;

-- Create the Patients table
CREATE TABLE vital_health_db.patients (
    patient_id BIGSERIAL PRIMARY KEY, -- Using BIGSERIAL for scalability
    first_name VARCHAR(100) NOT NULL, -- Reducing length for efficiency
    last_name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL CHECK (dob < CURRENT_DATE), -- Ensuring valid DOB
    gender VARCHAR(10) CHECK (gender IN ('Male', 'Female', 'Other')), -- Enforcing values
    contact_info TEXT,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Create an index on patient_id for faster joins
CREATE INDEX idx_patients_patient_id ON vital_health_db.patients (patient_id);

-- Create the Medical Records table
CREATE TABLE vital_health_db.medical_records (
    record_id BIGSERIAL PRIMARY KEY,
    patient_id BIGINT REFERENCES vital_health_db.patients(patient_id) ON DELETE CASCADE,
    diagnosis TEXT NOT NULL,
    treatment TEXT NOT NULL,
    doctor_name VARCHAR(255) NOT NULL,
    record_date DATE NOT NULL,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Index for optimizing queries by patient_id
CREATE INDEX idx_medical_records_patient_id ON vital_health_db.medical_records (patient_id);

-- Create an ENUM type for payment status to optimize storage
CREATE TYPE payment_status_enum AS ENUM ('Pending', 'Paid', 'Overdue');

-- Create the Billing table
CREATE TABLE vital_health_db.billing (
    bill_id BIGSERIAL PRIMARY KEY,
    patient_id BIGINT REFERENCES vital_health_db.patients(patient_id) ON DELETE CASCADE,
    amount DECIMAL(10,2) CHECK (amount >= 0), -- Ensuring amount is non-negative
    payment_status payment_status_enum NOT NULL, -- Using ENUM instead of VARCHAR
    invoice_date DATE NOT NULL DEFAULT CURRENT_DATE, -- Default to current date
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Index for optimizing queries by patient_id
CREATE INDEX idx_billing_patient_id ON vital_health_db.billing (patient_id);

-- Ensure updated_at is automatically updated on row changes
CREATE OR REPLACE FUNCTION update_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Attach the trigger to all tables needing automatic timestamp updates
CREATE TRIGGER trg_patients_update_time
BEFORE UPDATE ON vital_health_db.patients
FOR EACH ROW EXECUTE FUNCTION update_timestamp();

CREATE TRIGGER trg_medical_records_update_time
BEFORE UPDATE ON vital_health_db.medical_records
FOR EACH ROW EXECUTE FUNCTION update_timestamp();

CREATE TRIGGER trg_billing_update_time
BEFORE UPDATE ON vital_health_db.billing
FOR EACH ROW EXECUTE FUNCTION update_timestamp();
