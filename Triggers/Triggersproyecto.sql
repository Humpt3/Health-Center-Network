use BD_CAPS
go
--Creo una tabla historial, donde se guardaran los registros a las modificaciones hechas en la tabla principal

Create table historial
(fecha datetime,
dni_paciente int,
descripcion varchar(100), 
usuario varchar(20))

go
--- se corrobora que la tabla este vacia -------
select * from historial

---- Se crea el triger de paciente eliminado -------
go
create trigger TR_PacienteEliminado
on atencion for delete
as
set nocount on
declare @dni_paciente int
select @dni_paciente = dni_paciente from deleted  
insert into historial values(getdate(), @dni_paciente, 'paciente eliminado', system_user)
go

select * from atencion

---- Se crea el triger de modificacion de fecha de atencion ------------
go
create trigger TR_fechamodificacion
on atencion for update
as
set nocount on
declare @fechamod datetime
declare @dni_paciente int
select @dni_paciente = dni_paciente from inserted
select @fechamod = fecha_hora from inserted
insert into historial values(@fechamod, @dni_paciente, 'hora modificada', system_user)

