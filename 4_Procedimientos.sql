USE bdrh;

-- A. Procedimiento almacenado que liste los países de cualquier región seleccionada:
DELIMITER //
CREATE PROCEDURE listar_paises_region
(IN region_nombre VARCHAR(25))
BEGIN
    SELECT p.id_pais, p.pais_nombre
    FROM paises p
    JOIN regiones r ON p.id_region = r.id_region
    WHERE r.region_nombre = region_nombre;
END //
DELIMITER ;

-- Eliminar lista de procedimientos
DROP PROCEDURE IF EXISTS listar_paises_region;
-- Consultar lista
CALL listar_paises_region('América del sur');
CALL listar_paises_region('América del norte');


-- B. Procedimiento almacenado que liste los departamentos de cualquier ubicación seleccionada:
DELIMITER //
CREATE PROCEDURE listar_departamentos_ubicacion
(IN id_ubicacion INT)
BEGIN
    SELECT d.id_departamento, d.departamento_nombre
    FROM departamentos d
    WHERE d.id_ubicacion = id_ubicacion;
END //
DELIMITER ;

-- Eliminar lista de procedimientos
DROP PROCEDURE IF EXISTS listar_departamentos_ubicacion;
-- Consultar lista
CALL listar_departamentos_ubicacion(2);
CALL listar_departamentos_ubicacion(3);


-- C. Procedimiento almacenado que obtenga los datos de los empleados por país:
DELIMITER //
CREATE PROCEDURE obtener_datos_empleados_pais
(IN pais_nombre VARCHAR(25))
BEGIN
    SELECT e.id_empleado, e.nombres, e.apellidos, e.email, e.numero_telefono, e.fecha_ingreso, e.salario, e.id_trabajo, t.trabajo_nombre
    FROM empleados e
    JOIN trabajos t ON e.id_trabajo = t.id_trabajo
    JOIN departamentos d ON e.id_departamento = d.id_departamento
    JOIN ubicaciones u ON d.id_ubicacion = u.id_ubicacion
    JOIN paises p ON u.id_pais = p.id_pais
    WHERE p.pais_nombre = pais_nombre;
END //
DELIMITER ;

-- Eliminar lista de procedimientos
DROP PROCEDURE IF EXISTS obtener_datos_empleados_pais;
-- Consultar lista
CALL obtener_datos_empleados_pais('Brasil');


-- D. Procedimiento almacenado que obtenga el salario de un empleado de un departamento:
DELIMITER //
CREATE PROCEDURE obtener_salario_empleado_departamento
(IN departamento_nombre VARCHAR(25), IN id_empleado INT)
BEGIN
    SELECT e.salario, e.nombres, e.apellidos
    FROM empleados e
    JOIN departamentos d ON e.id_departamento = d.id_departamento
    WHERE d.departamento_nombre = departamento_nombre AND e.id_empleado = id_empleado;
END //
DELIMITER ;

-- Eliminar lista de procedimientos
DROP PROCEDURE IF EXISTS obtener_salario_empleado_departamento;
-- Consultar lista
CALL obtener_salario_empleado_departamento('Sistemas', 4);


-- E. Procedimiento que recupere dirección, ciudad, estado de una ubicación:
DELIMITER //
CREATE PROCEDURE obtener_datos_ubicacion
(IN id_ubicacion INT)
BEGIN
    SELECT u.direccion, u.ciudad, u.estado_provincia, u.id_pais
    FROM ubicaciones u
    WHERE u.id_ubicacion = id_ubicacion;
END //
DELIMITER ;

-- Eliminar lista de procedimientos
DROP PROCEDURE IF EXISTS obtener_datos_ubicacion;
-- Consultar lista
CALL obtener_datos_ubicacion(2);


-- F. Procedimiento en el que pasaremos como parámetro el Apellido de un empleado:
DELIMITER //
CREATE PROCEDURE obtener_dependientes_empleado
(IN apellidos_empleado VARCHAR(25))
BEGIN
    SELECT d.nombres, d.apellidos, d.vinculo
    FROM dependientes d
    JOIN empleados e ON d.id_empleado = e.id_empleado
    WHERE e.apellidos = apellidos_empleado;
END //
DELIMITER ;

-- Eliminar lista de procedimientos
DROP PROCEDURE IF EXISTS obtener_dependientes_empleado;
-- Consultar lista
CALL obtener_dependientes_empleado('Muñoz Hoyos');