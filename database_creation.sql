CREATE TABLE departments (
    departmentsId INT AUTO_INCREMENT PRIMARY KEY,
    departmentName VARCHAR(200),
    location VARCHAR(200)
);

CREATE TABLE medications (
    medicationsId INT AUTO_INCREMENT PRIMARY KEY,
    medicationName VARCHAR(200),
    dosage VARCHAR(200)
);

CREATE TABLE patients (
    PatientId INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    gender VARCHAR(10) CHECK (gender IN ('female', 'male')),
    TheBirthday DATE,
    phoneNumber VARCHAR(20) NOT NULL,
    email VARCHAR(30) NOT NULL,
    address VARCHAR(200) NOT NULL
);

CREATE TABLE rooms (
    roomNumber VARCHAR(20),
    roomId INT AUTO_INCREMENT PRIMARY KEY,
    roomType VARCHAR(50) CHECK (roomType IN ('private', 'general', 'ICU')),
    availability TINYINT(1)
);

CREATE TABLE doctor (
    doctorId INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    phoneNumber VARCHAR(20) NOT NULL,
    email VARCHAR(30) NOT NULL,
    specialization VARCHAR(200) NOT NULL,
    departmentId INT,  
    FOREIGN KEY (departmentId) REFERENCES departments(departmentsId)
);

CREATE TABLE appointment (
    appointmentId INT AUTO_INCREMENT PRIMARY KEY,
    appointmentDate DATE,
    appointmentTime TIME,
    patientId INT NOT NULL,
    doctorId INT NOT NULL,
    reason VARCHAR(200),
    FOREIGN KEY (patientId) REFERENCES patients(PatientId),
    FOREIGN KEY (doctorId) REFERENCES doctor(doctorId)
);

CREATE TABLE prescriptions (
    prescriptionsId INT AUTO_INCREMENT PRIMARY KEY,
    prescriptionsDate DATE,
    medicationId INT NOT NULL,  
    patientId INT NOT NULL,
    doctorId INT NOT NULL,
    dosageInstruction VARCHAR(200),
    FOREIGN KEY (patientId) REFERENCES patients(PatientId),
    FOREIGN KEY (doctorId) REFERENCES doctor(doctorId),
    FOREIGN KEY (medicationId) REFERENCES medications(medicationsId)
);

CREATE TABLE admissionNew (
    admissionId INT AUTO_INCREMENT PRIMARY KEY,
    PatientId INT,
    roomId INT,
    admissionDate DATE,
    dischargeDate DATE,
    FOREIGN KEY (PatientId) REFERENCES patients(PatientId),
    FOREIGN KEY (roomId) REFERENCES rooms(roomId)
);

CREATE TABLE staff (
    staffId INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    phoneNumber VARCHAR(20) NOT NULL,
    email VARCHAR(30) NOT NULL,
    jobTitle VARCHAR(200) NOT NULL,
    departmentId INT,  
    FOREIGN KEY (departmentId) REFERENCES departments(departmentsId)
);