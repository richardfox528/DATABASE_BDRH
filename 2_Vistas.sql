USE bdrh;

-- A. Vista que permita listar los países de la región América del Sur:
CREATE VIEW vista_paises_america_sur AS
    SELECT 
        p.id_pais, p.pais_nombre
    FROM
        paises p
            JOIN
        regiones r ON p.id_region = r.id_region
    WHERE
        r.region_nombre = 'América del Sur';

SELECT * FROM Vista_paises_america_sur;

-- B. Vista que permita listar los empleados y sus dependientes:
CREATE VIEW vista_empleados_dependientes AS
    SELECT 
        e.id_empleado,
        e.nombres,
        e.apellidos,
        d.nombres AS nombres_dependiente,
        d.apellidos AS apellidos_dependiente,
        d.vinculo
    FROM
        empleados e
            LEFT JOIN
        dependientes d ON e.id_empleado = d.id_empleado;

SELECT * FROM vista_empleados_dependientes;

-- C. Vista que permita listar los empleados del departamento de Ventas:
CREATE VIEW vista_empleados_departamento_ventas AS
    SELECT 
        e.id_empleado,
        e.nombres,
        e.apellidos,
        e.email,
        e.numero_telefono,
        e.fecha_ingreso,
        t.trabajo_nombre,
        e.salario
    FROM
        empleados e
            JOIN
        departamentos d ON e.id_departamento = d.id_departamento
            JOIN
        trabajos t ON e.id_trabajo = t.id_trabajo
    WHERE
        d.departamento_nombre = 'Ventas';

SELECT * FROM vista_empleados_departamento_ventas;

-- D. Vista que permita listar los empleados y sus trabajos:
CREATE VIEW vista_empleados_trabajos AS
    SELECT 
        e.id_empleado,
        e.nombres,
        e.apellidos,
        t.trabajo_nombre,
        t.salario_min,
        t.salario_max
    FROM
        empleados e
            JOIN
        trabajos t ON e.id_trabajo = t.id_trabajo;

SELECT * FROM vista_empleados_trabajos;