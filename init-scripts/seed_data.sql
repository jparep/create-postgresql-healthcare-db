-- Insert 10 patients
INSERT INTO vital_health_db.patients (first_name, last_name, dob, gender, contact_info)
VALUES 
('John', 'Doe', '1980-05-15', 'Male', 'john.doe@example.com'),
('Jane', 'Smith', '1992-08-22', 'Female', 'jane.smith@example.com'),
('Michael', 'Brown', '1990-06-30', 'Male', 'michael.brown@example.com'),
('Emily', 'Davis', '1985-12-11', 'Female', 'emily.davis@example.com'),
('Daniel', 'Wilson', '1999-04-25', 'Male', 'daniel.wilson@example.com'),
('Sarah', 'Miller', '2000-09-10', 'Female', 'sarah.miller@example.com'),
('Robert', 'Garcia', '1975-07-22', 'Male', 'robert.garcia@example.com'),
('Laura', 'Martinez', '1993-03-19', 'Female', 'laura.martinez@example.com'),
('James', 'Anderson', '1982-11-05', 'Male', 'james.anderson@example.com'),
('Olivia', 'Taylor', '1997-01-15', 'Female', 'olivia.taylor@example.com');

-- Insert 10 medical records for existing patients
INSERT INTO vital_health_db.medical_records (patient_id, diagnosis, treatment, doctor_name, record_date)
VALUES 
(1, 'Flu', 'Rest and hydration', 'Dr. Williams', '2025-02-10'),
(2, 'Sprained Ankle', 'Apply ice and elevate', 'Dr. Adams', '2025-01-25'),
(3, 'Asthma', 'Inhaler prescribed', 'Dr. Johnson', '2025-01-20'),
(4, 'High Blood Pressure', 'Diet and exercise', 'Dr. Roberts', '2025-01-15'),
(5, 'Diabetes', 'Insulin therapy', 'Dr. Lee', '2025-01-12'),
(6, 'Migraine', 'Painkillers and rest', 'Dr. Taylor', '2025-01-10'),
(7, 'Cold', 'Fluids and rest', 'Dr. Adams', '2025-01-05'),
(8, 'Fracture', 'X-ray and cast applied', 'Dr. Carter', '2025-01-03'),
(9, 'Allergy', 'Antihistamines prescribed', 'Dr. Johnson', '2025-01-01'),
(10, 'COVID-19', 'Quarantine and supportive care', 'Dr. Brown', '2024-12-30');

-- Insert 10 billing records for existing patients
INSERT INTO vital_health_db.billing (patient_id, amount, payment_status, invoice_date)
VALUES 
(1, 250.00, 'Pending', '2025-02-12'),
(2, 100.00, 'Paid', '2025-01-28'),
(3, 150.50, 'Overdue', '2025-01-20'),
(4, 300.00, 'Paid', '2025-01-15'),
(5, 450.00, 'Pending', '2025-01-12'),
(6, 120.00, 'Overdue', '2025-01-10'),
(7, 75.00, 'Paid', '2025-01-05'),
(8, 500.00, 'Pending', '2025-01-03'),
(9, 90.00, 'Overdue', '2025-01-01'),
(10, 220.00, 'Paid', '2024-12-30');

-- End of seed data
-- docker exec -i psql psql -U dbuser -d vital_health_db < init-scripts/seed_data.sql
