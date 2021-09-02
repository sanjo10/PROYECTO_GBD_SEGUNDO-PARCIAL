-- 2. Cursor que detalle cada paciente y por cada paciente cuantas veces a sido atendido y cuantas veces
-- ha ingresado y la cantidad de dinero que obtuvo el centro por ese paciente
DECLARE Cursor_pacientes  CURSOR   
     FOR select 
concat(cast(Persona_Adicta.Persona_Nombre as varchar(20)) ,' ',cast(Persona_Adicta.Persona_Apellido as varchar(20)))as Paciente,
COUNT(DISTINCT  Atencion.Persona_id) AS Numero_atenciones,
COUNT(DISTINCT  Periodo_rehabiltacion.Persona_id) AS Ingresos_Centro,
sum(distinct Periodo_rehabiltacion.Costo) as IngresosAlCentro
from Persona_Adicta 
inner join Atencion on Atencion.Persona_id =Persona_Adicta.Persona_id
inner join Periodo_rehabiltacion on Periodo_rehabiltacion.Persona_id=Persona_Adicta.Persona_id
group by cast(Persona_Adicta.Persona_Nombre as varchar(20)),cast(Persona_Adicta.Persona_Apellido as varchar(20))
--Abrir el cursor
open Cursor_pacientes
--Recorrer cursor
fetch next from Cursor_pacientes
--Cerrar cursor
close Cursor_pacientes;