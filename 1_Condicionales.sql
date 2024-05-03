USE bdrh;

-- A. Listar nombre del departamento, dirección, ciudad de los departamentos ubicados en Colombia:
SELECT 
    d.departamento_nombre, u.direccion, u.ciudad
FROM
    departamentos d
        JOIN
    ubicaciones u ON d.id_ubicacion = u.id_ubicacion
        JOIN
    paises p ON u.id_pais = p.id_pais
WHERE
    p.pais_nombre = 'Colombia';

-- B. Listar nombres, apellidos, número telefónico, nombre del trabajo de los empleados del departamento de Ventas:
SELECT 
    e.nombres, e.apellidos, e.numero_telefono, t.trabajo_nombre
FROM
    empleados e
        JOIN
    trabajos t ON e.id_trabajo = t.id_trabajo
        JOIN
    departamentos d ON e.id_departamento = d.id_departamento
WHERE
    d.departamento_nombre = 'Ventas';

-- C. Listar Nombres, Apellidos y los años que llevan trabajando los empleados del departamento de Sistemas:
SELECT 
    nombres,
    apellidos,
    TIMESTAMPDIFF(YEAR,
        fecha_ingreso,
        CURDATE()) AS años_trabajando
FROM
    empleados
WHERE
    id_departamento = (SELECT 
            id_departamento
        FROM
            departamentos
        WHERE
            departamento_nombre = 'Sistemas');

-- D. Calcular el promedio de años que llevan trabajando los empleados del departamento de Marketing:
SELECT 
    AVG(TIMESTAMPDIFF(YEAR,
        fecha_ingreso,
        CURDATE())) AS promedio_años_trabajando
FROM
    empleados
WHERE
    id_departamento = (SELECT 
            id_departamento
        FROM
            departamentos
        WHERE
            departamento_nombre = 'Marketing');

-- E. Listar los empleados que trabajen en la ciudad de 'Bogotá':
SELECT 
    *
FROM
    empleados e
        JOIN
    ubicaciones u ON e.id_departamento = u.id_ubicacion
WHERE
    u.ciudad = 'Bogotá';

-- F. Listar las ubicaciones de la región 'América del Sur':
SELECT 
    u.*
FROM
    ubicaciones u
        JOIN
    paises p ON u.id_pais = p.id_pais
        JOIN
    regiones r ON p.id_region = r.id_region
WHERE
    r.region_nombre = 'América del Sur';

-- G. Listar los trabajos del departamento específico 'Contabilidad':
SELECT 
    t.*
FROM
    trabajos t
        JOIN
    empleados e ON t.id_trabajo = e.id_trabajo
        JOIN
    departamentos d ON e.id_departamento = d.id_departamento
WHERE
    d.departamento_nombre = 'Contabilidad';