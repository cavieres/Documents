-------------------------------------------------------------------------------
-- Anonymizer Data Base v1.2
-- Fecha: 2017-04-21 11:30hrs
-- Descripcion:
-- - Se agrega compatibilidad con DBs de clientes Argentina.
-------------------------------------------------------------------------------


-- Se elimina el Rlog ya que no es necesario en esta etapa 
SET nocount on
DECLARE @CONSULTA VARCHAR(MAX) = ''
DECLARE @NOMTABLE VARCHAR(MAX)
 
  DECLARE @NOMBRETABLAS TABLE (
	 	Nombretabla VARCHAR(50))
 
 DECLARE @NOMBRETABLAS2 TABLE(
 Nombretabla VARCHAR(50),
 NombreColum varchar(120)
 )
Declare @nameDb varchar(200)
SELECT @nameDb =  DB_NAME()
Declare @LogName varchar(max)
SELECT  @LogName=   name FROM sys.master_files WHERE database_id = db_id()  AND type = 1

DBCC SHRINKFILE (@logname , 10 )
DBCC SHRINKDATABASE (@nameDb , TRUNCATEONLY)

PRINT 'Iniciando el mezclador de Base '  + CONVERT(varchar, SYSDATETIME(), 120)


PRINT 'Borrando Log ' + CONVERT(varchar, SYSDATETIME(), 120)
Truncate table rlog; 
truncate table reventos;
PRINT 'Log Borrado ' + CONVERT(varchar, SYSDATETIME(), 120)
 
 
PRINT 'Mezclando Codigos y nombres ' + CONVERT(varchar, SYSDATETIME(), 120)

SET NOCOUNT ON 
DECLARE @CONTADOR  INT = 0

IF OBJECT_ID('tempdb..##Remplescodigo') IS NOT NULL
BEGIN
	DROP TABLE ##Remplescodigo;
END

-- Getting DB Collation for working DB.
declare @CurrentDbCollation VARCHAR(MAX)
SET @CurrentDbCollation = (SELECT collation_name FROM sys.databases 
where name = (SELECT DB_NAME() AS [Current Database]));

-- Creating associate's temporary table.
DECLARE @CreateTempTableScript NVARCHAR(MAX);
SET @CreateTempTableScript = 'CREATE TABLE ##Remplescodigo (
	codigoremplesantiguo char(12) COLLATE ' + (SELECT @CurrentDbCollation) + ' not null,
	codigoremplesnuevo   char(12) COLLATE ' + (SELECT @CurrentDbCollation) + ' not null,
	nombreremplesantiguo char(60) COLLATE ' + (SELECT @CurrentDbCollation) + ' not null,
	nombreremplesnuevo   char(60) COLLATE ' + (SELECT @CurrentDbCollation) + ' not null)';
EXEC sp_executesql @CreateTempTableScript;

--CODIGO Y NOMBRE ORDENADO	
DECLARE @Codigo Char(12)
DECLARE @Nombre Char(60)
DECLARE @ListaCodigos TABLE (
Codigo char(12) not null primary key ,
nombre char(60) not null
);

INSERT INTO @ListaCodigos 
SELECT Codigo , Nombre  from REMPLES 

SET @CONSULTA  = ''

WHILE (SELECT COUNT(*)FROM @ListaCodigos ) > 0
BEGIN

SET @CONTADOR = @CONTADOR + 1
-- se obtiene el primer registro de la tabla
	SELECT TOP 1 
		 @Codigo = Codigo 
	FROM @ListaCodigos
	BEGIN  
		INSERT INTO ##Remplescodigo (codigoremplesantiguo,codigoremplesnuevo,nombreremplesantiguo,nombreremplesnuevo) SELECT top 1 codigo , SPACE(12 - LEN(@CONTADOR))  + CONVERT(VARCHAR(12),(@CONTADOR)) , nombre, 'Apellido' + Convert(varchar(12),@CONTADOR) +  '  Apellido2, Nombre1 Nombre2'  from @ListaCodigos 
	END	
	DELETE FROM @ListaCodigos WHERE Codigo = @Codigo 
END

--AHORA SE REALIZARA UNA MODIFICACION POR TABLA 




       INSERT INTO @NOMBRETABLAS  SELECT  sysobjects.name AS table_name
		FROM         sysobjects INNER JOIN
			         syscolumns ON sysobjects.id = syscolumns.id INNER JOIN
                     systypes ON syscolumns.xtype = systypes.xtype
		WHERE	     (sysobjects.xtype = 'U') 
					 and (UPPER(syscolumns.name) like upper('Codigo')) AND  syscolumns.LENGTH = 12 AND   sysobjects.name not in ('RGRUPFA')
				     ORDER BY sysobjects.name, syscolumns.colid
         

 --SE RECORRE LOS NOMBRES DE LAS TABLAS 
     
     WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0
      BEGIN          
			SET @CONSULTA =   '  UPDATE    ' + (select TOP 1  * FROM @NOMBRETABLAS) +  '  SET  ' + (select TOP 1  * FROM @NOMBRETABLAS) + '.Codigo = ##Remplescodigo.codigoremplesnuevo FROM ##Remplescodigo WHERE ##Remplescodigo.codigoremplesantiguo =  ' + (select TOP 1  * FROM @NOMBRETABLAS) + '.CODIGO ' + @CONSULTA
            DELETE FROM @NOMBRETABLAS WHERE Nombretabla =  (select TOP 1  Nombretabla FROM @NOMBRETABLAS)
            SET @NOMTABLE =   (select top 1 nombretabla from @nombretablas)
            Print 'Actualizando el campo codigo para la tabla: ' + @NOMTABLE
            EXEC (@CONSULTA)
            SET @CONSULTA = ''
            SET @NOMTABLE = ''
       END   
    
    DELETE FROM @NOMBRETABLAS

       INSERT INTO @NOMBRETABLAS  SELECT  sysobjects.name AS table_name
		FROM         sysobjects INNER JOIN
			         syscolumns ON sysobjects.id = syscolumns.id INNER JOIN
                     systypes ON syscolumns.xtype = systypes.xtype
		WHERE	     (sysobjects.xtype = 'U') 
					 and (UPPER(syscolumns.name) like upper('Nombre')) AND  syscolumns.LENGTH > 40  AND   sysobjects.name not in ('RGRUPFA')
				     ORDER BY sysobjects.name, syscolumns.colid


     WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0
      BEGIN          
			SET @CONSULTA =   '  UPDATE    ' + (select TOP 1  * FROM @NOMBRETABLAS) +  '  SET  ' + (select TOP 1  * FROM @NOMBRETABLAS) + '.Nombre = ##Remplescodigo.nombreremplesnuevo FROM ##Remplescodigo WHERE ##Remplescodigo.nombreremplesantiguo =  ' + (select TOP 1  * FROM @NOMBRETABLAS) + '.Nombre ' + @CONSULTA
            DELETE FROM @NOMBRETABLAS WHERE Nombretabla =  (select TOP 1  Nombretabla FROM @NOMBRETABLAS)
            EXEC (@CONSULTA)
           SET @CONSULTA = ''
       END   


 

DROP TABLE ##Remplescodigo

PRINT ' Codigos y nombres Finalizados ' + CONVERT(varchar, SYSDATETIME(), 120)


 
 
PRINT 'Iniciando Mezclador de Rut ' + CONVERT(varchar, SYSDATETIME(), 120)

IF OBJECT_ID('tempdb..##RemplesRut') IS NOT NULL
BEGIN
	DROP TABLE ##RemplesRut;
END

-- Creating associate's ID temporary table.
SET @CreateTempTableScript = 'CREATE TABLE ##RemplesRut (
	codigorutantiguo char(12) COLLATE ' + (SELECT @CurrentDbCollation) + ',
	codigorutnuevo   char(12) COLLATE ' + (SELECT @CurrentDbCollation) + ' not null)';
EXEC sp_executesql @CreateTempTableScript;

SET @Codigo = ''
declare @direccion varchar(128) = 'Av. Apoquindo            5400  1 1         1Las Condes           13                                                             ';
declare @fono varchar(18) = '+56 2 2483 3000'
declare @celular varchar(18)= '(+569)123456'
declare @mail Varchar(25) = 'Desarrollo@adp.com'
declare @rut char(12),@sexo char(1)
declare @RES integer 
declare @num integer
declare @i integer,@dig integer
declare @cuilf char(12)
declare @rest integer

------------------------------------------------
-- actualiza datos PII en remples
------------------------------------------------
declare @CUILi bigint
declare @cuenta bigint
declare @cuil char(10)
set @cuili = 2010000000
set @cuenta = 123456789


declare cur_rut CURSOR FOR
SELECT rut from remples 
ORDER BY len(fecha_nac)

open cur_rut

FETCH NEXT FROM cur_rut
INTO  @rut
WHILE @@FETCH_STATUS = 0
begin
			
			
		-- calculo nuevo CUIL
	set @RES = 0
	IF UPPER(@sexo) = 'F'
		set @cuil = CONVERT(char(10),@cuili +  700000000 )
	ELSE
		set @cuil = CONVERT(char(10),@cuili)
		
	 SET @i = 1;
	 WHILE @i < 11 
	 begin
		SET @NUM = SUBSTRing(@CUIl, @I, 1);

		IF (@i = 1 OR @i = 7) 
			SET @RES = @RES + @NUM * 5;
		ELSE IF @I = 2 OR @I = 8
			SET @RES = @RES + @NUM * 4;
		ELSE IF @I = 3 OR @I = 9
			SET @RES = @RES + @NUM * 3;
		ELSE IF @I = 4 OR @I = 10
			SET @RES = @RES + @NUM * 2;
		ELSE IF @I = 5
			SET @RES = @RES + @NUM * 7;
		ELSE IF @I = 6
			SET @RES = @RES + @NUM * 6;
 		SET @i = @i+1; 
	END 

	set @rest = @RES%11;
	SET @DIG = 11 - @rest
	
	if @dig = 11
		set @dig = 0
	
	if @dig = 10
		set @cuilf = @cuil + '-' + 'K'
	ELSE
		set @cuilf = @cuil + '-' + convert(char(1),@dig)	
		--update REMPLES set rut = @cuilf where ltrim(rtrim(Codigo)) = ltrim(rtrim(@codigo))		
		
		INSERT INTO ##RemplesRut VALUES(@rut,@cuilf) 
		
		set @CUILi = @CUILi + 1
		set @cuenta = @cuenta + 1
	
	FETCH NEXT FROM cur_rut
	INTO @rut
  end
close cur_rut
DEALLOCATE cur_rut




 
 
  INSERT INTO @NOMBRETABLAS  SELECT  sysobjects.name AS table_name
		FROM         sysobjects INNER JOIN
			         syscolumns ON sysobjects.id = syscolumns.id INNER JOIN
                     systypes ON syscolumns.xtype = systypes.xtype
		WHERE	     (sysobjects.xtype = 'U') 
					 and (UPPER(syscolumns.name) like upper('Rut')) AND  syscolumns.LENGTH = 12 AND   sysobjects.name  in ('RGRUPFA')
				     ORDER BY sysobjects.name, syscolumns.colid
         

 --SE RECORRE LOS NOMBRES DE LAS TABLAS 
     
     WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0
      BEGIN          
			SET @CONSULTA =   '  UPDATE    ' + (select TOP 1  * FROM @NOMBRETABLAS) +  '  SET  ' + (select TOP 1  * FROM @NOMBRETABLAS) + '.Codigo = ##RemplesRut.codigorutnuevo FROM ##RemplesRut WHERE ##RemplesRut.codigorutantiguo =  ' + (select TOP 1  * FROM @NOMBRETABLAS) + '.CODIGO ' + @CONSULTA
            DELETE FROM @NOMBRETABLAS WHERE Nombretabla =  (select TOP 1  Nombretabla FROM @NOMBRETABLAS)
             
       END   
     EXEC(@CONSULTA)
       
     SET @CONSULTA = ''  


		INSERT INTO @NOMBRETABLAS  SELECT  sysobjects.name AS table_name
				FROM         sysobjects INNER JOIN
						     syscolumns ON sysobjects.id = syscolumns.id INNER JOIN
							 systypes ON syscolumns.xtype = systypes.xtype
				WHERE	     (sysobjects.xtype = 'U') 
							 and (UPPER(syscolumns.name) like upper('RUT')) AND  syscolumns.LENGTH = 12 AND   sysobjects.name  NOT IN ('RGRUPFA')
				ORDER BY	 sysobjects.name, syscolumns.colid
				
      WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0
    
      BEGIN          
			SET @CONSULTA =   '  UPDATE    ' + (select TOP 1  * FROM @NOMBRETABLAS) +  '  SET  ' + (select TOP 1  * FROM @NOMBRETABLAS) + '.RUT = ##RemplesRut.codigorutnuevo FROM ##RemplesRut WHERE ##RemplesRut.codigorutantiguo =  ' + (select TOP 1  * FROM @NOMBRETABLAS) + '.RUT ' + @CONSULTA
            DELETE FROM @NOMBRETABLAS WHERE Nombretabla =  (select TOP 1  Nombretabla FROM @NOMBRETABLAS)      
       END   
       
  EXEC(@CONSULTA)
  PRINT 'Mezclador de Rut finalizado ' + CONVERT(varchar, SYSDATETIME(), 120)
 drop table  ##RemplesRut
 PRINT 'Actualizando Campos basicos ' + CONVERT(varchar, SYSDATETIME(), 120)

DELETE FROM @NOMBRETABLAS 


 INSERT INTO @NOMBRETABLAS  SELECT  sysobjects.name AS table_name
		FROM         sysobjects INNER JOIN
			         syscolumns ON sysobjects.id = syscolumns.id INNER JOIN
                     systypes ON syscolumns.xtype = systypes.xtype
		WHERE	     (sysobjects.xtype = 'U') 
					 and (UPPER(syscolumns.name) like upper('Direccion')) AND  syscolumns.LENGTH = 128
				     ORDER BY sysobjects.name, syscolumns.colid



--Se limpia la variable
SET @CONSULTA = ''
-- Se declara una tabla temporal para la direccion 
DECLARE @EJECUTOR VARCHAR (MAX)
DECLARE @NOMBTABLE VARCHAR(120)
 WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0
 
      BEGIN 
       SET @EJECUTOR = + 'UPDATE  '  + (select TOP 1  Nombretabla FROM @NOMBRETABLAS) + ' SET  DIRECCION = ' + Char(39) + @direccion + ''''
	   SET @NOMBTABLE = (SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS)
	   EXEC (@EJECUTOR)
	  SET @EJECUTOR = ' '  
	   DELETE FROM @NOMBRETABLAS WHERE Nombretabla = @NOMBTABLE
     END 
   

DELETE FROM @NOMBRETABLAS

 INSERT INTO @NOMBRETABLAS  SELECT  sysobjects.name AS table_name
		FROM         sysobjects INNER JOIN
			         syscolumns ON sysobjects.id = syscolumns.id INNER JOIN
                     systypes ON syscolumns.xtype = systypes.xtype
		WHERE	     (sysobjects.xtype = 'U') 
					 and (UPPER(syscolumns.name) like upper('FONO')) AND   syscolumns.LENGTH > 17
				     ORDER BY sysobjects.name, syscolumns.colid


--SE SETEAN LAS VARIABLES
SET @EJECUTOR = ' '
SET @NOMBTABLE = ' '

WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0
 
      BEGIN 
       SET @EJECUTOR = + 'UPDATE  '  + (select TOP 1  Nombretabla FROM @NOMBRETABLAS) + ' SET  FONO = ' + Char(39) + @fono + ''''
	   SET @NOMBTABLE = (SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS)
	   EXEC (@EJECUTOR)
	  SET @EJECUTOR = ' '  
	   DELETE FROM @NOMBRETABLAS WHERE Nombretabla = @NOMBTABLE
     END 
     
 DELETE FROM @NOMBRETABLAS



 INSERT INTO @NOMBRETABLAS  SELECT  sysobjects.name AS table_name
		FROM         sysobjects INNER JOIN
			         syscolumns ON sysobjects.id = syscolumns.id INNER JOIN
                     systypes ON syscolumns.xtype = systypes.xtype
		WHERE	     (sysobjects.xtype = 'U') 
					 and (UPPER(syscolumns.name) like upper('Celular')) and syscolumns.LENGTH > 17
		
				     ORDER BY sysobjects.name, syscolumns.colid


--SE SETEAN LAS VARIABLES
SET @EJECUTOR = ' '
SET @NOMBTABLE = ' '

WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0
 
      BEGIN 
       SET @EJECUTOR = + 'UPDATE  '  + (select TOP 1  Nombretabla FROM @NOMBRETABLAS) + ' SET  Celular = ' + Char(39) + @celular + ''''
	   SET @NOMBTABLE = (SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS)
	   EXEC (@EJECUTOR)
	  SET @EJECUTOR = ' '  
	   DELETE FROM @NOMBRETABLAS WHERE Nombretabla = @NOMBTABLE
     END 
     
DELETE FROM @NOMBRETABLAS
     

 INSERT INTO @NOMBRETABLAS  SELECT  sysobjects.name AS table_name
		FROM         sysobjects INNER JOIN
			         syscolumns ON sysobjects.id = syscolumns.id INNER JOIN
                     systypes ON syscolumns.xtype = systypes.xtype
		WHERE	     (sysobjects.xtype = 'U') 
					 and (UPPER(syscolumns.name) like upper('Celular')) and syscolumns.LENGTH > 17
		
				     ORDER BY sysobjects.name, syscolumns.colid


--SE SETEAN LAS VARIABLES
SET @EJECUTOR = ' '
SET @NOMBTABLE = ' '

WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0
 
      BEGIN 
       SET @EJECUTOR = + 'UPDATE  '  + (select TOP 1  Nombretabla FROM @NOMBRETABLAS) + ' SET  Celular = ' + Char(39) + @celular + ''''
	   SET @NOMBTABLE = (SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS)
	   EXEC (@EJECUTOR)
	  SET @EJECUTOR = ' '  
	   DELETE FROM @NOMBRETABLAS WHERE Nombretabla = @NOMBTABLE
     END 
     
DELETE FROM @NOMBRETABLAS
 
 INSERT INTO @NOMBRETABLAS2  SELECT  sysobjects.name AS table_name  , syscolumns.name
		FROM         sysobjects INNER JOIN
			         syscolumns ON sysobjects.id = syscolumns.id INNER JOIN
                     systypes ON syscolumns.xtype = systypes.xtype
		WHERE	     (sysobjects.xtype = 'U') 
					 and (UPPER(syscolumns.name) like upper('%MAIL%')) and syscolumns.LENGTH > 17
		
				     ORDER BY sysobjects.name, syscolumns.colid


----SE SETEAN LAS VARIABLES
SET @EJECUTOR = ' '
SET @NOMBTABLE = ' '


WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS2 ) > 0
 
      BEGIN 
       SET @EJECUTOR = + 'UPDATE  '  + (select TOP 1  Nombretabla FROM @NOMBRETABLAS2) + ' SET ' +  (SELECT  TOP 1 NombreColum FROM @NOMBRETABLAS2) + ' = ' + CHAR(39) + @mail + CHAR(39)
	   SET @NOMBTABLE = (SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS2)
	 EXEC (@EJECUTOR)
	   DELETE FROM @NOMBRETABLAS2 WHERE Nombretabla = @NOMBTABLE
     END 
     
     
DELETE FROM @NOMBRETABLAS
DELETE FROM @NOMBRETABLAS2

PRINT 'Campos basicos actualizados ' + CONVERT(varchar, SYSDATETIME(), 120)
PRINT 'actualizando Jefes y Autoriza ' + CONVERT(varchar, SYSDATETIME(), 120)
DELETE FROM RPAUSER
DELETE FROM RCONDIS
DELETE FROM RUSUARIO
DELETE FROM RUSUARIOI
DELETE FROM RULTSEL 

INSERT INTO @NOMBRETABLAS  SELECT  sysobjects.name AS table_name
		FROM         sysobjects INNER JOIN
			         syscolumns ON sysobjects.id = syscolumns.id INNER JOIN
                     systypes ON syscolumns.xtype = systypes.xtype
		WHERE	     (sysobjects.xtype = 'U') 
					 and (UPPER(syscolumns.name) like upper('JEFE')) and syscolumns.LENGTH = 12
		
				     ORDER BY sysobjects.name, syscolumns.colid


--SE SETEAN LAS VARIABLES
SET @EJECUTOR = ' '
SET @NOMBTABLE = ' '

WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0

      BEGIN 
       SET @EJECUTOR = + 'UPDATE  '  + (select TOP 1  Nombretabla FROM @NOMBRETABLAS) + ' SET  Jefe = ' + Char(39) + (select Top 1 codigo from REMPLES) + CHAR(39) 
	   SET @NOMBTABLE = (SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS)
	   EXEC (@EJECUTOR)
	  
	  SET @EJECUTOR = ' '  
	   DELETE FROM @NOMBRETABLAS WHERE Nombretabla = @NOMBTABLE
     END 
     
DELETE FROM @NOMBRETABLAS


INSERT INTO @NOMBRETABLAS  SELECT  sysobjects.name AS table_name
		FROM         sysobjects INNER JOIN
			         syscolumns ON sysobjects.id = syscolumns.id INNER JOIN
                     systypes ON syscolumns.xtype = systypes.xtype
		WHERE	     (sysobjects.xtype = 'U') 
					 and (UPPER(syscolumns.name) like upper('Autoriza')) and syscolumns.LENGTH = 12
		
				     ORDER BY sysobjects.name, syscolumns.colid


--SE SETEAN LAS VARIABLES
SET @EJECUTOR = ' '
SET @NOMBTABLE = ' '

WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0

      BEGIN 
       SET @EJECUTOR = + 'UPDATE  '  + (select TOP 1  Nombretabla FROM @NOMBRETABLAS) + ' SET  Autoriza = ' + Char(39) + (select Top 1 codigo from REMPLES) + CHAR(39) 
	   SET @NOMBTABLE = (SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS)
	   EXEC (@EJECUTOR)
	  
	  SET @EJECUTOR = ' '  
	   DELETE FROM @NOMBRETABLAS WHERE Nombretabla = @NOMBTABLE
     END 
     
DELETE FROM @NOMBRETABLAS


DELETE FROM RUSUARIOS 
DELETE FROM RSEGGRUP WHERE Grupo = 'FULLADMIN'
DELETE FROM RPERFILES WHERE Perfil = 'FULLADMIN'

INSERT INTO RSEGGRUP([Grupo],[Nombre],[Empresas],[Ngrab],[Jdd])
VALUES('FULLADMIN ','Full Administrador            ','',0,0);

INSERT INTO RPERFILES([Jdd],[Perfil],[Descrip],[Dato])
VALUES(0,'FULLADMIN   ','Full Administrador            ','QiTVGvXocg1ihX660nkltMGu7RgPs78n        ');

INSERT INTO RUSUARIOS([jdd],[Usuario],[Estado],[Descrip],[Dato],[Historia],[Fecha_exp],[perfil]
           ,[mail],[Empresa],[Ubica],[Intentos],[Sele],[Antig])
VALUES(0,'ADMIN       ','A','Administrador Sistema         ','gHAUwsJHp8BnSqNpMqjy5BpRYW9oYexJDlW2C3cChr2L0w5MZmpi1/Jb6z0UgSaRZAi0g4SDauSlScFUUE/BbEZwwcAf119dll2K7M2H1uMk0AupJViGQqlo/CsbAvXE/Mngw1BRITyfAnnMRMzKeVzwSRqB4zKR0COx66SQNUw=                                                                              ','','3000-01-01 00:00:00.000','FULLADMIN   '
,'example@adp.com','  1',1,0,'E','A');


INSERT INTO @NOMBRETABLAS  SELECT  sysobjects.name AS table_name
		FROM         sysobjects INNER JOIN
			         syscolumns ON sysobjects.id = syscolumns.id INNER JOIN
                     systypes ON syscolumns.xtype = systypes.xtype
		WHERE	     (sysobjects.xtype = 'U') 
					 and (UPPER(syscolumns.name) like upper('usuario'))
		
				     ORDER BY sysobjects.name, syscolumns.colid


--SE SETEAN LAS VARIABLES
SET @EJECUTOR = ' '
SET @NOMBTABLE = ' '

WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0

      BEGIN 
       SET @EJECUTOR = + 'UPDATE  '  + (select TOP 1  Nombretabla FROM @NOMBRETABLAS) + ' SET  USUARIO = ' + Char(39) + 'ADMIN' + CHAR(39) 
	   SET @NOMBTABLE = (SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS)
	   EXEC (@EJECUTOR)
	  
	  SET @EJECUTOR = ' '  
	   DELETE FROM @NOMBRETABLAS WHERE Nombretabla = @NOMBTABLE
     END 
     
DELETE FROM @NOMBRETABLAS
PRINT 'Jefes y Autorizadores actualizado ' + CONVERT(varchar, SYSDATETIME(), 120)

INSERT INTO @NOMBRETABLAS  SELECT Empresa FROM REMPRESA 

SET @CONTADOR = 1

WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0
	  BEGIN 
	   SET @EJECUTOR = + ' UPDATE REMPRESA SET NOMBRE = ''' + ('EMPRESA ')  + CONVERT(VARCHAR,@CONTADOR) + ''' WHERE EMPRESA = ' + (select TOP 1  Nombretabla FROM @NOMBRETABLAS) 
	   SET @EJECUTOR = @EJECUTOR + ' UPDATE REMPRESA SET RUT ='+CHAR(39)+SPACE(12-LEN((SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS)+'-'+CONVERT(VARCHAR,@CONTADOR)))+(SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS)+'-'+CONVERT(VARCHAR,@CONTADOR)+CHAR(39) + ' WHERE EMPRESA =' + (SELECT TOP 1 Nombretabla FROM @NOMBRETABLAS)
	   EXEC (@EJECUTOR)
	   SET @NOMBTABLE = (SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS)
	  
	   SET @EJECUTOR = ' '
	   SET  @CONTADOR  = @CONTADOR + 1
	   DELETE FROM @NOMBRETABLAS WHERE Nombretabla =  @NOMBTABLE 
	 
	  END			     
				     		     
UPDATE REMPRESA SET mailRRHH = CHAR(39)+@mail+CHAR(39) , mailRegi = CHAR(39)+@mail + CHAR(39) , EMAIL = CHAR(39)+@mail + CHAR(39) 
UPDATE REMPRESA SET AutRRHH = (SELECT Top 1 JEFE FROM REMPLES)
UPDATE REMPRESA SET Fono = @fono

PRINT ' Se finalizo el mezclador de la base de datos ' + CONVERT(varchar, SYSDATETIME(), 120)


