-------------------------------------
--CREACIÓN DE LA BASE Y TABLAS
-------------------------------------

------Para Crear la Base de Datos --------------
CREATE DATABASE BD_CAPS;
go
-----Posicionarse en la Base de Datos ------------
USE BD_CAPS;
go
------------- Borrar las estructuras de datos de las tablas --------------
if object_id('caps') is not null DROP TABLE caps
go
---------------------
if object_id('barrio') is not null DROP TABLE barrio;
go
---------------------
if object_id('estudio_com') is not null DROP TABLE estudio_com
go
-----------------------------
if object_id('paciente_has_estudio_com') is not null DROP TABLE paciente_estudio_com
go
--------------------------------

if object_id('paciente') is not null DROP TABLE paciente
go

-------------------------------
if object_id('personal') is not null DROP TABLE personal
go

---------------------
if object_id('tipo_personal') is not null DROP TABLE tipo_personal
go
---------------------
if object_id('atencion') is not null DROP TABLE atencion
go
---------------------


Create table barrio (
		id_barrio int primary key, 
		nombre_barrio varchar(30)
)
go

Create table caps (
		id_caps int, 
		nombre_caps varchar(30),
		direccion varchar(100),
		telefono varchar(30),
		id_barrio int,
		Constraint PK_caps PRIMARY KEY (id_caps),
		Constraint FK_caps_barrio FOREIGN KEY (id_barrio)  REFERENCES barrio(id_barrio)	
)
go

Create table paciente (
		dni_paciente int primary key, 
		nombre_paciente varchar(200),
		fecha_nacimiento date,
		sexo varchar(20),
		obra_social varchar(30),
		domicilio varchar(100),
		telefono varchar(30),
)
go

Create table estudio_com (
		id_estudio_com int primary key, 
		descripcion varchar(255),
		nombre_archivo varchar(100),
		contenido varbinary(max),
		extension varchar(4),
)
go

Create table paciente_estudio_com (
		dni_paciente int,
		id_estudio_com int,
		Constraint PK_paciente_has_estudio_com PRIMARY KEY (dni_paciente, id_estudio_com),
		Constraint FK_paciente_estudio_com FOREIGN KEY (dni_paciente)  REFERENCES paciente(dni_paciente),
		Constraint FK_estudio_com_paciente FOREIGN KEY (id_estudio_com)  REFERENCES estudio_com(id_estudio_com)		
)
go

Create table tipo_personal (
	id_tipo_personal int primary key, 
	descripcion varchar(100),
)
go

Create table personal (
		dni_personal  int , 
		nombre varchar(100),
		direccion varchar(100),
		telefono varchar(30),
		matricula varchar(45),
		especialidad varchar(45),
		horario_entrada time,
		horario_salida time,
		id_tipo_personal int
		Constraint PK_personal PRIMARY KEY ( dni_personal),
		Constraint FK_personal_tipo_personal FOREIGN KEY (id_tipo_personal)  REFERENCES tipo_personal(id_tipo_personal)	
)
go

Create table atencion (
		id_atencion int, 
		fecha_hora datetime,
		motivo_consulta varchar(100),
		diagnostico varchar(100),
		tratamiento varchar(100),
		dni_paciente int, 
		dni_personal int,
		id_caps int,
		Constraint PK_atencion PRIMARY KEY (id_atencion),
		Constraint FK_atencion_personal FOREIGN KEY (dni_personal) REFERENCES personal(dni_personal),
		Constraint FK_atencion_paciente FOREIGN KEY (dni_paciente)  REFERENCES paciente(dni_paciente),	
		Constraint FK_atencion_caps FOREIGN KEY (id_caps)  REFERENCES caps(id_caps)	
)
go


	------------------ Modificaciones de tipo de datos de variables de tablas ---

	--ALTER TABLE caps
	--ALTER COLUMN direccion varchar(100);

	--ALTER TABLE caps
	--ALTER COLUMN telefono varchar(30);
	--ALTER TABLE paciente
	--ALTER COLUMN fecha_nacimiento date;

	--ALTER TABLE personal
	--ALTER COLUMN horario_entrada time;
	--	ALTER TABLE personal
	--ALTER COLUMN horario_salida time;


