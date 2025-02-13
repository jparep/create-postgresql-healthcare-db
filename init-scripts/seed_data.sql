-- Insert sample patients
INSERT INTO vital_health_db.patients (first_name, last_name, dob, gender, contact_info)
VALUES 
('John', 'Doe', '1980-05-15', 'Male', 'john.doe@example.com'),
('Jane', 'Smith', '1992-08-22', 'Female', 'jane.smith@example.com');

-- Insert medical records (after patients exist)
INSERT INTO vital_health_db.medical_records (patient_id, diagnosis, treatment, doctor_name, record_date)
VALUES 
(1, 'Flu', 'Rest and hydration', 'Dr. Williams', '2025-02-10'),
(2, 'Sprained Ankle', 'Apply ice and elevate', 'Dr. Adams', '2025-01-25');

-- Insert billing records (after patients exist)
INSERT INTO vital_health_db.billing (patient_id, amount, payment_status, invoice_date)
VALUES 
(1, 250.00, 'Pending', '2025-02-12'),
(2, 100.00, 'Paid', '2025-01-28');
