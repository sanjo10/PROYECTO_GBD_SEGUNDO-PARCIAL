--1.Trigger si una persona va a ingresar por tercera ves , 
--que se lance una advertencia que tiene un descuento de 50%
create trigger Trigger_Atrasos
on Periodo_rehabiltacion 
after insert
as
begin
print 'Tiene un descuento del 50% debido a que es la tercer vez que ingresa al centro'
	declare @ingresos int
		select @ingresos=count(Periodo_rehabiltacion.Persona_id) from Periodo_rehabiltacion
		inner join Persona_Adicta on Persona_Adicta.Persona_id = Periodo_rehabiltacion.Persona_id
		group by CAST(Persona_Adicta.Persona_Nombre as varchar(50))
		if(@ingresos=3)
		begin
		update Periodo_rehabiltacion set Costo=Costo-(Costo*0.5) where @ingresos=3
		rollback  transaction
	end
	end
go