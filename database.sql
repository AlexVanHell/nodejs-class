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