-- Crea base de datos bdrh si no existe
CREATE DATABASE IF NOT EXISTS bdrh;

-- Usar base de datos creada 
USE bdrh;

-- Creación de tabla trabajos
CREATE TABLE trabajos (
 id_trabajo INT(11) NOT NULL,
 trabajo_nombre VARCHAR(35) NOT NULL,
 salario_min DECIMAL(10,2) NOT NULL,
salario_max DECIMAL(10,2) NOT NULL,
 PRIMARY KEY (id_trabajo))
ENGINE = InnoDB;

-- Creación de tabla regiones
CREATE TABLE regiones (
 id_region INT(11) NOT NULL,
 region_nombre VARCHAR(45) NOT NULL,
 PRIMARY KEY (id_region))
ENGINE = InnoDB;

-- Creación de tabla paises
CREATE TABLE paises (
 id_pais CHAR(2) NOT NULL,
 id_region INT(11) NOT NULL,
 pais_nombre VARCHAR(50) NOT NULL,
 PRIMARY KEY (id_pais),
 FOREIGN KEY (id_region) REFERENCES regiones (id_region)
 ON DELETE CASCADE
 ON UPDATE CASCADE)
ENGINE = InnoDB;

-- Creación de tabla ubicaciones
CREATE TABLE ubicaciones (
 id_ubicacion INT(11) NOT NULL,
 direccion VARCHAR(40) NOT NULL,
 codigo_postal VARCHAR(12) NULL,
 ciudad VARCHAR(30) NOT NULL,
 estado_provincia VARCHAR(25) NOT NULL,
 id_pais CHAR(2) NOT NULL,
 PRIMARY KEY (id_ubicacion),
 FOREIGN KEY (id_pais) REFERENCES paises (id_pais)
 ON DELETE CASCADE
 ON UPDATE CASCADE)
ENGINE = InnoDB;

-- Creación de tabla departamentos
CREATE TABLE departamentos (
 id_departamento INT(11) NOT NULL,
 departamento_nombre VARCHAR(30) NOT NULL,
 id_ubicacion INT(11) NOT NULL,
 PRIMARY KEY (id_departamento),
 FOREIGN KEY (id_ubicacion) REFERENCES ubicaciones (id_ubicacion)
 ON DELETE CASCADE
 ON UPDATE CASCADE)
ENGINE = InnoDB;

-- Creación de tabla empleados
CREATE TABLE empleados (
 id_empleado INT(11) NOT NULL,
 nombres VARCHAR(20) NOT NULL,
 apellidos VARCHAR(25) NOT NULL,
 email VARCHAR(100) NOT NULL,
 numero_telefono VARCHAR(20) NOT NULL,
 fecha_ingreso DATE NOT NULL,
 id_trabajo INT(11) NOT NULL,
 salario DECIMAL(10,2) NOT NULL,
 id_gerencia INT(11) NULL,
 id_departamento INT(11) NOT NULL,
 PRIMARY KEY (id_empleado),
 FOREIGN KEY (id_trabajo) REFERENCES trabajos (id_trabajo)
 ON DELETE CASCADE
 ON UPDATE CASCADE,
 FOREIGN KEY (id_departamento) REFERENCES departamentos (id_departamento)
 ON DELETE CASCADE
 ON UPDATE CASCADE,
 FOREIGN KEY (id_gerencia) REFERENCES empleados (id_empleado)
 ON DELETE CASCADE
 ON UPDATE CASCADE)
ENGINE = InnoDB;

-- Creación de tabla dependientes
CREATE TABLE dependientes (
 id_dependiente INT(11) NOT NULL,
 nombres VARCHAR(50) NOT NULL,
 apellidos VARCHAR(50) NOT NULL,
 vinculo VARCHAR(25) NOT NULL,
 id_empleado INT(11) NOT NULL,
 PRIMARY KEY (id_dependiente),
 FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado)
 ON DELETE CASCADE
 ON UPDATE CASCADE)
ENGINE = InnoDB;