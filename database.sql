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
)

CREATE TABLE public.student (
	id serial NOT NULL PRIMARY KEY,
	account_number VARCHAR(20) NOT NULL,
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP NOT NULL
)

CREATE TABLE public.profesor (
	id serial NOT NULL PRIMARY KEY,
	identification_card VARCHAR(20) NOT NULL,
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP NOT NULL
)

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