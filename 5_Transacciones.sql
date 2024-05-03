USE bdrh;

-- A. Transacción con el comando INSERT:
START TRANSACTION;

INSERT INTO trabajos (id_trabajo, trabajo_nombre, salario_min, salario_max)
VALUES (7, 'Analista de Sistemas', 3500.00, 5000.00);

INSERT INTO trabajos (id_trabajo, trabajo_nombre, salario_min, salario_max)
VALUES (8, 'Técnico de Sistemas', 2500.00, 4000.00);

COMMIT;
SELECT * FROM trabajos WHERE id_trabajo IN (7, 8);


-- B. Transacción con el comando UPDATE:
START TRANSACTION;

UPDATE trabajos
SET salario_max = 6000.00
WHERE id_trabajo = 1;

UPDATE trabajos
SET salario_max = 4500.00
WHERE id_trabajo = 2;

ROLLBACK;

-- C. Transacción con el comando DELETE:
START TRANSACTION;

DELETE FROM trabajos
WHERE id_trabajo = 3;

DELETE FROM trabajos
WHERE id_trabajo = 4;

SAVEPOINT savepoint1;

UPDATE trabajos
SET salario_max = 5500.00
WHERE id_trabajo = 5;

ROLLBACK TO savepoint1;

COMMIT;