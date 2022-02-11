-- Giuste: 2, 3, 5, 8
Indicare le query che possono essere eseguite sulla tabella seguente (in assenza di indici).

	CREATE TABLE students_by_exam ( 
	  student_id int, 
	  student_name text,
	  exam_name text, 
	  grade int,
	  PRIMARY KEY ((exam_name), grade, student_id) 
	) 
	WITH CLUSTERING 
	ORDER BY (grade DESC, student_id ASC );

	-- OPZIONE 1
	SELECT *
	FROM students_by_exam
	WHERE grade > 6;

	-- OPZIONE 2
	SELECT *
	FROM students_by_exam
	WHERE exam_name = 'NoSQL';

	-- OPZIONE 3
	SELECT *
	FROM students_by_exam
	WHERE exam_name = 'NoSQL' AND grade > 6;

	-- OPZIONE 4
	SELECT *
	FROM students_by_exam
	WHERE student_name = 'Bob';

	-- OPZIONE 5
	SELECT *
	FROM students_by_exam
	WHERE exam_name = 'NoSQL' AND grade > 6 
	AND student_id = 4815;

	-- OPZIONE 6
	SELECT *
	FROM students_by_exam
	WHERE exam_name = 'NoSQL' AND grade > 6 
	AND student_id = 4815 AND student_name = 'Bob';

	-- OPZIONE 7
	SELECT *
	FROM students_by_exam
	WHERE exam_name > 'NoSQL';

	-- OPZIONE 8
	SELECT *
	FROM students_by_exam
	WHERE exam_name = 'NoSQL' AND grade = 6;


-- Giuste: 8, 9
Data la query seguente e la struttura di base della tabella, individuare i diversi modi di impostare la chiave primaria che supportano la query indicata e che memorizzano correttamente i film (cioè, una riga per ogni film). (Nota: la clausola 'WITH CLUSTERING ORDER BY' è ignorata per semplicità.)

	SELECT * FROM movies WHERE year = 2010 AND actor = 'Tom Hanks';
	
	CREATE TABLE movies ( 
	  movie_id uuid, 
	  year int, 
	  actor text, 
	  PRIMARY KEY ( ??? ) 
	) 

	-- OPZIONE 1
	PRIMARY KEY (movie_id)

	-- OPZIONE 2
	PRIMARY KEY (movie_id, year, actor)

	-- OPZIONE 3
	PRIMARY KEY ((movie_id), year, actor)

	-- OPZIONE 4
	PRIMARY KEY ((movie_id, year, actor))

	-- OPZIONE 5
	PRIMARY KEY (year)

	-- OPZIONE 6
	PRIMARY KEY ((year, actor))

	-- OPZIONE 7
	PRIMARY KEY ((year), actor)

	-- OPZIONE 8
	PRIMARY KEY ((year), actor, movie_id)

	-- OPZIONE 9
	PRIMARY KEY ((year, actor), movie_id)

	-- OPZIONE 10
	PRIMARY KEY ((year, actor, movie_id))