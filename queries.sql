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