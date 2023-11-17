Declare @tabla varchar(200)

Declare Cursor_Idx Cursor for
select name from sysobjects where type='U' Order by name

OPEN Cursor_Idx

FETCH NEXT FROM Cursor_Idx INTO @tabla
WHILE @@FETCH_STATUS = 0
BEGIN
EXEC sp_helpindex @tabla

FETCH NEXT FROM Cursor_Idx INTO @tabla
END

CLOSE Cursor_Idx
DEALLOCATE Cursor_Idx
GO