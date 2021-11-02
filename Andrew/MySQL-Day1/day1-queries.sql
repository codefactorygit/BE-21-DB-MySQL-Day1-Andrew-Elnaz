-- create db
CREATE DATABASE health_center DEFAULT CHARACTER SET utf8;

-- create tables
-- "peripheral" tables without foreign keys  
CREATE TABLE patient(
    patient_id int NOT null AUTO_INCREMENT,
    patient_name varchar(55),
    ss_number int,
    birth_date date,
    PRIMARY KEY (patient_id)
);

CREATE TABLE head_doctor(
    doc_id int NOT null AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(55),
    specialty VARCHAR(55)
);

CREATE TABLE intervention(
    intervention_id int NOT null AUTO_INCREMENT PRIMARY KEY,
    treatment VARCHAR(55) NOT null,
    symptom_observed TEXT NOT null,
    date_prescribed date NOT NULL
);

-- create tables with foreign keys
CREATE TABLE unit(
    unit_id int NOT null AUTO_INCREMENT PRIMARY KEY,
    fk_doc_id int,
    unit_name VARCHAR(55) NOT null,
    floor int NOT null,
    FOREIGN KEY (fk_doc_id) REFERENCES head_doctor(doc_id)
);

CREATE TABLE unit_patient(
    rel_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fk_unit_id int NOT NULL,
    fk_patient_id int NOT NULL,
    FOREIGN KEY (fk_unit_id) REFERENCES unit(unit_id),
    FOREIGN KEY (fk_patient_id) REFERENCES patient(patient_id)
);

CREATE TABLE intervention_details(
    rel_id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    fk_intervention_id int NOT NULL,
    fk_doc_id int NOT NULL,
    fk_patient_id int NOT NULL,
    FOREIGN KEY (fk_intervention_id) REFERENCES intervention (intervention_id),
    FOREIGN KEY (fk_doc_id) REFERENCES head_doctor  (doc_id),
    FOREIGN KEY (fk_patient_id) REFERENCES patient (patient_id) 
);

-- INSERT DATA into TABLE (manually)
INSERT INTO patient VALUES ('Ardie Savea', 3435, '1987-12-16');