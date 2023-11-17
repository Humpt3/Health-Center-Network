---------------
-- PERMISOS
---------------

-- Este usuario tiene el rol de solo lectura y solamente puede trabajar en la base de datos
create login frontend with password= '1234'
use BD_CAPS
create user frontend for login frontend
alter role db_datareader add member frontend
alter role db_denydatawriter add member frontend

-- Este usuario tiene el rol de solo escritura y solamente puede trabajar en la base de datos 
create login backend with password= '1234'
use BD_CAPS
create user backend for login backend
alter role db_datawriter add member backend
alter role db_denydatareader add member backend

-- Este usuario tiene el rol poder escribir y leer la tablas, solamente puede trabajar en la base de datos
create login DBA with password= '1234'
use BD_CAPS
create user DBA for login DBA
alter role db_datareader add member DBA
alter role db_datawriter add member DBA
alter role db_denydatareader add member DBA

