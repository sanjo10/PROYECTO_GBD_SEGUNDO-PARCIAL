-- 3. Procedimiento almacenado
-- Parametro de entrada: nombre especialista, y que muestre a que adictos atendio
create procedure Especialistas
@Especialista as varchar(50)
as
select
concat(cast(Especialista.Especialista_nombre as varchar(50)),' ',cast(Especialista.Especialista_apellido as varchar(50))) as Especialista,
concat(cast(Persona_Adicta.Persona_Nombre as varchar(50)),' ',cast(Persona_Adicta.Persona_Apellido as varchar(50))) as Adicto
from Especialista 
inner join Atencion on Especialista.Especialista_id = Atencion.Especialista_id
inner join Persona_Adicta on Persona_Adicta.Persona_id = Atencion.Persona_id
where cast(Especialista.Especialista_nombre as varchar(50)) = @Especialista
-- Ejecutar procedimiento almacenado
Execute Especialistas "Gustavo"  ;