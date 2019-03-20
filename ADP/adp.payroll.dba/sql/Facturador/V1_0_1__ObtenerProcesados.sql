USE [ADPFACTURADOR]
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProcesados]    Script Date: 02/09/2018 15:57:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
    Script para obtener procesados de remunueraciones y CAS
    Oscar Goldes  
    enero 2015
    este script implementa dos loops anidados
    el loop externo itera sobre las instancias de motor de base de datos
    el loop interno itera sobre las bases de cada instancia
*/ 

ALTER PROCEDURE [dbo].[ObtenerProcesados]
AS
BEGIN

print 'Iniciando procedimiento de facturacion obtencion de procesados'

set NOCOUNT ON

declare @fecha datetime


/* Ajustar fecha *no se por que Ruben Silva*/
set @fecha =  getdate()
------------------------------------------------------


/*
    Declaracion de variables
*/
declare @fechaant datetime
declare @fechadesdecas datetime
declare @basedom nvarchar(30)
set @fechaant = dateadd(month,-1,@fecha)
set @fechadesdecas = dateadd(day,1,@fechaant)


declare @ames nvarchar(6)
declare @amesant nvarchar(6)
set @ames =substring(convert(nvarchar(8),@fecha,112),1,6)
set @amesant =substring(convert(nvarchar(8),@fechaant,112),1,6)

declare @query nvarchar(max)
declare @query2 nvarchar(max)
declare @i int			-- indice base actual
declare @cnt int		-- cantidad de bases
declare @baseact nvarchar(20)  -- base actual

declare @iserver int			-- indice servidor / instancia actual
declare @cntserver int		-- cantidad de servidores
declare @serveract nvarchar(20)  -- servidor actual

declare @lista nvarchar(max)
------------------------------------------------------

 
/* 
    Creacion tablas -Procesos fact -Log procesos 
*/

-- if not exists (SELECT 1 FROM bd_dom01.INFORMATION_SCHEMA.TABLES where TABLE_NAME='procesos_fact')
-- 	create table bd_dom01.dbo.procesos_fact(id int identity primary key,  servidor nvarchar(50) COLLATE DATABASE_DEFAULT , base nvarchar(50) COLLATE DATABASE_DEFAULT , empresa nvarchar(100) COLLATE DATABASE_DEFAULT , rut nvarchar(12) COLLATE DATABASE_DEFAULT ,cod_empresa nvarchar(3) COLLATE DATABASE_DEFAULT , procesados integer, ames char(6) COLLATE DATABASE_DEFAULT , fecha_lectura datetime, quemes char (1) COLLATE DATABASE_DEFAULT, peri char(1) COLLATE DATABASE_DEFAULT, CASPAY char(3) collate database_default)

-- if not exists (SELECT 1 FROM bd_dom01.INFORMATION_SCHEMA.TABLES where TABLE_NAME='log_procesos_fact')
-- 	create table bd_dom01.dbo.log_procesos_fact(id int identity primary key,  servidor nvarchar(50) COLLATE DATABASE_DEFAULT , base nvarchar(50) COLLATE DATABASE_DEFAULT , fecha_lectura datetime default getdate(), Leida char (1) COLLATE DATABASE_DEFAULT, observ nvarchar(max))


print 'Comprobacion de tablas procesos fact y log_procesos_fact..'

if not exists (SELECT * FROM ADPFACTURADOR.INFORMATION_SCHEMA.TABLES where TABLE_NAME='procesos_fact')
create table ADPFACTURADOR.dbo.procesos_fact(id int identity primary key,  servidor nvarchar(50) COLLATE DATABASE_DEFAULT , base nvarchar(50) COLLATE DATABASE_DEFAULT , empresa nvarchar(100) COLLATE DATABASE_DEFAULT , rut nvarchar(12) COLLATE DATABASE_DEFAULT ,cod_empresa nvarchar(3) COLLATE DATABASE_DEFAULT , procesados integer, ames char(6) COLLATE DATABASE_DEFAULT , fecha_lectura datetime, quemes char (1) COLLATE DATABASE_DEFAULT, peri char(1) COLLATE DATABASE_DEFAULT, CASPAY char(3) collate database_default)

if not exists (SELECT 1 FROM ADPFACTURADOR.INFORMATION_SCHEMA.TABLES where TABLE_NAME='log_procesos_fact')
create table ADPFACTURADOR.dbo.log_procesos_fact(id int identity primary key,  servidor nvarchar(50) COLLATE DATABASE_DEFAULT , base nvarchar(50) COLLATE DATABASE_DEFAULT , fecha_lectura datetime default getdate(), Leida char (1) COLLATE DATABASE_DEFAULT, observ nvarchar(max))



print 'Comprobacion finalizada.'

insert into ADPFACTURADOR.dbo.log_procesos_fact(servidor  , base ,  Leida, observ ) values(@@SERVERNAME,'Log Proceso','N','Iniciando proceso Obtencion de procesados')
------------------------------------------------------

/* Lista de bases */
create table  #bases (idx int identity, base nvarchar(1000))					 -- LISTA DE BASES
------------------------------------------------------

/* borrar tabla actual de info de este mes si es que hay */
--delete from bd_dom01.dbo.procesos_fact where ames = @ames

print 'Eliminacion de tabla procesos fact en el mes ' + @ames
delete from ADPFACTURADOR.dbo.procesos_fact where ames = @ames


/* Inicio del loop sobre servidores */
print 'Iniciando loop sobre los servidores encontrados...'
select @iserver = min(servidor.id) - 1, @cntserver = max(servidor.id) from ADPFACTURADOR.dbo.servidor 

while @iserver < @cntserver
begin
 select @iserver = @iserver + 1
 select @serveract = servidor.nombre from ADPFACTURADOR.dbo.servidor where servidor.id = @iserver and habilitado = 1

	-- agregar servers linkeados si no estan
	if upper(@serveract) <> UPPER(@@servername)
	begin
     print @serveract
		IF NOT EXISTS ( SELECT 1 FROM master.dbo.sysservers WHERE srvname = @serveract )
		begin
 			exec sp_addlinkedserver @serveract
 		end	
	end
	else
	begin
		EXEC sp_serveroption @serveract, 'DATA ACCESS', TRUE -- para permitir OPENQUERY al local
	end	
    
    delete from #bases

begin try

     set @lista = 'insert into #bases (base) select name from [' + @serveract + '].[master].[sys].[databases] where database_id > 4'
	 exec   sp_executesql  @lista
     print ('Finalizado loop de servidores')
     print (@lista)
------------------------------------------------------

/* inicio del loop sobre bases del servidor */
print 'Iniciando loop sobre las bases encontradas del servidor...'
select @i = min(idx) - 1, @cnt = max(idx) from #bases
while @i < @cnt
begin
   select @i = @i + 1
   select @baseact = base from #bases where idx = @i

DECLARE @exist NVARCHAR(MAX) = ''
DECLARE @TableExists BIT;

-- verificar que existan RLIQUID, REMPRESA en base
begin try
SET @exist = 'select @TableExists = case when TableExists < 2 then 0 else 1 END
            from openquery(' + QUOTENAME(@serveract) 
            + ', ''select TableExists = count(*) 
                    from ' +QUOTENAME(@serveract)+'.'+ QUOTENAME(@baseact)+ '.[INFORMATION_SCHEMA].[TABLES]
                    where TABLE_NAME in (''''RLIQUID'''',''''REMPRESA'''')'');';

EXECUTE sp_executesql @exist, N'@TableExists BIT OUTPUT', @TableExists OUT;

if (@TableExists = 1 and upper(@baseact) <> 'GESTCLI')
begin

    --set @query=N' insert into bd_dom01.dbo.procesos_fact 
     set @query=N' insert into ADPFACTURADOR.dbo.procesos_fact 
    select  
    ''' + @serveract + ''' as servidor,
    ''' + @baseact +  ''' as base, 
    COALESCE(E.NOMBRE,''Sin empresa'') COLLATE DATABASE_DEFAULT as empresa,
    coalesce(E.RUT,''Sin RUT'') COLLATE DATABASE_DEFAULT as rut, 
    r.Empresa COLLATE DATABASE_DEFAULT as cod_Empresa,
    R.PROCESADOS as procesados, 
    R.AMES COLLATE DATABASE_DEFAULT  as ames,
    getdate() as fecha_lectura, 
    case ames when ''' + @ames COLLATE DATABASE_DEFAULT+ ''' then ''A'' else ''P'' end as quemes,
    peri, 
    ''PAY'' as caspay 
    FROM(
    select 
        AMES,
        ltrim(rtrim(EMPRESA)) as empresa,
        COUNT(*) AS PROCESADOS, 
        peri 
        from ['+ @serveract + '].[' + @baseact + '].[dbo].[Rliquid] 
        where (Ames = ''' + @ames COLLATE DATABASE_DEFAULT+ '''OR Ames ='''+@amesant COLLATE DATABASE_DEFAULT+''') and cohade = ''A000'' AND (PERI = ''M'' or PERI = ''H'' and monto <> 0) 
        GROUP BY Ames, ltrim(rtrim(EMPRESA)), peri 
    )R 
    LEFT OUTER JOIN [' + @serveract + '].[' + @baseact + '].[dbo].[REMPRESA] E 
    ON ltrim(rtrim(R.EMPRESA)) = ltrim(rtrim(E.EMPRESA ))' 
    exec   sp_executesql  @query
        --insert into bd_dom01.dbo.log_procesos_fact(servidor  , base ,  Leida, observ ) values(@serveract,@baseact,'S','')
        insert into ADPFACTURADOR.dbo.log_procesos_fact(servidor  , base ,  Leida, observ ) values(@serveract,@baseact,'S','')
        print 'Informacion: ' + @serveract + '/' + @baseact + ' Ejecucion de calculos realizado'
end

else

begin
	 insert into ADPFACTURADOR.dbo.log_procesos_fact(servidor  , base ,  Leida, observ ) values(@serveract,@baseact,'N','No cumple condiciones')
     print 'Informacion: ' + @serveract + '/' + @baseact + ' No cumple con las condiciones.'
end
------------------------------------------------------

end try
    begin catch
    insert into ADPFACTURADOR.dbo.log_procesos_fact(servidor  , base ,  Leida, observ ) values(@serveract,@baseact,'N','Falló acceso a base: ' + ERROR_MESSAGE())
end catch

end  -- lazo sobre bases
end try

begin catch
	insert into ADPFACTURADOR.dbo.log_procesos_fact(servidor  , base ,  Leida, observ ) values(@serveract,'','N','Falló acceso a instancia: ' + ERROR_MESSAGE())
end catch

END  -- lazo sobre servidores

drop table #bases
print 'Proceso finalizado.'

end

