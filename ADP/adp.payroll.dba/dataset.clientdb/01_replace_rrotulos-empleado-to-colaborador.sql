/****** 
Object:  Table rrotulos
Script Date: 04/11/2015
Description: - Increase lenght rrotulos column.
			 - Replacing rotulo word: 'empleado' to 'colaborador'.
******/

alter table rrotulos alter column Rotulo char(50)
update rrotulos set Rotulo = replace(Rotulo, 'empleado', 'colaborador')