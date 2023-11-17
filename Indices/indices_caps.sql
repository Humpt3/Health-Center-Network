
use BD_CAPS

------ INDICE AGRUPADO ------
--Todas las tablas que contienen clave primaria por defecto tienen indices agrupados--
select * from paciente
select * from barrio
select * from caps

--Verificamos la existencia del indice--
execute sp_helpindex 'paciente'
execute sp_helpindex 'barrio'
execute sp_helpindex 'caps'



---INDICE DESAGRUPADO TABLA PACIENTE--
select nombre_paciente, fecha_nacimiento from paciente

--CREAMOS INDICE DESAGRUPADO--
create nonclustered index IDX_paciente
on paciente (nombre_paciente)

--Verificamos la existencia del indice no agrupado--
execute sp_helpindex 'paciente'




--INDICE FILTRADO DE LA TABLA PERSONAL--
select * from personal

--CREAMOS INDICE FILTRADO--
create nonclustered index indice_filtrado_personal
on personal (dni_personal, nombre, horario_entrada, horario_salida)
where especialidad IS NOT NULL
go

--Verificamos la existencia del indice filtrado--
execute sp_helpindex 'personal'


--INDICE FILTRADO DE LA TABLA ATENCION--
select fecha_hora, dni_paciente, dni_personal from atencion

--CREAMOS INDICE FILTRADO--
create nonclustered index indice_filtrado_atencion
on atencion (fecha_hora, dni_paciente, dni_personal)
where tratamiento IS NOT NULL
go

--Verificamos la existencia del indice filtrado--
execute sp_helpindex 'atencion'

