-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center


CREATE TABLE  patients
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    dob DATE NOT NULL,
    is_diabetic BOOLEAN NOT NULL DEFAULT FALSE,
    complaint TEXT NOT NULL
);

CREATE TABLE doctors 
(id SERIAL PRIMARY KEY,
prefix TEXT DEFAULT 'dr.',
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,  
dr_type TEXT NOT NULL,
specialty TEXT NOT NULL
);

CREATE TABLE diseases
(id SERIAL PRIMARY KEY,
disease_name TEXT NOT NULL,
treatments TEXT NOT NULL
);

CREATE TABLE visits
(id SERIAL PRIMARY KEY,
patient_id INTEGER REFERENCES patients(id),
doctor_id INTEGER REFERENCES doctors(id),
date DATE NOT NULL
);

CREATE TABLE diagnosis 
( id SERIAL PRIMARY KEY,
visit_id INTEGER REFERENCES visits(id),
disease_id  INTEGER REFERENCES diseases(id),
treatment TEXT NOT NULL
);



INSERT INTO patients
(first_name, last_name, dob, is_diabetic, complaint)
VALUES
('jane', 'yanger', '2000-10-5', TRUE, 'chest pain after eating spicy chicken wings'),
('kelly', 'yantz', '1950-8-12', FALSE, 'constanly tired, cries intermitanly, no apetite'),
('carl', 'millen', '1987-01-4', FALSE, 'sever sore throat, high fever, incessant couching');

INSERT INTO  doctors
(first_name, last_name, dr_type, specialty)
VALUES
('fernanda', 'castellanos', 'ear nose throat', 'tonsils'),
('victor', 'frankenstein', 'internal medicine', 'regenerative therapy'),
('mabel', 'zeilman', 'psychology', 'clinical depression');

INSERT INTO  diseases
(disease_name, treatments)
VALUES
('Streptococcus ', 'antibiotics'),
('heartburn', 'antacids'),
('depression', 'anti depressants');

INSERT INTO visits
(patient_id, doctor_id, date)
VALUES
(1,2, '2020-05-10'),
(2, 3, '2018-01-22'),
(3, 1, '2022-08-01');

INSERT INTO diagnosis
(visit_id, disease_id, treatment)
VALUES
(1, 2, 'zantac'),
(2, 3, 'paxil'),
(3, 1, 'penecilin');

