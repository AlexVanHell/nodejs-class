SELECT * FROM person;

SELECT * FROM student;

SELECT * FROM profesor;

SELECT p.id, s.id AS studentId, first_name, last_name, account_number
	FROM person AS p
	JOIN student AS s ON s.person_id = p.id;

SELECT p.id, prof.id AS profId, first_name, last_name, identification_card
	FROM person AS p
	INNER JOIN profesor AS prof ON prof.person_id = p.id;

SELECT p.id, s.id AS studentId, prof.id AS profId, first_name, last_name, account_number, identification_card
	FROM person AS p
	LEFT JOIN student AS s ON s.person_id = p.id
	LEFT JOIN profesor AS prof ON prof.person_id = p.id;

SELECT id, first_name, last_name
	FROM person
	WHERE id IN (
		SELECT person_id
			FROM student
	);

SELECT * FROM subject;

SELECT * FROM classroom;


SELECT p.id, prof.id AS profId, first_name, last_name, identification_card
	FROM person AS p
	LEFT JOIN profesor AS prof ON prof.person_id = p.id;

SELECT p.id, s.id AS studentId, first_name, last_name, account_number
	FROM person AS p
	LEFT JOIN student AS s ON s.person_id = p.id;

SELECT p.id, s.id AS studentId, first_name, last_name, account_number
	FROM student AS s
	RIGHT JOIN person AS p ON s.person_id = p.id;

SELECT p.id, s.id AS studentId, first_name, last_name, account_number
	FROM person AS p
	LEFT JOIN student AS s ON s.person_id = p.id
	WHERE s.id IS NULL;

SELECT p.id, s.id AS studentId, first_name, last_name, account_number
	FROM person AS p
	FULL OUTER JOIN student AS s ON s.person_id = p.id;

SELECT p.id, s.id AS studentId, first_name, last_name, account_number
	FROM person AS p
	INNER JOIN student AS s ON s.person_id = p.id;

SELECT p.id, s.id AS studentId, first_name, last_name, account_number
	FROM person AS p
	FULL OUTER JOIN student AS s ON s.person_id = p.id
	WHERE p.id IS NULL OR s.id IS NULL;

	-- Obtener los salones en los que da clase la persona con el id 4 (La persona 'Fulano 3')

SELECT c.id, c.key, c.name
	FROM classroom AS c
	INNER JOIN class_schedule AS cs ON cs.classroom_id = c.id
	INNER JOIN profesor AS prof ON prof.id = cs.profesor_id
	INNER JOIN person AS p ON prof.person_id = p.id
WHERE p.id = 4
GROUP BY c.id;