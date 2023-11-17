-- Insertar datos en la tabla caps
INSERT INTO caps (cod_hospital, num_caps, nombre_caps, direccion_caps, telefono_caps, dni_director) VALUES
(1, 1, 'CAPS A', 'Calle 123', 123456, '12345678'),
(1, 2, 'CAPS B', 'Calle 456', 789012, '87654321'),
(2, 1, 'CAPS C', 'Calle 789', 345678, '11111111');

-- Insertar datos en la tabla dosis
INSERT INTO dosis (cod_dosis, descripcion_dosis) VALUES
(1, '1°dosis'),
(2, '2°dosis'),
(3, '3°dosis'),
(4, '4° dosis'),
(5, '1°refuerzo'),
(6, '2°refuerzo'),
(7, 'D.única');

-- Insertar datos en la tabla vacunas
INSERT INTO vacunas (cod_vacuna, descripcion_vacuna) VALUES
('AG', 'Antigripal'),
('BCG', 'BCG'),
('DPT', 'Triple Bacteriana'),
('DPT Hib-HB', 'Pentavalente'),
('DPT Hib+HB', 'Cuadruple Bacteriana'),
('dT', 'Doble Bacteriana'),
('dTa', 'Doble Adulto'),
('dTpa', 'Triple Bacteriana'),
('FA', 'Antiamarillica'),
('HA', 'Hepatitis A'),
('HB', 'Hepatitis B'),
('OPV', 'Sabi'),
('V13', 'ANTINEUMO');

-- Insertar datos en la tabla paciente
INSERT INTO paciente (dni_paciente, apellido_nombre, direccion, fecha_nacimiento, cod_sexo) VALUES
('12345678', 'González, Juan', 'Calle 111', '2022-05-01', 'M'),
('23456789', 'Pérez, Ana', 'Calle 222', '2023-01-15', 'F'),
('34567890', 'Rodríguez, Luis', 'Calle 333', '1975-11-20', 'M'),
('33445566', 'Rodríguez, Jose', 'Calle 222', '1999-11-25', 'M'),
('32333435', 'Larreta, Luis', 'Calle 444', '2004-12-12', 'M'),
('31333435', 'Abrahan, Anahí', 'Calle 111', '2001-5-13', 'F');


-- Insertar datos en la tabla grupos_etareos
INSERT INTO grupos_etareos (cod_grupo, descripcion_grupo) VALUES
(1, '< 1 mes'),
(2, '< 1 año'),
(3, '1 año'),
(4, '< 12 a'),
(5, '12 a y +'),
(6, '13 a y +'),
(7, '11-54 a'),
(8, '65 a y +');

-- Insertar datos en la tabla vacunacion
INSERT INTO vacunacion (cod_hospital, num_caps, id_vacunacion, fecha, dni_paciente, cod_vacuna, cod_grupo, cod_dosis) VALUES
(1, 1, 1, '2022-01-01', '12345678', 'AG', 1, 1),
(1, 1, 2, '2022-01-15', '23456789', 'BCG', 2, 1),
(2, 1, 3, '2022-01-20', '34567890', 'DPT', 3, 2), 
(1, 2, 4, '2022-01-16', '33445566', 'DPT', 7, 3),
(1, 1, 4, '2022-01-16', '32333435', 'HA', 7, 3),
(2, 1, 4, '2022-01-16', '31333435', 'dTa', 7, 3);


