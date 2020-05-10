CREATE DATABASE node_class_db_villa
    WITH
    OWNER = postgres
ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

CREATE TABLE public.person (
  id serial NOT NULL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  second_last_name VARCHAR(50) NOT NULL,
  birth_date DATE,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(50) NOT NULL,
  phone_number VARCHAR(20),
  verified BOOLEAN NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE TABLE public.student (
  id serial NOT NULL PRIMARY KEY,
  account_number VARCHAR(20) NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE TABLE public.profesor (
  id serial NOT NULL PRIMARY KEY,
  identification_card VARCHAR(20) NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

ALTER TABLE public.student
ADD COLUMN person_id bigint NOT NULL;

ALTER TABLE public.profesor
ADD COLUMN person_id bigint NOT NULL;

ALTER TABLE public.student
ADD CONSTRAINT fk_student_person
FOREIGN KEY (person_id)
REFERENCES person(id)
ON DELETE CASCADE;

ALTER TABLE public.profesor
ADD CONSTRAINT fk_profesor_person
FOREIGN KEY (person_id)
REFERENCES person(id)
ON DELETE CASCADE;

INSERT INTO person (
  first_name, last_name, second_last_name, birth_date, email, password, phone_number, verified, created_at, updated_at
) VALUES (
  'Alejandro', 'Villarroel', '', '1997-01-09', 'alejandrodnl.cv@hotmail.com', 'hola123', '1234567890', true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

INSERT INTO student (
	person_id, account_number, created_at, updated_at
) VALUES (
	1, '419078027', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

INSERT INTO person (
  first_name, last_name, second_last_name, birth_date, email, password, phone_number, verified, created_at, updated_at
) VALUES (
  'Federico', 'Bahena', '', '1965-01-01', 'prof.bahena@mail.com', 'hola123', '1234567890', true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

INSERT INTO profesor (
	person_id, identification_card, created_at, updated_at
) VALUES (
	2, 'PROFBAH1234', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

UPDATE person SET
	first_name = 'Alejandro Daniel'
WHERE id = 1;

CREATE TABLE public.subject (
  id serial NOT NULL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  key VARCHAR(10) NOT NULL,
  level int NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE TABLE public.classroom (
  id serial NOT NULL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  key VARCHAR(10) NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE TABLE public.class_schedule (
  id serial NOT NULL,
  subject_id bigint NOT NULL,
  classroom_id bigint NOT NULL,
  profesor_id bigint NOT NULL,
  week_day smallint NOT NULL,
  start_time time NOT NULL,
  end_time time NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (subject_id) REFERENCES subject (id) ON DELETE CASCADE,
  FOREIGN KEY (classroom_id) REFERENCES classroom (id) ON DELETE CASCADE,
  FOREIGN KEY (profesor_id) REFERENCES profesor (id) ON DELETE CASCADE
);

INSERT INTO public.subject(
	name, key, level, created_at, updated_at
)
VALUES (
	'Calculo I', 'CAL1', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'Albegra Superior', 'ALG1', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'Programación I', 'PRO1', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'Lógica Matemática', 'LOG1', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'Solución Algorítmica de Problemas', 'SOL1', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'Organización de Computadoras', 'ORG1', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

INSERT INTO public.subject(
	name, key, level, created_at, updated_at
)
VALUES (
	'Calculo II', 'CAL2', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'Albegra Lineal', 'ALG2', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'Programación II', 'PRO2', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'Inglés I', 'ING1', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'Geometría del Espacio', 'GEO1', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'Redes de Computo', 'RED1', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

INSERT INTO public.classroom(
	name, key, created_at, updated_at
) VALUES (
	'A401', 'A401', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'A402', 'A402', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'A403', 'A403', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'A404', 'A404', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'A405', 'A405', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'A411', 'A411', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'A412', 'A412', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'A413', 'A413', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'A414', 'A414', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'A415', 'A415', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'A416', 'A416', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'A421', 'A421', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'A422', 'A422', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'A423', 'A423', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'A424', 'A424', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'A425', 'A425', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	'A426', 'A426', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

UPDATE classroom SET
	key = name;

DELETE FROM person
WHERE id IN (
	SELECT p.id
		FROM person AS p
		INNER JOIN profesor AS prof ON prof.person_id = p.id
);

ALTER SEQUENCE person_id_seq RESTART WITH 2;
ALTER SEQUENCE profesor_id_seq RESTART WITH 1;

INSERT INTO public.person (
	first_name, last_name, second_last_name, birth_date, email, password, phone_number, verified, created_at, updated_at)
VALUES (
	'Mario', 'Sanchez', '', null, 'prof.msanchez@mail.com', 'hola123', '123456789', true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

INSERT INTO public.profesor (
	identification_card, created_at, updated_at, person_id
)
SELECT 'MSD123456789', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, currval('person_id_seq');

UPDATE person SET first_name = 'Fulano 1', last_name = 'Perez' WHERE id = 2;
UPDATE profesor SET identification_card = 'FUL1' WHERE id = 1;

INSERT INTO public.person (
	first_name, last_name, second_last_name, birth_date, email, password, phone_number, verified, created_at, updated_at)
VALUES (
	'Fulano 2', 'Sanchez', '', null, 'fulano2.prof@mail.com', 'hola123', '123456789', true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

INSERT INTO public.profesor (
	identification_card, created_at, updated_at, person_id
)
SELECT 'FUL2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, currval('person_id_seq');

INSERT INTO public.person (
	first_name, last_name, second_last_name, birth_date, email, password, phone_number, verified, created_at, updated_at)
VALUES (
	'Fulano 3', 'Sanchez', '', null, 'fulano2.prof@mail.com', 'hola123', '123456789', true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

INSERT INTO public.profesor (
	identification_card, created_at, updated_at, person_id
)
SELECT 'FUL3', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, currval('person_id_seq');

INSERT INTO public.person (
	first_name, last_name, second_last_name, birth_date, email, password, phone_number, verified, created_at, updated_at)
VALUES (
	'Fulano 4', 'Sanchez', '', null, 'fulano2.prof@mail.com', 'hola123', '123456789', true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

INSERT INTO public.profesor (
	identification_card, created_at, updated_at, person_id
)
SELECT 'FUL4', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, currval('person_id_seq');

INSERT INTO public.person (
	first_name, last_name, second_last_name, birth_date, email, password, phone_number, verified, created_at, updated_at)
VALUES (
	'Fulano 5', 'Sanchez', '', null, 'fulano2.prof@mail.com', 'hola123', '123456789', true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

INSERT INTO public.profesor (
	identification_card, created_at, updated_at, person_id
)
SELECT 'FUL5', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, currval('person_id_seq');

INSERT INTO public.person (
	first_name, last_name, second_last_name, birth_date, email, password, phone_number, verified, created_at, updated_at)
VALUES (
	'Fulano 6', 'Sanchez', '', null, 'fulano2.prof@mail.com', 'hola123', '123456789', true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

INSERT INTO public.profesor (
	identification_card, created_at, updated_at, person_id
)
SELECT 'FUL6', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, currval('person_id_seq');

UPDATE person SET email = 'fulano3.prof@mail.com' WHERE id = 4;
UPDATE person SET email = 'fulano4.prof@mail.com' WHERE id = 5;
UPDATE person SET email = 'fulano5.prof@mail.com' WHERE id = 6;
UPDATE person SET email = 'fulano6.prof@mail.com' WHERE id = 7;

INSERT INTO class_schedule	(
	subject_id, classroom_id, profesor_id, week_day, start_time, end_time, created_at, updated_at
) VALUES
--Prof 1
(
	1, 17, 1, 1, '18:00', '20:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	1, 17, 1, 3, '18:00', '20:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	1, 17, 1, 5, '18:00', '20:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	4, 13, 1, 2, '14:00', '16:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	4, 13, 1, 4, '14:00', '16:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
),

--Prof 2
(
	2, 15, 4, 1, '16:00', '18:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	2, 15, 4, 3, '16:00', '18:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	2, 15, 4, 5, '16:00', '18:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	5, 16, 4, 2, '20:00', '22:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	5, 16, 4, 4, '20:00', '22:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
),

--Prof 3
(
	3, 14, 5, 1, '20:00', '22:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	3, 12, 5, 3, '20:00', '22:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	3, 14, 5, 5, '20:00', '22:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	6, 14, 5, 2, '18:00', '20:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	6, 14, 5, 4, '18:00', '20:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
),

--Prof 4
(
	7, 1, 6, 1, '18:00', '20:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	7, 1, 6, 3, '18:00', '20:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	7, 1, 6, 5, '18:00', '20:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	11, 2, 6, 2, '14:00', '16:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	11, 2, 6, 4, '14:00', '16:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
),

--Prof 5
(
	8, 4, 7, 1, '16:00', '18:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	8, 4, 7, 3, '16:00', '18:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	8, 4, 7, 5, '16:00', '18:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	10, 5, 7, 2, '20:00', '22:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	10, 5, 7, 4, '20:00', '22:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
),

--Prof 6
(
	9, 3, 8, 1, '20:00', '22:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	9, 3, 8, 3, '20:00', '22:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	9, 12, 8, 5, '20:00', '22:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	12, 12, 8, 2, '18:00', '20:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
), (
	12, 3, 8, 4, '18:00', '20:00', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);