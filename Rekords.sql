USE bdrh;

-- Insertar datos en la tabla "trabajos"
INSERT INTO trabajos (id_trabajo, trabajo_nombre, salario_min, salario_max) VALUES
(1, 'Gerente', 5000.00, 10000.00),
(2, 'Analista', 3000.00, 6000.00),
(3, 'Desarrollador', 2500.00, 5000.00),
(4, 'Asistente', 1500.00, 3000.00),
(5, 'Contador', 2800.00, 5500.00),
(6, 'Recursos Humanos', 2200.00, 4500.00);

-- Insertar datos en la tabla "regiones"
INSERT INTO regiones (id_region, region_nombre) VALUES
(1, 'América del Norte'),
(2, 'América del Sur'),
(3, 'Europa'),
(4, 'Asia'),
(5, 'África'),
(6, 'Oceanía');

-- Insertar datos en la tabla "paises"
INSERT INTO paises (id_pais, id_region, pais_nombre) VALUES
('US', 1, 'Estados Unidos'),
('CA', 1, 'Canadá'),
('MX', 1, 'México'),
('BR', 2, 'Brasil'),
('AR', 2, 'Argentina'),
('CO', 2, 'Colombia');

-- Insertar datos en la tabla "ubicaciones"
INSERT INTO ubicaciones (id_ubicacion, direccion, codigo_postal, ciudad, estado_provincia, id_pais) VALUES
(1, 'Calle 123, Edificio A', '12345', 'Nueva York', 'Nueva York', 'US'),
(2, 'Avenida 456, Piso 7', '67890', 'Toronto', 'Ontario', 'CA'),
(3, 'Carrera 789, Apartamento 3', '54321', 'Ciudad de México', 'Ciudad de México', 'MX'),
(4, 'Rua 159, Bloque B', '98765', 'São Paulo', 'São Paulo', 'BR'),
(5, 'Avenida 753, Oficina 2', '24680', 'Buenos Aires', 'Buenos Aires', 'AR'),
(6, 'Calle 951, Edificio C', '13579', 'Bogotá', 'Cundinamarca', 'CO');

-- Insertar datos en la tabla "departamentos"
INSERT INTO departamentos (id_departamento, departamento_nombre, id_ubicacion) VALUES
(1, 'Administración', 1),
(2, 'Marketing', 2),
(3, 'Tecnología', 3),
(4, 'Sistemas', 4),
(5, 'Contabilidad', 5),
(6, 'Ventas', 6);

-- Insertar datos en la tabla "empleados"
INSERT INTO empleados (id_empleado, nombres, apellidos, email, numero_telefono, fecha_ingreso, id_trabajo, salario, id_gerencia, id_departamento) VALUES
(1, 'Juan Felipe', 'Claros Quintero', 'juan.claros@unad.com', '123456789', '2020-01-01', 1, 8000.00, NULL, 1),
(2, 'Javier', 'Fiesco Hoyos', 'javier.fiesco@unad.com', '987654321', '2021-03-15', 2, 4500.00, 1, 2),
(3, 'Jhunier Libardo', 'Hernandez Calderon', 'jhunier.hernandez@unad.com', '456789123', '2022-06-01', 3, 3800.00, 2, 3),
(4, 'Deyver Fernando', 'Montiel Olarte', 'deyver.montiel@unad.com', '789123456', '2019-09-01', 4, 2200.00, 1, 4),
(5, 'Ricardo', 'Muñoz Hoyos', 'ricardo.munoz@unad.com', '321654987', '2018-11-15', 5, 4000.00, 1, 5),
(6, 'Liseth', 'Vargas Amado', 'liseth.vargas@unad.com', '159753852', '2021-02-01', 6, 3500.00, 1, 6);

-- Insertar datos en la tabla "dependientes"
INSERT INTO dependientes (id_dependiente, nombres, apellidos, vinculo, id_empleado) VALUES
(1, 'María', 'Samboni Díaz', 'Esposa', 1),
(2, 'Sofía', 'Fiesco Beltran', 'Hija', 2),
(3, 'Juliana', 'Hernandez Casali', 'Hija', 3),
(4, 'Camila', 'Montiel Benitez', 'Hija', 4),
(5, 'Elaine', 'Muñoz Brown', 'Hija', 5),
(6, 'Eduardo', 'Reyes La Torre', 'Esposo', 6);