USE bdrh;

-- A. Trigger para la inserción de ubicaciones:
DELIMITER //
CREATE TRIGGER insert_ubicaciones
AFTER INSERT ON ubicaciones
FOR EACH ROW
BEGIN
    UPDATE paises
    SET paises.id_region = (SELECT id_region FROM paises WHERE paises.id_pais = NEW.id_pais)
    WHERE paises.id_pais = NEW.id_pais;
END //
DELIMITER ;

-- Eliminar trigger
DROP TRIGGER bdrh.insert_ubicaciones;
-- Mostrar trigger
SHOW CREATE TRIGGER bdrh.insert_ubicaciones;


-- B. Trigger para la modificación de paises:
DELIMITER //
CREATE TRIGGER update_paises
AFTER UPDATE ON paises
FOR EACH ROW
BEGIN
    UPDATE ubicaciones
    SET ubicaciones.id_region = NEW.id_region
    WHERE ubicaciones.id_pais = NEW.id_pais;
END //
DELIMITER ;

-- Eliminar trigger
DROP TRIGGER bdrh.update_paises;
-- Mostrar trigger
SHOW CREATE TRIGGER bdrh.update_paises;


-- C. Trigger para la eliminación de regiones:
DELIMITER //
CREATE TRIGGER delete_regiones
AFTER DELETE ON regiones
FOR EACH ROW
BEGIN
    DELETE FROM paises
    WHERE paises.id_region = OLD.id_region;
END //
DELIMITER ;

-- Eliminar trigger
DROP TRIGGER bdrh.delete_regiones;
-- Mostrar trigger
SHOW CREATE TRIGGER bdrh.delete_regiones;


-- D. Trigger para la inserción de departamentos:
DELIMITER //
CREATE TRIGGER insert_departamentos
AFTER INSERT ON departamentos
FOR EACH ROW
BEGIN
    UPDATE empleados
    SET empleados.id_departamento = NEW.id_departamento
    WHERE empleados.id_departamento = NEW.id_departamento;
END //
DELIMITER ;

-- Eliminar trigger
DROP TRIGGER bdrh.insert_departamentos;
-- Mostrar trigger
SHOW CREATE TRIGGER bdrh.insert_departamentos;


-- E. Trigger para la modificación de dependientes:
DELIMITER //
CREATE TRIGGER update_dependientes
AFTER UPDATE ON dependientes
FOR EACH ROW
BEGIN
    UPDATE empleados
    SET empleados.id_dependiente = NEW.id_dependiente
    WHERE empleados.id_empleado = NEW.id_empleado;
END //
DELIMITER ;

-- Eliminar trigger
DROP TRIGGER bdrh.update_dependientes;
-- Mostrar trigger
SHOW CREATE TRIGGER bdrh.update_dependientes;


-- F. Trigger para la eliminación de trabajos:
DELIMITER //
CREATE TRIGGER delete_trabajos
AFTER DELETE ON trabajos
FOR EACH ROW
BEGIN
    DELETE FROM empleados
    WHERE empleados.id_trabajo = OLD.id_trabajo;
END //
DELIMITER ;

-- Eliminar trigger
DROP TRIGGER bdrh.delete_trabajos;
-- Mostrar trigger
SHOW CREATE TRIGGER bdrh.delete_trabajos;

SHOW triggers;