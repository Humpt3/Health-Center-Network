-------------------------------------------
--PROCEDIMIENTOS ALMACENADOS 
-------------------------------------------

-------------------------------
---PROCEDIMIENTOS DE CARGADO
-------------------------------

---PROCEDIMIENTO ALMACENADO QUE SE ENCARGA DE INSERTAR REGISTROS DE LA TABLA -> PACIENTE
CREATE PROCEDURE pa_ingresar_paciente(@dni_paciente int,
		@nombre_paciente varchar(30),
		@fecha_nacimiento date,
		@sexo char,
		@obra_social varchar(50),
		@domicilio varchar(55),
		@telefono varchar(15))
	as
INSERT into paciente(dni_paciente,nombre_paciente,fecha_nacimiento,sexo,obra_social,domicilio,telefono)
	values(@dni_paciente,@nombre_paciente,@fecha_nacimiento,@sexo,@obra_social,@domicilio,@telefono );
go

	exec pa_ingresar_paciente 42098665,'Jorge Peralta','05-09-1999', 'F', 'OSDE','Martin Goitia 1761', '3794-341099';

---PROCEDIMIENTO ALMACENADO QUE SE ENCARGA DE INSERTAR REGISTROS DE LA TABLA -> BARRIO
CREATE PROCEDURE pa_barrio(@id_barrio int,
		@nombre_barrio varchar(30))
	as
INSERT into barrio(id_barrio, nombre_barrio)
	values(@id_barrio, @nombre_barrio);



	exec pa_barrio 20, 'Laguna Brava';


---PROCEDIMIENTO ALMACENADO QUE SE ENCARGA DE INSERTAR REGISTROS DE LA TABLA -> ATENCION

CREATE PROCEDURE pa_atencion(@id_atencion int,
		@fecha_hora datetime,
		@motivo_consulta varchar(100),
		@diagnostico varchar(100),
		@tratamiento varchar(100),
		@dni_paciente int,
		@dni_personal int,
		@id_caps int)
	as
INSERT into atencion(id_atencion, fecha_hora, motivo_consulta, diagnostico, tratamiento, dni_paciente, dni_personal, id_caps)
	values(@id_atencion, @fecha_hora, @motivo_consulta, @diagnostico, @tratamiento, @dni_paciente, @dni_personal, @id_caps);


---PROCEDIMIENTO ALMACENADO QUE SE ENCARGA DE INSERTAR REGISTROS DE LA TABLA -> CAPS 
CREATE PROCEDURE pa_caps(@id_caps int,
		@nombre_caps varchar(30),
		@direccion varchar(100),
		@telefono varchar(30),
		@id_barrio varchar(30))
	as
INSERT into caps(id_caps, nombre_caps, direccion, telefono, id_barrio)
	values(@id_caps, @nombre_caps, @direccion, @telefono, @id_barrio);

---PROCEDIMIENTO ALMACENADO QUE SE ENCARGA DE INSERTAR REGISTROS DE LA TABLA -> ESTUDIO_COM
CREATE PROCEDURE pa_estudio_com(@id_estudio_com int,
		@descripcion varchar(255),
		@nombre_archivo varchar(100),
		@contenido varbinary(max),
		@extension varchar(4))
	as
INSERT into estudio_com(id_estudio_com, descripcion, nombre_archivo, contenido, extension)
	values(@id_estudio_com, @descripcion, @nombre_archivo, @contenido, @extension);

---PROCEDIMIENTO ALMACENADO QUE SE ENCARGA DE INSERTAR REGISTROS DE LA TABLA -> PACIENTE_ESTUDIO_COM
CREATE PROCEDURE pa_paciente_estudio_com(@dni_paciente int,
		@id_estudio_com int)
	as
INSERT into paciente_estudio_com(dni_paciente, id_estudio_com)
	values(@dni_paciente, @id_estudio_com);

---PROCEDIMIENTO ALMACENADO QUE SE ENCARGA DE INSERTAR REGISTROS DE LA TABLA -> PERSONAL
CREATE PROCEDURE pa_personal(@dni_personal int,
@nombre varchar(100),
@direccion varchar(100),
@telefono varchar(30),
@matricula varchar(45),
@especialidad varchar(45),
@horario_entrada time(7),
@horario_salida time(7),
@id_tipo_personal int)
	as
INSERT into personal(dni_personal, nombre, direccion, telefono, matricula, especialidad, horario_entrada, horario_salida, id_tipo_personal)
	values(@dni_personal, @nombre, @direccion, @telefono, @matricula, @especialidad, @horario_entrada, @horario_salida, @id_tipo_personal);

---PROCEDIMIENTO ALMACENADO QUE SE ENCARGA DE INSERTAR REGISTROS DE LA TABLA -> TIPO_PERSONAL
CREATE PROCEDURE pa_tipo_personal(@id_tipo_personal int,
@descripcion varchar(100))
	as
INSERT into tipo_personal(id_tipo_personal, descripcion)
	values(@id_tipo_personal, @descripcion);

-------------------------------
--- PROCEDIMIENTOS DE ELIMINADO 
-------------------------------

--- PROCEDIMIENTO DE ALMACENADO QUE SE ENCARGA DE ELIMINAR DATOS DE LA TABLA -> CAPS

CREATE PROCEDURE pa_eliminar_cap(
		@nombre_caps varchar(30))
as
delete from caps
	where nombre_caps = @nombre_caps;


--- PROCEDIMIENTO DE ALMACENADO QUE SE ENCARGA DE ELIMINAR DATOS DE LA TABLA -> BARRIO

CREATE PROCEDURE pa_eliminar_barrio(
		@nombre_barrio varchar(30))
as
delete from barrio
	where nombre_barrio = @nombre_barrio;

--- PROCEDIMIENTO DE ALMACENADO QUE SE ENCARGA DE ELIMINAR DATOS DE LA TABLA -> ATENCION

CREATE PROCEDURE pa_eliminar_atencion(
		@dni_paciente int)
as
delete from atencion
	where dni_paciente = @dni_paciente;

--- PROCEDIMIENTO DE ALMACENADO QUE SE ENCARGA DE ELIMINAR DATOS DE LA TABLA -> ESTUDIO_COM

CREATE PROCEDURE pa_eliminar_estudio_com(
		@descripcion varchar(255))
as
delete from estudio_com
	where descripcion = @descripcion;

--- PROCEDIMIENTO DE ALMACENADO QUE SE ENCARGA DE ELIMINAR DATOS DE LA TABLA -> PACIENTE

CREATE PROCEDURE pa_eliminar_paciente(
		@nombre_paciente varchar(100))
as
delete from paciente
	where nombre_paciente = @nombre_paciente


--- PROCEDIMIENTO DE ALMACENADO QUE SE ENCARGA DE ELIMINAR DATOS DE LA TABLA -> PACIENTE_ESTUDIO_COM

CREATE PROCEDURE pa_eliminar_paciente_estudio(
		@dni_paciente int)
as
delete from paciente_estudio_com
	where dni_paciente = @dni_paciente


--- PROCEDIMIENTO DE ALMACENADO QUE SE ENCARGA DE ELIMINAR DATOS DE LA TABLA -> PERSONAL

CREATE PROCEDURE pa_eliminar_personal(
		@dni_personal int)
as
delete from personal
	where dni_personal = @dni_personal;


--- PROCEDIMIENTO DE ALMACENADO QUE SE ENCARGA DE ELIMINAR DATOS DE LA TABLA -> TIPO_PERSONAL

CREATE PROCEDURE pa_eliminar_tipo_personal(
		@descripcion int)
as
delete from tipo_personal
	where descripcion = @descripcion;

--- PROCEDIMIENTO DE ALMACENADO QUE SE ENCARGA DE MODIFICAR DATOS DE LA TABLA -> ATENCION

CREATE PROCEDURE pa_modificar_atencion
		@diagnostico varchar(100),
		@dni_paciente int
		
as
	UPDATE atencion set diagnostico = @diagnostico			
		where dni_paciente = @dni_paciente;
go

--- PROCEDIMIENTO DE ALMACENADO QUE SE ENCARGA DE MODIFICAR DATOS DE LA TABLA -> PACIENTE

CREATE PROCEDURE pa_modificar_paciente
		@dni_paciente int,
		@obra_social varchar(30)
		
as
	UPDATE paciente set obra_social = @obra_social		
		where dni_paciente = @dni_paciente;
go

--- PROCEDIMIENTO DE ALMACENADO QUE SE ENCARGA DE MODIFICAR DATOS DE LA TABLA -> PERSONAL

CREATE PROCEDURE pa_modificar_personal
		@dni_personal int,
		@especialidad varchar(45)
		
as
	UPDATE personal set especialidad = @especialidad
		where dni_personal = @dni_personal;
go