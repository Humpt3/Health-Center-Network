-- Muestra los datos completos de todas las atenciones.
CREATE VIEW vista_atenciones AS 
	SELECT A.*, B.nombre_caps
	FROM atencion A
	JOIN caps B
	ON A.id_caps = B.id_caps;
go

-- Muestra los datos completos de todo el personal.
CREATE VIEW vista_personal AS 
	SELECT A.*, B.descripcion
	FROM personal A
	JOIN tipo_personal B
	ON A.id_tipo_personal = B.id_tipo_personal;
go
