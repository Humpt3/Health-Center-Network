DROP DATABASE CENTRO_CAPS

USE CENTRO_CAPS


DROP TABLE caps
DROP TABLE dosis
DROP TABLE vacunas
DROP TABLE paciente
DROP TABLE grupos_etareos
DROP TABLE vacunacion



CREATE TABLE caps (
    cod_hospital INT ,
    num_caps INT,
    nombre_caps VARCHAR(20),
    direccion_caps VARCHAR(30),
    telefono_caps INT,
    dni_director VARCHAR(8) NOT NULL,

    PRIMARY KEY (cod_hospital, num_caps)
);


CREATE TABLE dosis (
    cod_dosis INT primary key,
    descripcion_dosis VARCHAR(10)
);


CREATE TABLE vacunas (
    cod_vacuna VARCHAR(10) primary key,
    descripcion_vacuna VARCHAR(20)
);


CREATE TABLE paciente (
    dni_paciente VARCHAR(8) NOT NULL,
    apellido_nombre VARCHAR(50),
    direccion VARCHAR(50),
    fecha_nacimiento DATETIME,
    cod_sexo CHAR(1) CHECK(cod_sexo IN ('M', 'F')),

    PRIMARY KEY (dni_paciente)
);


CREATE TABLE grupos_etareos(
    cod_grupo INT primary key,
    descripcion_grupo VARCHAR(10)
);


CREATE TABLE vacunacion (
    cod_hospital INT,
    num_caps INT,
    id_vacunacion INT,
    fecha DATETIME DEFAULT GETDATE(),
    dni_paciente VARCHAR(8),
    cod_vacuna VARCHAR(10),
    cod_grupo INT,
    cod_dosis INT,

    PRIMARY KEY(cod_hospital, num_caps, id_vacunacion),
    FOREIGN KEY(cod_hospital,num_caps) REFERENCES caps(cod_hospital, num_caps),
    FOREIGN KEY(dni_paciente) REFERENCES paciente(dni_paciente),
    FOREIGN KEY(cod_vacuna) REFERENCES vacunas(cod_vacuna),
    FOREIGN KEY(cod_grupo) REFERENCES grupos_etareos(cod_grupo),
    FOREIGN KEY(cod_dosis) REFERENCES dosis(cod_dosis)
);

