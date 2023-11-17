---------------------------
--LOTE DE DATOS.
---------------------------
USE BD_CAPS;
go

----------
--barrio
----------
Insert into barrio (id_barrio, nombre_barrio) values (1,'Laguna Seca');
Insert into barrio (id_barrio, nombre_barrio) values (2,'17 de Agosto');
Insert into barrio (id_barrio, nombre_barrio) values (3,'Quintana');
Insert into barrio (id_barrio, nombre_barrio) values (4,'Santa Rosa');
Insert into barrio (id_barrio, nombre_barrio) values (5,'Mil vivendas');

go
---------
-- caps
---------
Insert into caps (id_caps, nombre_caps, direccion, telefono, id_barrio) values (1,'CAPS Nº 4', 'Bº Lag Seca, Resoagli y Larrea','3794484785',1);
Insert into caps (id_caps, nombre_caps, direccion, telefono, id_barrio) values (2,'CAPS Nº 9','Bº 17 de Agosto, Juan Domingo Peron 5700 ','3794484786',2 );
Insert into caps (id_caps, nombre_caps, direccion, telefono, id_barrio) values (3,'CAPS Nº 11','Bº Quintana, Verne y Renacimiento','3794470666', 3);
Insert into caps (id_caps, nombre_caps, direccion, telefono, id_barrio) values (4,'CAPS Nº 8','Bº Colombia y Granaderos, Santa Teresita','3794475109',4 );
Insert into caps (id_caps, nombre_caps, direccion, telefono, id_barrio) values (5,'CAPS Nº 3', 'Bº 1000viv Cosquin 2195','3794477608',5);

go
---------------
--estudio_com
-- SE DEBE UBICAR UNA IMAGEN EN LA RUTA "C:/IMG.jpg";
-- SE DEBE RESPETAR EL NOMBRE Y EL FORMATO O PUEDE CAMBIARSE DEBAJO SI ASI SE DESEA.
---------------
--Insert into estudio_com (id_estudio_com, descripcion, nombre_archivo, contenido, extension) values ();
INSERT INTO estudio_com(id_estudio_com, descripcion, nombre_archivo, contenido, extension) SELECT 1,'Historia Clinica del paciente 1', 'HC-paciente-1', *,'JPEG' FROM OPENROWSET(BULK N'C:\IMG.jpg', SINGLE_BLOB) AS i 
INSERT INTO estudio_com(id_estudio_com, descripcion, nombre_archivo, contenido, extension) SELECT 2,'Historia Clinica del paciente 2', 'HC-paciente-2', *,'JPEG' FROM OPENROWSET(BULK N'C:\IMG.jpg', SINGLE_BLOB) AS i   
INSERT INTO estudio_com(id_estudio_com, descripcion, nombre_archivo, contenido, extension) SELECT 3,'Historia Clinica del paciente 3', 'HC-paciente-3', *,'JPEG' FROM OPENROWSET(BULK N'C:\IMG.jpg', SINGLE_BLOB) AS i   
INSERT INTO estudio_com(id_estudio_com, descripcion, nombre_archivo, contenido, extension) SELECT 4,'Historia Clinica del paciente 4', 'HC-paciente-4', *,'JPEG' FROM OPENROWSET(BULK N'C:\IMG.jpg', SINGLE_BLOB) AS i   
INSERT INTO estudio_com(id_estudio_com, descripcion, nombre_archivo, contenido, extension) SELECT 5,'Historia Clinica del paciente 5', 'HC-paciente-5', *,'JPEG' FROM OPENROWSET(BULK N'C:\IMG.jpg', SINGLE_BLOB) AS i   

go
------------
--paciente
------------
Insert into paciente (dni_paciente, nombre_paciente, fecha_nacimiento, sexo, obra_social, domicilio, telefono) values (36112457,'Andrea Cabrera','19910118','IOSCOR','Femenino','Junin 2062','3795053426');
Insert into paciente (dni_paciente, nombre_paciente, fecha_nacimiento, sexo, obra_social, domicilio, telefono) values (37459110,'María Espindola','19921120','OSECAC','Femenino','Mayo 1900','3795053426');
Insert into paciente (dni_paciente, nombre_paciente, fecha_nacimiento, sexo, obra_social, domicilio, telefono) values (35112455,'Juan Torrez','19900712','MEDIFE','Masculino','San Martin 840','3795053426');
Insert into paciente (dni_paciente, nombre_paciente, fecha_nacimiento, sexo, obra_social, domicilio, telefono) values (36154154,'Pablo Contreras','19910515','IOSCOR','Masculino','Belgrano 400','3795053426');
Insert into paciente (dni_paciente, nombre_paciente, fecha_nacimiento, sexo, obra_social, domicilio, telefono) values (36338452,'Esteban Ruiz Días','19910401','IOSCOR','Masculino','Av costanera 500','3795053426');

go
---------------------------
--paciente_estudio_com
---------------------------
Insert into paciente_estudio_com (dni_paciente,id_estudio_com ) values (36112457,1);
Insert into paciente_estudio_com (dni_paciente,id_estudio_com ) values (37459110,2);
Insert into paciente_estudio_com (dni_paciente,id_estudio_com ) values (35112455,3);
Insert into paciente_estudio_com (dni_paciente,id_estudio_com ) values (36154154,4);
Insert into paciente_estudio_com (dni_paciente,id_estudio_com ) values (36338452,5);

go

---------------
--tipo_personal
---------------
Insert into tipo_personal (id_tipo_personal, descripcion) values (1,'Medico');
Insert into tipo_personal (id_tipo_personal, descripcion) values (2,'Administrativo');
Insert into tipo_personal (id_tipo_personal, descripcion) values (3,'Maestranza');
Insert into tipo_personal (id_tipo_personal, descripcion) values (4,'Enfermera');
Insert into tipo_personal (id_tipo_personal, descripcion) values (5,'Kinesiólogo');

go
------------
--personal
------------
Insert into personal (dni_personal, nombre, direccion, telefono, matricula, especialidad, horario_entrada, horario_salida, id_tipo_personal) 
values (36112643, 'Ignacio Sotelo', 'Junin 2062','3795053426','25-5214','Clinico','07:00:00','13:00:00',1);
Insert into personal (dni_personal, nombre, direccion, telefono, matricula, especialidad, horario_entrada, horario_salida, id_tipo_personal) 
values (34446573, 'Julio Perez', 'Junin 2062','3795053426',null,null,'07:00:00','13:00:00',2);
Insert into personal (dni_personal, nombre, direccion, telefono, matricula, especialidad, horario_entrada, horario_salida, id_tipo_personal) 
values (30245781, 'Monica Soler', 'Junin 2062','3795053426',null,null,'13:00:00','19:00:00',3);
Insert into personal (dni_personal, nombre, direccion, telefono, matricula, especialidad, horario_entrada, horario_salida, id_tipo_personal) 
values (31259766, 'Florencia Fiat', 'Junin 2062','3795053426',null,null,'07:00:00','13:00:00',4);
Insert into personal (dni_personal, nombre, direccion, telefono, matricula, especialidad, horario_entrada, horario_salida, id_tipo_personal) 
values (36112468, 'Cintia Contreras', 'Junin 2062','3795053426','142-6875','Fisioterapia','07:00:00','13:00:00',5);

go
-----------
--atencion
-----------
Insert into atencion (id_atencion, fecha_hora, motivo_consulta, diagnostico, tratamiento, dni_paciente, dni_personal, id_caps) 
values (1,'20211003 10:00:00', 'Dolor Abdominal agudo', 'Cólico','Analgésicos C/8hs',36112457, 36112643,1);
Insert into atencion (id_atencion, fecha_hora, motivo_consulta, diagnostico, tratamiento, dni_paciente, dni_personal, id_caps) 
values (2,'20211003 9:00:00', 'Dolor muscular pierna derecha', 'Distención','Reposo y Analgésicos C/6hs',35112455, 36112468,2);
Insert into atencion (id_atencion, fecha_hora, motivo_consulta, diagnostico, tratamiento, dni_paciente, dni_personal, id_caps) 
values (3,'20211003 11:30:00', 'Vacuna Antigripal', null,null,37459110, 31259766,3);
Insert into atencion (id_atencion, fecha_hora, motivo_consulta, diagnostico, tratamiento, dni_paciente, dni_personal, id_caps) 
values (4,'20211003 12:00:00', 'Planes y Beneficios Sociales', null,null,36338452, 34446573,4);
Insert into atencion (id_atencion, fecha_hora, motivo_consulta, diagnostico, tratamiento, dni_paciente, dni_personal, id_caps) 
values (5,'20211003 8:45:00', 'Dolor de Cabeza', 'Migraña','Reposo y Analgésicos C/6hs',36154154, 36112643,5);

go
--------------------------------------------------------------------------------------------------------------------------------------

