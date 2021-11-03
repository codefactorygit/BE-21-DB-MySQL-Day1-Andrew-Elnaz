-- Delete DB to restart
DROP DATABASE health_center;

-- create db
CREATE DATABASE health_center DEFAULT CHARACTER SET utf8;

-- "peripheral" tables without foreign keys first 
-- create tables
CREATE TABLE patients(
    patient_id int NOT null AUTO_INCREMENT,
    full_name varchar(55),
    ss_number int,
    birth_date date,
    PRIMARY KEY (patient_id)
);

CREATE TABLE doctors(
    doc_id int NOT null AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(55),
    specialty VARCHAR(55),
    status VARCHAR(55)
);

CREATE TABLE interventions(
    intervention_id int NOT null AUTO_INCREMENT PRIMARY KEY,
    treatment_type VARCHAR(55) NOT null,
    symptom_observed TEXT NOT null
);

CREATE TABLE units(
    unit_id int NOT null AUTO_INCREMENT PRIMARY KEY,
    unit_name VARCHAR(55) NOT null,
    floor int NOT null,
    fk_doc_id int,
    FOREIGN KEY (fk_doc_id) REFERENCES doctors(doc_id) ON DELETE SET NULL
);

CREATE TABLE unit_patient(
    rel_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fk_unit_id int NOT NULL,
    fk_patient_id int NOT NULL,
    FOREIGN KEY (fk_unit_id) REFERENCES units(unit_id) ON DELETE CASCADE,
    FOREIGN KEY (fk_patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);

CREATE TABLE intervention_details(
    rel_id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    date_prescribed date NOT NULL,
    fk_intervention_id int NOT NULL,
    fk_doc_id int NOT NULL,
    fk_patient_id int NOT NULL,
    FOREIGN KEY (fk_intervention_id) REFERENCES interventions (intervention_id) ON DELETE CASCADE,
    FOREIGN KEY (fk_doc_id) REFERENCES doctors (doc_id) ON DELETE CASCADE,
    FOREIGN KEY (fk_patient_id) REFERENCES patients (patient_id) ON DELETE CASCADE
);


-- ALTER TABLE DROP COLUMN move date_prescribed to intervention_details
ALTER TABLE interventions
DROP COLUMN symptom_observed;

ALTER TABLE intervention_details
ADD COLUMN symptom_observed varchar(55) NOT NULL;

-- Rename TABLES
-- ALTER TABLE doctor RENAME TO doctors;
-- ALTER TABLE intervention RENAME TO interventions;
-- ALTER TABLE patient RENAME TO patients;
-- ALTER TABLE unit RENAME TO units;


-- INSERT DATA into TABLES (manually)
-- patients
INSERT INTO patients (full_name, ss_number, birth_date) VALUES ('Ardie Savea', 0678, '1993-10-14');
INSERT INTO patients (full_name, ss_number, birth_date) VALUES ('Beauden Barret', 1015, '1991-05-27');
INSERT INTO patients (full_name, ss_number, birth_date) VALUES ('TJ Perenara', 0009, '1992-01-23');
INSERT INTO patients (full_name, ss_number, birth_date) VALUES ('Brodie Retallick', 0405, '1991-05-31');
INSERT INTO patients (full_name, ss_number, birth_date) VALUES ('Aaron Smith', 0900, '1988-11-21');
INSERT INTO patients (full_name, ss_number, birth_date) VALUES ('Sevu Reece', 1411, '1997-02-13');
INSERT INTO patients (full_name, ss_number, birth_date) VALUES ('Ethan Blackadder', 0607, '1995-03-22');

-- Doctors
INSERT INTO doctors (full_name, specialty, status) VALUES ('Dr Spok', 'Vulcan healing', 'Unit head');
INSERT INTO doctors (full_name, specialty, status) VALUES ('Dr Robotnik', 'Nephrologist', 'Unit head');
INSERT INTO doctors (full_name, specialty, status) VALUES ('Dr StrangeLove', 'Endocrinologist', 'Unit head');
INSERT INTO doctors (full_name, specialty, status) VALUES ('Dr DoLittle', 'Hematologist', 'Unit head');
INSERT INTO doctors (full_name, specialty, status) VALUES ('Dr Darling', 'Neurologist', 'Unit head');
INSERT INTO doctors (full_name, specialty, status) VALUES ('Dr Gerry', 'Physiotherapist', 'Unit head');
INSERT INTO doctors (full_name, specialty, status) VALUES ('John Doe MD', 'Junior Nephrologist', 'Junior doctor');
INSERT INTO doctors (full_name, specialty, status) VALUES ('Jane Doe MD', 'Junior Obstetrician', 'Junior doctor');


-- Interventions
INSERT INTO interventions (treatment_type) VALUES ('Kidney dialysis');
INSERT INTO interventions (treatment_type) VALUES ('Course of Iron Supplements');
INSERT INTO interventions (treatment_type) VALUES ('Hormone supplement therapy');
INSERT INTO interventions (treatment_type) VALUES ('Vulcan sleep grip');
INSERT INTO interventions (treatment_type) VALUES ('Melodic Intonation Therapy (MIT)');
INSERT INTO interventions (treatment_type) VALUES ('Physiotherapy');

-- Intervention_details
INSERT INTO intervention_details (date_prescribed, fk_intervention_id, fk_doc_id, fk_patient_id, symptom_observed) VALUES ('2021-03-06', 1, 2, 4, 'Kidney-stones');
INSERT INTO intervention_details (date_prescribed, fk_intervention_id, fk_doc_id, fk_patient_id, symptom_observed) VALUES ('2020-09-26', 2, 4, 3, 'Iron defficiency');
INSERT INTO intervention_details (date_prescribed, fk_intervention_id, fk_doc_id, fk_patient_id, symptom_observed) VALUES ('2021-11-16', 3, 3, 7, 'Hypothyroidism: Slow pulse, drowsiness');
INSERT INTO intervention_details (date_prescribed, fk_intervention_id, fk_doc_id, fk_patient_id, symptom_observed) VALUES ('2021-05-21', 4, 1, 5, 'Klingon mood swings');
INSERT INTO intervention_details (date_prescribed, fk_intervention_id, fk_doc_id, fk_patient_id, symptom_observed) VALUES ('2020-10-11', 5, 5, 4, 'Aphasia, stroke');
INSERT INTO intervention_details (date_prescribed, fk_intervention_id, fk_doc_id, fk_patient_id, symptom_observed) VALUES ('2020-10-11', 6, 6, 2, 'Strained groin (Röntgen)');
INSERT INTO intervention_details (date_prescribed, fk_intervention_id, fk_doc_id, fk_patient_id, symptom_observed) VALUES ('2021-10-11', 6, 6, 6, 'Iliacus Psoas (Röntgen)');

-- Units
INSERT INTO units (unit_name, floor, fk_doc_id) VALUES ('Physiotherapy', 0, 6);
INSERT INTO units (unit_name, floor, fk_doc_id) VALUES ('Neurology', 1, 5);
INSERT INTO units (unit_name, floor, fk_doc_id) VALUES ('Vulcan Healing', 2, 1);
INSERT INTO units (unit_name, floor, fk_doc_id) VALUES ('Endocrinology', 3, 3);
INSERT INTO units (unit_name, floor, fk_doc_id) VALUES ('Hematology', 4, 4);
INSERT INTO units (unit_name, floor, fk_doc_id) VALUES ('Nephrology', 5, 2);

--Unit_patient
INSERT INTO unit_patient (fk_unit_id, fk_patient_id) VALUES (1, 6);
INSERT INTO unit_patient (fk_unit_id, fk_patient_id) VALUES (1, 2);
INSERT INTO unit_patient (fk_unit_id, fk_patient_id) VALUES (2, 4);
INSERT INTO unit_patient (fk_unit_id, fk_patient_id) VALUES (3, 5);
INSERT INTO unit_patient (fk_unit_id, fk_patient_id) VALUES (4, 7);
INSERT INTO unit_patient (fk_unit_id, fk_patient_id) VALUES (5, 3);
INSERT INTO unit_patient (fk_unit_id, fk_patient_id) VALUES (6, 4);


-- DAY 2 Practice begins here (at 13:30 ;-))
-- Practice SQL COMMANDS (JOIN SUM COUNT)
-- JOINS
-- use join keyword to combine two or more tables
-- Goal: see what happens without ON condition
SELECT * 
FROM intervention_details
JOIN interventions;
-- Result: the whole interventions table gets combined with each row of intervention_details giving 7 x 6 = 42 rows

-- Goal: improve the last query to see details plus treatment types (N.B - this DB implies one treatment per symptom. Unrealistic!!)
SELECT *
FROM intervention_details
JOIN interventions
    ON intervention_details.fk_intervention_id = interventions.intervention_id;
-- Resullt is clear but repeats the column from ON condition

-- Goal: Refine the same query further to display more relevant info
SELECT intervention_details.fk_patient_id, intervention_details.fk_doc_id, intervention_details.symptom_observed, interventions.treatment_type, intervention_details.date_prescribed
FROM intervention_details
JOIN interventions
    ON intervention_details.fk_intervention_id = interventions.intervention_id; 

-- Goal stop violating the D-R-Y principle to make a more concise query
SELECT intervention_details.fk_patient_id, intervention_details.fk_doc_id, intervention_details.symptom_observed, interventions.treatment_type, intervention_details.date_prescribed
FROM intervention_details
JOIN interventions
    ON intervention_details.fk_intervention_id = interventions.intervention_id; 

-- Goal: display name of head doc next to unit info
SELECT unit_id, unit_name, doctors.full_name, doctors.specialty  
FROM units 
JOIN doctors on units.fk_doc_id = doctors.doc_id;


-- Goal: display all patients in physio
SELECT patients.full_name