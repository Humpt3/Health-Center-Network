

begin tran --> Inicio de la transaccion
	update atencion set diagnostico= 'Dolor de cabeza'
	where id_atencion = 3
------------------------> fallo aproposito
	update atencion set fecha_hora = '2021-05-10'
	where id_atencion = 3

if @@ERROR <> 0 --> @ERROR es una variable del motor que devuelve un valor distinto de 0 cuando hay un error de restriccion
BEGIN
ROLLBACK --> Lo que hace el rollback es volver a un estado inicial del que estaba
END


-- Para verificar

select * from atencion

---------Pruebas 1------
begin tran;  
       Insert into atencion (id_atencion, fecha_hora, motivo_consulta, diagnostico, tratamiento, dni_paciente, dni_personal, id_caps) 
		values (1,'20211003 10:00:00', 'Dolor Abdominal agudo', 'Cólico','Analgésicos C/8hs',36112457, 36112643,1); 
ROLLBACK; 

COMMIT TRANSACTION;  

---------Pruebas 2------
BEGIN TRANSACTION;  
	DELETE FROM atencion WHERE id_atencion = 4; 

ROLLBACK 

COMMIT TRANSACTION;  

-- Para verificar
select * from atencion