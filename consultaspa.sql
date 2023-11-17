SELECT c.cod_hospital, c.num_caps, MONTH(v.fecha) as mes, 
       MAX(dv.cantidad_dosis) as dosis_maximas, MIN(dv.cantidad_dosis) as dosis_minimas
FROM caps c
JOIN vacunacion v ON c.cod_hospital = v.cod_hospital AND c.num_caps = v.num_caps
JOIN (
    SELECT cod_hospital, num_caps, cod_vacuna, MONTH(fecha) as mes, 
           SUM(CASE WHEN cod_dosis = 1 THEN 1 ELSE 0 END) as dosis_primera,
           SUM(CASE WHEN cod_dosis = 2 THEN 1 ELSE 0 END) as dosis_segunda,
           SUM(CASE WHEN cod_dosis = 3 THEN 1 ELSE 0 END) as dosis_tercera,
           COUNT(*) as cantidad_dosis
    FROM vacunacion
    WHERE YEAR(fecha) = 2022
    GROUP BY cod_hospital, num_caps, cod_vacuna, MONTH(fecha)
) dv ON v.cod_hospital = dv.cod_hospital AND v.num_caps = dv.num_caps 
     AND v.cod_vacuna = dv.cod_vacuna AND MONTH(v.fecha) = dv.mes
GROUP BY c.cod_hospital, c.num_caps, MONTH(v.fecha);


Explicación de la consulta:

La consulta principal hace una unión entre las tablas caps y vacunacion para obtener información sobre las vacunaciones realizadas en cada caps.
Luego, se une esta información con una subconsulta que agrupa los datos por caps, vacuna, mes y cantidad de dosis. La subconsulta utiliza una expresión CASE para contar la cantidad de dosis de cada tipo (primera, segunda o tercera) y también cuenta la cantidad total de dosis aplicadas. Solo se consideran las vacunaciones del año 2022.
La consulta principal agrupa los datos por caps y mes, y utiliza la función MAX y MIN para obtener la cantidad máxima y mínima de dosis aplicadas en cada mes y caps.
Finalmente, se seleccionan las columnas cod_hospital, num_caps, mes, dosis_maximas y dosis_minimas.





SELECT v.cod_vacuna, COUNT(*) as cantidad_vacunas
FROM vacunacion v
JOIN paciente p ON v.dni_paciente = p.dni_paciente
JOIN (
    SELECT AVG(DATEDIFF(year, fecha_nacimiento, GETDATE())) as promedio_edad
    FROM paciente
) pe ON DATEDIFF(year, p.fecha_nacimiento, GETDATE()) > pe.promedio_edad
GROUP BY v.cod_vacuna;




Explicación de la consulta:

La consulta principal hace una unión entre las tablas vacunacion y paciente para obtener información sobre las vacunaciones y los pacientes.
Luego, se une esta información con una subconsulta que calcula el promedio de edad general de los pacientes. Para ello, utiliza la función DATEDIFF para calcular la diferencia en años entre la fecha de nacimiento de cada paciente y la fecha actual, y luego aplica la función AVG para calcular el promedio.
La consulta principal filtra los pacientes cuya edad está por encima del promedio general utilizando la condición DATEDIFF(year, p.fecha_nacimiento, GETDATE()) > pe.promedio_edad, donde pe.promedio_edad es la columna calculada en la subconsulta.
Finalmente, se agrupan los datos por vacuna y se cuenta la cantidad de vacunas aplicadas para cada una utilizando la función COUNT(*).