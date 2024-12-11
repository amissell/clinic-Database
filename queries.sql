-- for exercise --


INSERT INTO patients (firstName, lastName, gender, TheBirthday, phoneNumber, email, address)
VALUES ('Alex', 'Jgdonhf', 'male', '1990-07-15', '1234567890', 'alvdcv,fej@gmaaaaaail.com', '1bgejht nb t');


-- for testing the gender --
INSERT INTO patients (firstName, lastName, gender, TheBirthday, phoneNumber, email, address)
VALUES ('bggh', 'Spmrj', 'other', '1985-05-20', '0987654321', 'ajfhbr@gmail.com', '456resjfhkrfuy');

SELECT * FROM patients


INSERT INTO departments (departmentsId, departmentName, location)
VALUES 
(1,'jfndj', 'hbjjkn'),
(2, 'Cardiology', 'Building A'),
(3, 'Neurology', 'Building B'),
(4, 'Oncology', 'Building C');
(5, 'Orthopedics', 'Building D'),
(6, 'Pediatrics', 'Building E');



    select * from departments


INSERT into medications(medicationName, dosage)
VALUES('fjhfse;', 'vfsrgt')




/*INSERT INTO rooms (roomNumber, roomType, availability) 
VALUES 
('101', 'private', 1),
('102', 'general', 1),
('103', 'ICU', 0),
('104', 'private', 1); */


INSERT INTO doctor (firstName, lastName, phoneNumber, email, specialization, departmentId) 
VALUES 
('Dr. Alice', 'Williams', '1234567890', 'alice.williams@hospital.com', 'Cardiology', 1),
('Dr. Bob', 'Brown', '0987654321', 'bob.brown@hospital.com', 'Neurology', 2),
('Dr. Charlie', 'Davis', '1122334455', 'charlie.davis@hospital.com', 'Oncology', 3);
('Dr. Sarah', 'Smith', '5566778899', 'sarah.smith@hospital.com', 'Orthopedics', 5),
('Dr. Michael', 'Brown', '6677889900', 'michael.brown@hospital.com', 'Pediatrics', 6);




SELECT * from doctor

INSERT INTO appointment (appointmentDate, appointmentTime, patientId, doctorId, reason) 
VALUES 
('2024-12-15', '10:00:00', 1, 7, 'Checkup'),
('2024-12-16', '14:00:00', 2, 8, 'Neurological exam'),
('2024-12-17', '09:30:00', 3, 9, 'Cancer treatment follow-up');

select * from appointment


INSERT INTO prescriptions (prescriptionsDate, medicationId, patientId, doctorId, dosageInstruction) 
VALUES 
('2024-12-15', 1, 1, 7, 'Take one tablet every 4 hours'),

SELECT * from prescriptions


INSERT INTO admissionNew (PatientId, roomId, admissionDate, dischargeDate) 
VALUES 
(1, 1, '2024-12-15', '2024-12-20'),
(2, 2, '2024-12-16', '2024-12-18'),
(3, 3, '2024-12-17', '2024-12-22');

SELECT * from admissionnew

INSERT INTO staff (firstName, lastName, phoneNumber, email, jobTitle, departmentId) 
VALUES 
('Sarah', 'Miller', '5551234567', 'sarah.miller@hospital.com', 'Nurse', 1),
('James', 'Wilson', '5557654321', 'james.wilson@hospital.com', 'Receptionist', 2),
('Ellen', 'Moore', '5556789012', 'ellen.moore@hospital.com', 'Administrator', 3);

select * from staff



-- 3)- sort by ascending order --

SELECT TheBirthday FROM patients
ORDER by TheBirthday;

-- 4)- filter by gender --

SELECT DISTINCT gender from patients



-- 5)-  grt the first three docors --

SELECT * from doctor
limit 3;

-- -(6-     get the patient born after year 2000     -- 

SELECT * FROM patients
WHERE TheBirthday > '2000-01-01';

-- 7)-   filter data based on condition --

SELECT * FROM doctor
WHERE specialization = 'Cardiology'
or specialization = 'Neurology';

-- 8)-  filter using the condition and the operator --

SELECT * FROM admissionnew
WHERE admissionDate BETWEEN '2024-12-16' AND '2024-12-17'

-- 9)     --

ALTER TABLE patients
add ageCategories varchar(20);

SELECT 
    firstName,
    lastName,
    TheBirthday,
    CASE
        WHEN YEAR(CURDATE()) - YEAR(TheBirthday) < 18 THEN 'Enfant'
        WHEN YEAR(CURDATE()) - YEAR(TheBirthday) BETWEEN 18 AND 65 THEN 'Adulte'
        ELSE 'Senior'
    END AS age_category
FROM patients;


-- 10)-           --

SELECT COUNT(*) AS total_appointments
FROM appointment;

-- 11)-     --

SELECT departmentId,
COUNT(*) AS doctor_count
FROM doctor
GROUP BY departmentId;


-- 12)-               --

SELECT AVG(YEAR(CURDATE()) - YEAR(TheBirthday))
FROM patients;



-- 13      --
SELECT MAX(appointmentDate)
from appointment;

-- 14                --

SELECT SUM(NBofAdmission) AS total_admissions
FROM admissionnew



SELECT * FROM admissionnew

alter TABLE admissionnew
add COLUMN NBofAdmission int DEFAULT 1;


--  16           --

SELECT * FROM patients
WHERE email is null or email = '';

-- 17       --
DELETE FROM appointment
WHERE appointmentDate < '2024-12-16'

SELECT * FROM appointment

-- 18  --

UPDATE departments
SET departmentName = 'Cancer Treatment'
WHERE departmentName = 'Oncology'

SELECT * FROM departments

--  19)-     --
SELECT gender, COUNT(*)
FROM patients
GROUP BY gender
HAVING COUNT(*) >= 2;

-- 20    --
/CREATE VIEW example as
SELECT * FROM admissionnew
WHERE dischargeDate is null OR dischargeDate > curdate();
SELECT *FROM example
