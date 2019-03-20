USE [ADPFACTURADOR]
GO
/****** Object:  StoredProcedure [dbo].[GeneraBilhetagem]    Script Date: 04/06/2018 11:20:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
-- =============================================  
-- Author:  Oscar Goldes  
-- Create date: Enero 2015  
-- Extraccion info para facturacion  
-- sacar de procesos_fact la info que corresponde a cada producto y tipo de cliente  
  
-- =============================================  
ALTER PROCEDURE [dbo].[GeneraBilhetagem]  
   
AS  
BEGIN  
set nocount on  
  
declare @fecha datetime  
declare @fechaant datetime  
set @fecha=getdate()  
set @fechaant = dateadd(month,-1,@fecha)  
  
declare @ames nvarchar(6)  
declare @amesant nvarchar(6)  
set @ames =substring(convert(nvarchar(8),@fecha,112),1,6)  
set @amesant =substring(convert(nvarchar(8),@fechaant,112),1,6)  
  
  
  
  
----!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
if not exists (SELECT 1 FROM ADPFACTURADOR.INFORMATION_SCHEMA.TABLES where TABLE_NAME='detfactura')  
 create table ADPFACTURADOR.dbo.detfactura(id int identity primary key,  rut nvarchar(12) not null default '' ,  empresa nvarchar(100)  not null default '',  producto nvarchar(5)  not null default '' , procesados integer  not null default 0, ames char(6)  not 
null default '' , fecha_lectura datetime default getdate(), servidor nvarchar(50) not null default '', base nvarchar(50) not null default '' )  
  
if not exists (SELECT 1 FROM ADPFACTURADOR.INFORMATION_SCHEMA.TABLES where TABLE_NAME='bilhetagem')  
 create table ADPFACTURADOR.dbo.bilhetagem(id int identity primary key,  tipo nchar (1), rut nvarchar(12) not null default '' , texto nvarchar(102)  not null default '', fecha_lectura datetime default getdate() )  
  
  
  
-- limpiar registros del mes si existen  
delete from ADPFACTURADOR.dbo.detfactura where ames = @ames  
  
-- insertar nuevos registros  
insert into ADPFACTURADOR.dbo.detfactura (  
servidor,   
base,  
rut ,   
empresa ,  
producto,  
procesados,  
ames   
 )
    
select 
	servidor,
	base,
	rut,
	empresa,
	'10001' as producto,
	procesados,
	@ames as ames
from 
	ADPFACTURADOR.dbo.procesos_fact p 

	inner join bd_dom01.dbo.Rbases r on 
	p.servidor=r.serverD and
	p.base = r.based and
	p.ames = @ames and
	peri = 'M' and
	r.tipopay = 'MS' and
	r.factpay = 1 and 
	p.caspay = 'PAY' and
	p.ames >= r.amesPay -- procesados

union -- MS honorarios
  
select 
	servidor,
	base,
	rut,
	empresa,
	'10002' as producto,
	procesados,
	@ames as ames 
from 
	ADPFACTURADOR.dbo.procesos_fact p

	inner join bd_dom01.dbo.Rbases r on
	p.servidor=r.serverD and
	p.base = r.based and
	p.ames = @ames and
	peri = 'H' and
	r.tipopay = 'MS' and
	r.factpay = 1 and
	p.caspay = 'PAY' and
	p.ames >= r.amesPay -- honorarios 
	 
union -- Streamline  

select 
	servidor,
	base,
	rut,
	empresa,
	'10016' as producto,
	procesados,
	@ames as ames
from
	ADPFACTURADOR.dbo.procesos_fact p

	inner join bd_dom01.dbo.Rbases r on
	p.servidor=r.serverD and
	p.base = r.based and
	p.ames = @ames and 
	r.tipopay = 'SL' and
	r.factpay = 1 and 
	p.caspay = 'PAY' and
	p.ames >= r.amesPay   -- streamline  

union -- MS rol privado  

select 
	servidor,
	base,
	rut,
	empresa,
	'10006' as producto,
	procesados,
	@ames as ames
from 
	ADPFACTURADOR.dbo.procesos_fact p

	inner join bd_dom01.dbo.Rbases r on
	p.servidor=r.serverD and
	p.base = r.based and
	p.ames = @ames and
	r.tipopay = 'RP' and
	r.factpay = 1 and
	p.caspay = 'PAY' and
	p.ames >= r.amesPay    -- streamline
	  
union  -- PS  

select servidor,base,rut,empresa,'99250' as producto, procesados,@ames as ames from ADPFACTURADOR.dbo.procesos_fact p inner join bd_dom01.dbo.Rbases r on p.servidor=r.serverD and p.base = r.based and p.ames = @ames   and r.tipopay = 'PS' and r.factpay = 1 and 
p.caspay = 'PAY' and p.ames >= r.amesPay   -- streamline  
union -- MS CAS  
select servidor,base,rut,empresa,'20002' as producto, procesados,@ames as ames from ADPFACTURADOR.dbo.procesos_fact p inner join bd_dom01.dbo.Rbases r on p.servidor=r.serverD and p.base = r.based and p.ames = @ames   and r.tipoCAS = 'MS' and r.factcas = 1 and 
p.caspay = 'CAS' and p.ames >= r.amesCas   -- streamline  
union -- PS CAS  
select servidor,base,rut,empresa,'99901' as producto, procesados,@ames as ames from ADPFACTURADOR.dbo.procesos_fact p inner join bd_dom01.dbo.Rbases r on p.servidor=r.serverD and p.base = r.based and p.ames = @ames   and r.tipoCAS = 'PS' and r.factcas = 1 and 
p.caspay = 'CAS' and p.ames >= r.amesCas   -- streamline  
union  -- reprocesos RG  
select act.servidor,act.base,act.rut,act.empresa,'99011' as producto, coalesce(act.procesados,0)- coalesce(prev.procesados,0) as procesados, @ames as ames from   
(select servidor, base,rut,empresa, coalesce(procesados,0)  as procesados,ames,caspay,peri from procesos_fact p inner join bd_dom01.dbo.Rbases r on p.servidor=r.serverD and p.base = r.based and p.ames = @amesant and peri = 'M' and r.tipopay = 'MS' and r.factpay = 1 and p.caspay = 'PAY' and p.quemes='P' and p.ames >= r.amesPay ) act  
left join  
(select rut,empresa, coalesce(procesados,0) as procesados,ames,caspay,peri from ADPFACTURADOR.dbo.procesos_fact p inner join bd_dom01.dbo.Rbases r on p.servidor=r.serverD and p.base = r.based and p.ames = @amesant and peri = 'M' and r.tipopay = 'MS' and r.factpay = 1 and p.caspay = 'PAY' and p.quemes='A' and p.ames >= r.amesPay ) prev  
on act.rut = prev.rut and act.ames = prev.ames and act.peri = prev.peri and act.caspay = prev.caspay  
--reproceso RP MS nomina  
union  
select act.servidor,act.base,act.rut,act.empresa,'99906' as producto,   
coalesce(act.procesados,0)- coalesce(prev.procesados,0) as procesados,   
@ames as ames from   
  
(select servidor, base,rut,empresa, coalesce(procesados,0)  as procesados,ames,caspay,peri   
from procesos_fact p inner join bd_dom01.dbo.Rbases r   
on p.servidor=r.serverD and p.base = r.based and p.ames = @amesant and peri = 'M' and   
r.tipopay = 'RP' and r.factpay = 1 and p.caspay = 'PAY' and p.quemes='P' and p.ames >= r.amesPay ) act  
left join  
(select rut,empresa, coalesce(procesados,0) as procesados,ames,caspay,peri from   
ADPFACTURADOR.dbo.procesos_fact p inner join bd_dom01.dbo.Rbases r   
on p.servidor=r.serverD and p.base = r.based and p.ames = @amesant and peri = 'M' and   
r.tipopay = 'RP' and r.factpay = 1 and   
p.caspay = 'PAY' and p.quemes='A' and p.ames >= r.amesPay ) prev  
on act.rut = prev.rut and act.ames = prev.ames and act.peri = prev.peri and act.caspay = prev.caspay  
  
-- reproceso PS nomina  
union  
select act.servidor,act.base,act.rut,act.empresa,'99904' as producto,   
coalesce(act.procesados,0)- coalesce(prev.procesados,0) as procesados,   
@ames as ames from   
  
(select servidor, base,rut,empresa, coalesce(procesados,0)  as procesados,ames,caspay,peri   
from procesos_fact p inner join bd_dom01.dbo.Rbases r   
on p.servidor=r.serverD and p.base = r.based and p.ames = @amesant and peri = 'M' and   
r.tipopay = 'PS' and r.factpay = 1 and p.caspay = 'PAY' and p.quemes='P' and p.ames >= r.amesPay ) act  
left join  
(select rut,empresa, coalesce(procesados,0) as procesados,ames,caspay,peri from   
ADPFACTURADOR.dbo.procesos_fact p inner join bd_dom01.dbo.Rbases r   
on p.servidor=r.serverD and p.base = r.based and p.ames = @amesant and peri = 'M' and   
r.tipopay = 'PS' and r.factpay = 1 and   
p.caspay = 'PAY' and p.quemes='A' and p.ames >= r.amesPay ) prev  
on act.rut = prev.rut and act.ames = prev.ames and act.peri = prev.peri and act.caspay = prev.caspay  
  
--reproceso MS CAS  
union  
select act.servidor,act.base,act.rut,act.empresa,'99907' as producto,   
coalesce(act.procesados,0)- coalesce(prev.procesados,0) as procesados,   
@ames as ames from   
  
(select servidor, base,rut,empresa, coalesce(procesados,0)  as procesados,ames,caspay,peri   
from procesos_fact p inner join bd_dom01.dbo.Rbases r   
on p.servidor=r.serverD and p.base = r.based and p.ames = @amesant and peri = 'M' and   
r.tipocas = 'MS' and r.factCAS = 1 and p.caspay = 'CAS' and p.quemes='P' and p.ames >= r.amesCAS ) act  
left join  
(select rut,empresa, coalesce(procesados,0) as procesados,ames,caspay,peri from   
ADPFACTURADOR.dbo.procesos_fact p inner join bd_dom01.dbo.Rbases r   
on p.servidor=r.serverD and p.base = r.based and p.ames = @amesant and peri = 'M' and   
r.tipoCAS = 'MS' and r.factCAS = 1 and   
p.caspay = 'CAS' and p.quemes='A' and p.ames >= r.amesCAS ) prev  
on act.rut = prev.rut and act.ames = prev.ames and act.peri = prev.peri and act.caspay = prev.caspay  
  
--reproceso PS CAS  
union  
select act.servidor,act.base,act.rut,act.empresa,'99905' as producto,   
coalesce(act.procesados,0)- coalesce(prev.procesados,0) as procesados,   
@ames as ames from   
  
(select servidor, base,rut,empresa, coalesce(procesados,0)  as procesados,ames,caspay,peri   
from procesos_fact p inner join bd_dom01.dbo.Rbases r   
on p.servidor=r.serverD and p.base = r.based and p.ames = @amesant and peri = 'M' and   
r.tipocas = 'PS' and r.factCAS = 1 and p.caspay = 'CAS' and p.quemes='P' and p.ames >= r.amesCAS ) act  
left join  
(select rut,empresa, coalesce(procesados,0) as procesados,ames,caspay,peri from   
ADPFACTURADOR.dbo.procesos_fact p inner join bd_dom01.dbo.Rbases r   
on p.servidor=r.serverD and p.base = r.based and p.ames = @amesant and peri = 'M' and   
r.tipoCAS = 'PS' and r.factCAS = 1 and   
p.caspay = 'CAS' and p.quemes='A' and p.ames >= r.amesCAS ) prev  
on act.rut = prev.rut and act.ames = prev.ames and act.peri = prev.peri and act.caspay = prev.caspay  

truncate table ADPFACTURADOR.dbo.bilhetagem  
insert into ADPFACTURADOR.dbo.bilhetagem(tipo, rut, texto)  

select 'C' as tipo, d.rut,
'C' + RIGHT('000000000'+replace(ltrim(rtrim(replace(d.rut,'-',''))),'.',''),9)+'         '+substring(@ames,5,2)+SUBSTRING(@ames,3,2)+'     ' + substring(CONVERT(char(8),getdate(),112),7,2)+substring(CONVERT(char(8),getdate(),112
),5,2)+substring(CONVERT(char(8),getdate(),112),1,4)+left(d.empresa + replicate(' ',65),65) from (select distinct rut,empresa,ames from detfactura where ames=@ames) d  
union  
select 'D' as tipo,rut,'D' + RIGHT('000000000'+replace(ltrim(rtrim(replace(rut,'-',''))),'.',''),9) +'     '+ convert(char(5),producto)+ '   '+right('00000000000'+ ltrim(rtrim(convert(char(11),sum(procesados)))),11) + '000' from detfactura  where ames=@ames
 group by rut,producto  
order by rut, tipo  
end   
  