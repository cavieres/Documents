-------------------------------------------------------------------------------
-- ANONYMIZER DATA BASE V1.3
-- FECHA: 2017-16-05
-- DESCRIPCION:
-- - SE AGREGA COMPATIBILIDAD CON DBS DE CLIENTES ARGENTINA.
-- LA BASE QUEDA EN MODO SINGLE, TIENE QUE SER LO PRIMERO PARA QUE NO GUARDE LOG
-- SE BORRA INFORMACION DE LAS TABLAS QUE NO SON NECESARIAS
-------------------------------------------------------------------------------
DECLARE @NAMEDB VARCHAR(200)
SELECT @NAMEDB = CHAR(91) +  DB_NAME() + CHAR(93)

EXECUTE ('ALTER DATABASE' + @NAMEDB + ' SET RECOVERY SIMPLE WITH NO_WAIT')

-- SE ELIMINA EL RLOG YA QUE NO ES NECESARIO EN ESTA ETAPA 
SET NOCOUNT ON
DECLARE @CONSULTA VARCHAR(MAX) = ''
DECLARE @NOMTABLE VARCHAR(MAX)
 
  DECLARE @NOMBRETABLAS TABLE (
	 	NOMBRETABLA VARCHAR(50))
 
 DECLARE @NOMBRETABLAS2 TABLE(
 NOMBRETABLA VARCHAR(50),
 NOMBRECOLUM VARCHAR(120)
 )


DECLARE @LOGNAME VARCHAR(MAX)
SELECT  @LOGNAME=   NAME FROM SYS.MASTER_FILES WHERE DATABASE_ID = DB_ID()  AND TYPE = 1
SELECT @LOGNAME
DBCC SHRINKFILE (@LOGNAME , 10 )


PRINT 'INICIANDO EL MEZCLADOR DE BASE '  + CONVERT(VARCHAR, SYSDATETIME(), 120)


PRINT 'BORRANDO LOG ' + CONVERT(VARCHAR, SYSDATETIME(), 120)

IF OBJECT_ID('RLOG') IS NOT NULL
BEGIN
	TRUNCATE TABLE RLOG;
END


IF OBJECT_ID('REVENTOS') IS NOT NULL
BEGIN
	TRUNCATE TABLE REVENTOS;
END

PRINT 'LOG BORRADO ' + CONVERT(VARCHAR, SYSDATETIME(), 120)


DECLARE @FECHAISO DATE
DECLARE @AMESFINAL VARCHAR(6)
SELECT @FECHAISO = SUBSTRING(PARAM,7,4) + SUBSTRING(PARAM,4,2) + '01' FROM RPARAMS 
WHERE COPAR = 'CONFIGUR'
SELECT  @AMESFINAL = SUBSTRING(CONVERT(VARCHAR(122),DATEADD(YY, -3, @FECHAISO)),1,4) + SUBSTRING(CONVERT(VARCHAR(122),DATEADD(YY, -3, @FECHAISO)),6,2)

PRINT 'BORRANDO INFORMACION HISTORICA DE : RLIQUID,REMPLESH,RAFECTOS,RMAPITMH,RESUMEN,RBATCHFINIQ,TBCASLIQ ' + CONVERT(VARCHAR, SYSDATETIME(), 120)

IF OBJECT_ID('REMPLAN') IS NOT NULL
BEGIN
	TRUNCATE TABLE REMPLAN;
END

IF OBJECT_ID('REMPLAN') IS NOT NULL
BEGIN
	TRUNCATE TABLE REMPLAN;
END

IF OBJECT_ID('RBATCHFINIQ') IS NOT NULL
BEGIN
	TRUNCATE TABLE RBATCHFINIQ;
END

IF OBJECT_ID('TBCASLIQ') IS NOT NULL
BEGIN
	TRUNCATE TABLE TBCASLIQ;
END


IF OBJECT_ID('RLIQUID') IS NOT NULL
BEGIN
	DELETE FROM RLIQUID WHERE AMES < @AMESFINAL;
END

IF OBJECT_ID('REMPLESH') IS NOT NULL
BEGIN
	DELETE FROM REMPLESH WHERE AMES < @AMESFINAL;
END


IF OBJECT_ID('RAFECTOS') IS NOT NULL
BEGIN
	DELETE FROM RAFECTOS WHERE AMES < @AMESFINAL;
END

IF OBJECT_ID('RMAPITMH') IS NOT NULL
BEGIN
	DELETE FROM RMAPITMH WHERE AMES < @AMESFINAL;
END

IF OBJECT_ID('RESUMEN') IS NOT NULL
BEGIN
	DELETE FROM RESUMEN WHERE AMES < @AMESFINAL;
END


PRINT 'SE BORRO LA INFORMACION DE: RLIQUID,REMPLESH,RAFECTOS,RMAPITMH,RESUMEN PARA EL AMES: '+ @AMESFINAL + CHAR(32) + CONVERT(VARCHAR, SYSDATETIME(), 120)
 
 
PRINT 'MEZCLANDO CODIGOS Y NOMBRES ' + CONVERT(VARCHAR, SYSDATETIME(), 120)

SET NOCOUNT ON 
DECLARE @CONTADOR  INT = 0

IF OBJECT_ID('TEMPDB..##REMPLESCODIGO') IS NOT NULL
BEGIN
	DROP TABLE ##REMPLESCODIGO;
END

-- GETTING DB COLLATION FOR WORKING DB.
DECLARE @CURRENTDBCOLLATION VARCHAR(MAX)
SET @CURRENTDBCOLLATION = (SELECT COLLATION_NAME FROM SYS.DATABASES 
WHERE NAME = (SELECT DB_NAME() AS [CURRENT DATABASE]));

-- CREATING ASSOCIATE'S TEMPORARY TABLE.
DECLARE @CREATETEMPTABLESCRIPT NVARCHAR(MAX);
SET @CREATETEMPTABLESCRIPT = 'CREATE TABLE ##REMPLESCODIGO (
	CODIGOREMPLESANTIGUO CHAR(12) COLLATE ' + (SELECT @CURRENTDBCOLLATION) + ' NOT NULL,
	CODIGOREMPLESNUEVO   CHAR(12) COLLATE ' + (SELECT @CURRENTDBCOLLATION) + ' NOT NULL,
	NOMBREREMPLESANTIGUO CHAR(60) COLLATE ' + (SELECT @CURRENTDBCOLLATION) + ' NOT NULL,
	NOMBREREMPLESNUEVO   CHAR(60) COLLATE ' + (SELECT @CURRENTDBCOLLATION) + ' NOT NULL)';
EXEC SP_EXECUTESQL @CREATETEMPTABLESCRIPT;

--CODIGO Y NOMBRE ORDENADO	
DECLARE @CODIGO CHAR(12)
DECLARE @NOMBRE CHAR(60)
DECLARE @LISTACODIGOS TABLE (
CODIGO CHAR(12) NOT NULL PRIMARY KEY ,
NOMBRE CHAR(60) NOT NULL
);

INSERT INTO @LISTACODIGOS 
SELECT CODIGO , NOMBRE  FROM REMPLES 

SET @CONSULTA  = ''

WHILE (SELECT COUNT(*)FROM @LISTACODIGOS ) > 0
BEGIN

SET @CONTADOR = @CONTADOR + 1
-- SE OBTIENE EL PRIMER REGISTRO DE LA TABLA
	SELECT TOP 1 
		 @CODIGO = CODIGO 
	FROM @LISTACODIGOS
	BEGIN  
		INSERT INTO ##REMPLESCODIGO (CODIGOREMPLESANTIGUO,CODIGOREMPLESNUEVO,NOMBREREMPLESANTIGUO,NOMBREREMPLESNUEVO) SELECT TOP 1 CODIGO , SPACE(12 - LEN(@CONTADOR))  + CONVERT(VARCHAR(12),(@CONTADOR)) , NOMBRE, 'APELLIDO' + CONVERT(VARCHAR(12),@CONTADOR) +  '  APELLIDO2, NOMBRE1 NOMBRE2'  FROM @LISTACODIGOS 
	END	
	DELETE FROM @LISTACODIGOS WHERE CODIGO = @CODIGO 
END

--AHORA SE REALIZARA UNA MODIFICACION POR TABLA 

       INSERT INTO @NOMBRETABLAS  SELECT  SYSOBJECTS.NAME AS TABLE_NAME
		FROM         SYSOBJECTS INNER JOIN
			         SYSCOLUMNS ON SYSOBJECTS.ID = SYSCOLUMNS.ID INNER JOIN
                     SYSTYPES ON SYSCOLUMNS.XTYPE = SYSTYPES.XTYPE
		WHERE	     (SYSOBJECTS.XTYPE = 'U') 
					 AND (UPPER(SYSCOLUMNS.NAME) LIKE UPPER('CODIGO')) AND  SYSCOLUMNS.LENGTH = 12 AND   SYSOBJECTS.NAME NOT IN ('RGRUPFA')
				     ORDER BY SYSOBJECTS.NAME, SYSCOLUMNS.COLID
         
         


 --SE RECORRE LOS NOMBRES DE LAS TABLAS 
     
     WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0
      BEGIN          
			SET @CONSULTA =   '  UPDATE    ' + (SELECT TOP 1  * FROM @NOMBRETABLAS) +  '  SET  ' + (SELECT TOP 1  * FROM @NOMBRETABLAS) + '.CODIGO = ##REMPLESCODIGO.CODIGOREMPLESNUEVO FROM ##REMPLESCODIGO WHERE ##REMPLESCODIGO.CODIGOREMPLESANTIGUO =  ' + (SELECT TOP 1  * FROM @NOMBRETABLAS) + '.CODIGO ' + @CONSULTA
            DELETE FROM @NOMBRETABLAS WHERE NOMBRETABLA =  (SELECT TOP 1  NOMBRETABLA FROM @NOMBRETABLAS)
            SET @NOMTABLE =   (SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS)
            PRINT 'ACTUALIZANDO EL CAMPO CODIGO PARA LA TABLA: ' + @NOMTABLE
            EXEC (@CONSULTA)
            SET @CONSULTA = ''
            SET @NOMTABLE = ''
       END   
    
    DELETE FROM @NOMBRETABLAS

       INSERT INTO @NOMBRETABLAS  SELECT  SYSOBJECTS.NAME AS TABLE_NAME
		FROM         SYSOBJECTS INNER JOIN
			         SYSCOLUMNS ON SYSOBJECTS.ID = SYSCOLUMNS.ID INNER JOIN
                     SYSTYPES ON SYSCOLUMNS.XTYPE = SYSTYPES.XTYPE
		WHERE	     (SYSOBJECTS.XTYPE = 'U') 
					 AND (UPPER(SYSCOLUMNS.NAME) LIKE UPPER('NOMBRE')) AND  SYSCOLUMNS.LENGTH > 40  AND   SYSOBJECTS.NAME NOT IN ('RGRUPFA')
				     ORDER BY SYSOBJECTS.NAME, SYSCOLUMNS.COLID


     WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0
      BEGIN          
			SET @CONSULTA =   '  UPDATE    ' + (SELECT TOP 1  * FROM @NOMBRETABLAS) +  '  SET  ' + (SELECT TOP 1  * FROM @NOMBRETABLAS) + '.NOMBRE = ##REMPLESCODIGO.NOMBREREMPLESNUEVO FROM ##REMPLESCODIGO WHERE ##REMPLESCODIGO.NOMBREREMPLESANTIGUO =  ' + (SELECT TOP 1  * FROM @NOMBRETABLAS) + '.NOMBRE ' + @CONSULTA
            DELETE FROM @NOMBRETABLAS WHERE NOMBRETABLA =  (SELECT TOP 1  NOMBRETABLA FROM @NOMBRETABLAS)
            EXEC (@CONSULTA)
           SET @CONSULTA = ''
       END   


 

DROP TABLE ##REMPLESCODIGO

PRINT ' CODIGOS Y NOMBRES FINALIZADOS ' + CONVERT(VARCHAR, SYSDATETIME(), 120)


 
 
PRINT 'INICIANDO MEZCLADOR DE RUT ' + CONVERT(VARCHAR, SYSDATETIME(), 120)

IF OBJECT_ID('TEMPDB..##REMPLESRUT') IS NOT NULL
BEGIN
	DROP TABLE ##REMPLESRUT;
END

-- CREATING ASSOCIATE'S ID TEMPORARY TABLE.
SET @CREATETEMPTABLESCRIPT = 'CREATE TABLE ##REMPLESRUT (
	CODIGORUTANTIGUO CHAR(12) COLLATE ' + (SELECT @CURRENTDBCOLLATION) + ',
	CODIGORUTNUEVO   CHAR(12) COLLATE ' + (SELECT @CURRENTDBCOLLATION) + ' NOT NULL)';
EXEC SP_EXECUTESQL @CREATETEMPTABLESCRIPT;

SET @CODIGO = ''
DECLARE @DIRECCION VARCHAR(128) = 'AV. APOQUINDO            5400  1 1         1LAS CONDES           13                                                             ';
DECLARE @FONO VARCHAR(18) = '+56 2 2483 3000'
DECLARE @CELULAR VARCHAR(18)= '(+569)123456'
DECLARE @MAIL VARCHAR(25) = 'DESARROLLO@ADP.COM'
DECLARE @RUT CHAR(12),@SEXO CHAR(1)
DECLARE @RES INTEGER 
DECLARE @NUM INTEGER
DECLARE @I INTEGER,@DIG INTEGER
DECLARE @CUILF CHAR(12)
DECLARE @REST INTEGER

------------------------------------------------
-- ACTUALIZA DATOS PII EN REMPLES
------------------------------------------------
DECLARE @CUILI BIGINT
DECLARE @CUENTA BIGINT
DECLARE @CUIL CHAR(10)
SET @CUILI = 2010000000
SET @CUENTA = 123456789


DECLARE CUR_RUT CURSOR FOR
SELECT RUT FROM REMPLES 
ORDER BY LEN(FECHA_NAC)

OPEN CUR_RUT

FETCH NEXT FROM CUR_RUT
INTO  @RUT
WHILE @@FETCH_STATUS = 0
BEGIN
			
			
		-- CALCULO NUEVO CUIL
	SET @RES = 0
	IF UPPER(@SEXO) = 'F'
		SET @CUIL = CONVERT(CHAR(10),@CUILI +  700000000 )
	ELSE
		SET @CUIL = CONVERT(CHAR(10),@CUILI)
		
	 SET @I = 1;
	 WHILE @I < 11 
	 BEGIN
		SET @NUM = SUBSTRING(@CUIL, @I, 1);

		IF (@I = 1 OR @I = 7) 
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
 		SET @I = @I+1; 
	END 

	SET @REST = @RES%11;
	SET @DIG = 11 - @REST
	
	IF @DIG = 11
		SET @DIG = 0
	
	IF @DIG = 10
		SET @CUILF = @CUIL + '-' + 'K'
	ELSE
		SET @CUILF = @CUIL + '-' + CONVERT(CHAR(1),@DIG)	
		--UPDATE REMPLES SET RUT = @CUILF WHERE LTRIM(RTRIM(CODIGO)) = LTRIM(RTRIM(@CODIGO))		
		
		INSERT INTO ##REMPLESRUT VALUES(@RUT,@CUILF) 
		
		SET @CUILI = @CUILI + 1
		SET @CUENTA = @CUENTA + 1
	
	FETCH NEXT FROM CUR_RUT
	INTO @RUT
  END
CLOSE CUR_RUT
DEALLOCATE CUR_RUT




 
 
  INSERT INTO @NOMBRETABLAS  SELECT  SYSOBJECTS.NAME AS TABLE_NAME
		FROM         SYSOBJECTS INNER JOIN
			         SYSCOLUMNS ON SYSOBJECTS.ID = SYSCOLUMNS.ID INNER JOIN
                     SYSTYPES ON SYSCOLUMNS.XTYPE = SYSTYPES.XTYPE
		WHERE	     (SYSOBJECTS.XTYPE = 'U') 
					 AND (UPPER(SYSCOLUMNS.NAME) LIKE UPPER('RUT')) AND  SYSCOLUMNS.LENGTH = 12 AND   SYSOBJECTS.NAME  IN ('RGRUPFA')
				     ORDER BY SYSOBJECTS.NAME, SYSCOLUMNS.COLID
         

 --SE RECORRE LOS NOMBRES DE LAS TABLAS 
     
     WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0
      BEGIN          
			SET @CONSULTA =   '  UPDATE    ' + (SELECT TOP 1  * FROM @NOMBRETABLAS) +  '  SET  ' + (SELECT TOP 1  * FROM @NOMBRETABLAS) + '.CODIGO = ##REMPLESRUT.CODIGORUTNUEVO FROM ##REMPLESRUT WHERE ##REMPLESRUT.CODIGORUTANTIGUO =  ' + (SELECT TOP 1  * FROM @NOMBRETABLAS) + '.CODIGO ' + @CONSULTA
            DELETE FROM @NOMBRETABLAS WHERE NOMBRETABLA =  (SELECT TOP 1  NOMBRETABLA FROM @NOMBRETABLAS)
             
       END   
     EXEC(@CONSULTA)
       
     SET @CONSULTA = ''  


		INSERT INTO @NOMBRETABLAS  SELECT  SYSOBJECTS.NAME AS TABLE_NAME
				FROM         SYSOBJECTS INNER JOIN
						     SYSCOLUMNS ON SYSOBJECTS.ID = SYSCOLUMNS.ID INNER JOIN
							 SYSTYPES ON SYSCOLUMNS.XTYPE = SYSTYPES.XTYPE
				WHERE	     (SYSOBJECTS.XTYPE = 'U') 
							 AND (UPPER(SYSCOLUMNS.NAME) LIKE UPPER('RUT')) AND  SYSCOLUMNS.LENGTH = 12 AND   SYSOBJECTS.NAME  NOT IN ('RGRUPFA')
				ORDER BY	 SYSOBJECTS.NAME, SYSCOLUMNS.COLID
				
      WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0
    
      BEGIN          
			SET @CONSULTA =   '  UPDATE    ' + (SELECT TOP 1  * FROM @NOMBRETABLAS) +  '  SET  ' + (SELECT TOP 1  * FROM @NOMBRETABLAS) + '.RUT = ##REMPLESRUT.CODIGORUTNUEVO FROM ##REMPLESRUT WHERE ##REMPLESRUT.CODIGORUTANTIGUO =  ' + (SELECT TOP 1  * FROM @NOMBRETABLAS) + '.RUT ' + @CONSULTA
            DELETE FROM @NOMBRETABLAS WHERE NOMBRETABLA =  (SELECT TOP 1  NOMBRETABLA FROM @NOMBRETABLAS)      
       END   
       
  EXEC(@CONSULTA)
  PRINT 'MEZCLADOR DE RUT FINALIZADO ' + CONVERT(VARCHAR, SYSDATETIME(), 120)
 DROP TABLE  ##REMPLESRUT
 PRINT 'ACTUALIZANDO CAMPOS BASICOS ' + CONVERT(VARCHAR, SYSDATETIME(), 120)

DELETE FROM @NOMBRETABLAS 


 INSERT INTO @NOMBRETABLAS  SELECT  SYSOBJECTS.NAME AS TABLE_NAME
		FROM         SYSOBJECTS INNER JOIN
			         SYSCOLUMNS ON SYSOBJECTS.ID = SYSCOLUMNS.ID INNER JOIN
                     SYSTYPES ON SYSCOLUMNS.XTYPE = SYSTYPES.XTYPE
		WHERE	     (SYSOBJECTS.XTYPE = 'U') 
					 AND (UPPER(SYSCOLUMNS.NAME) LIKE UPPER('DIRECCION')) AND  SYSCOLUMNS.LENGTH = 128
				     ORDER BY SYSOBJECTS.NAME, SYSCOLUMNS.COLID



--SE LIMPIA LA VARIABLE
SET @CONSULTA = ''
-- SE DECLARA UNA TABLA TEMPORAL PARA LA DIRECCION 
DECLARE @EJECUTOR VARCHAR (MAX)
DECLARE @NOMBTABLE VARCHAR(120)
 WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0
 
      BEGIN 
       SET @EJECUTOR = + 'UPDATE  '  + (SELECT TOP 1  NOMBRETABLA FROM @NOMBRETABLAS) + ' SET  DIRECCION = ' + CHAR(39) + @DIRECCION + ''''
	   SET @NOMBTABLE = (SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS)
	   EXEC (@EJECUTOR)
	  SET @EJECUTOR = ' '  
	   DELETE FROM @NOMBRETABLAS WHERE NOMBRETABLA = @NOMBTABLE
     END 
   

DELETE FROM @NOMBRETABLAS

 INSERT INTO @NOMBRETABLAS  SELECT  SYSOBJECTS.NAME AS TABLE_NAME
		FROM         SYSOBJECTS INNER JOIN
			         SYSCOLUMNS ON SYSOBJECTS.ID = SYSCOLUMNS.ID INNER JOIN
                     SYSTYPES ON SYSCOLUMNS.XTYPE = SYSTYPES.XTYPE
		WHERE	     (SYSOBJECTS.XTYPE = 'U') 
					 AND (UPPER(SYSCOLUMNS.NAME) LIKE UPPER('FONO')) AND   SYSCOLUMNS.LENGTH > 17
				     ORDER BY SYSOBJECTS.NAME, SYSCOLUMNS.COLID


--SE SETEAN LAS VARIABLES
SET @EJECUTOR = ' '
SET @NOMBTABLE = ' '

WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0
 
      BEGIN 
       SET @EJECUTOR = + 'UPDATE  '  + (SELECT TOP 1  NOMBRETABLA FROM @NOMBRETABLAS) + ' SET  FONO = ' + CHAR(39) + @FONO + ''''
	   SET @NOMBTABLE = (SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS)
	   EXEC (@EJECUTOR)
	  SET @EJECUTOR = ' '  
	   DELETE FROM @NOMBRETABLAS WHERE NOMBRETABLA = @NOMBTABLE
     END 
     
 DELETE FROM @NOMBRETABLAS



 INSERT INTO @NOMBRETABLAS  SELECT  SYSOBJECTS.NAME AS TABLE_NAME
		FROM         SYSOBJECTS INNER JOIN
			         SYSCOLUMNS ON SYSOBJECTS.ID = SYSCOLUMNS.ID INNER JOIN
                     SYSTYPES ON SYSCOLUMNS.XTYPE = SYSTYPES.XTYPE
		WHERE	     (SYSOBJECTS.XTYPE = 'U') 
					 AND (UPPER(SYSCOLUMNS.NAME) LIKE UPPER('CELULAR')) AND SYSCOLUMNS.LENGTH > 17
		
				     ORDER BY SYSOBJECTS.NAME, SYSCOLUMNS.COLID


--SE SETEAN LAS VARIABLES
SET @EJECUTOR = ' '
SET @NOMBTABLE = ' '

WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0
 
      BEGIN 
       SET @EJECUTOR = + 'UPDATE  '  + (SELECT TOP 1  NOMBRETABLA FROM @NOMBRETABLAS) + ' SET  CELULAR = ' + CHAR(39) + @CELULAR + ''''
	   SET @NOMBTABLE = (SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS)
	   EXEC (@EJECUTOR)
	  SET @EJECUTOR = ' '  
	   DELETE FROM @NOMBRETABLAS WHERE NOMBRETABLA = @NOMBTABLE
     END 
     
DELETE FROM @NOMBRETABLAS
     

 INSERT INTO @NOMBRETABLAS  SELECT  SYSOBJECTS.NAME AS TABLE_NAME
		FROM         SYSOBJECTS INNER JOIN
			         SYSCOLUMNS ON SYSOBJECTS.ID = SYSCOLUMNS.ID INNER JOIN
                     SYSTYPES ON SYSCOLUMNS.XTYPE = SYSTYPES.XTYPE
		WHERE	     (SYSOBJECTS.XTYPE = 'U') 
					 AND (UPPER(SYSCOLUMNS.NAME) LIKE UPPER('CELULAR')) AND SYSCOLUMNS.LENGTH > 17
		
				     ORDER BY SYSOBJECTS.NAME, SYSCOLUMNS.COLID


--SE SETEAN LAS VARIABLES
SET @EJECUTOR = ' '
SET @NOMBTABLE = ' '

WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0
 
      BEGIN 
       SET @EJECUTOR = + 'UPDATE  '  + (SELECT TOP 1  NOMBRETABLA FROM @NOMBRETABLAS) + ' SET  CELULAR = ' + CHAR(39) + @CELULAR + ''''
	   SET @NOMBTABLE = (SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS)
	   EXEC (@EJECUTOR)
	  SET @EJECUTOR = ' '  
	   DELETE FROM @NOMBRETABLAS WHERE NOMBRETABLA = @NOMBTABLE
     END 
     
DELETE FROM @NOMBRETABLAS
 
 INSERT INTO @NOMBRETABLAS2  SELECT  SYSOBJECTS.NAME AS TABLE_NAME  , SYSCOLUMNS.NAME
		FROM         SYSOBJECTS INNER JOIN
			         SYSCOLUMNS ON SYSOBJECTS.ID = SYSCOLUMNS.ID INNER JOIN
                     SYSTYPES ON SYSCOLUMNS.XTYPE = SYSTYPES.XTYPE
		WHERE	     (SYSOBJECTS.XTYPE = 'U') 
					 AND (UPPER(SYSCOLUMNS.NAME) LIKE UPPER('%MAIL%')) AND SYSCOLUMNS.LENGTH > 17
		
				     ORDER BY SYSOBJECTS.NAME, SYSCOLUMNS.COLID


----SE SETEAN LAS VARIABLES
SET @EJECUTOR = ' '
SET @NOMBTABLE = ' '


WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS2 ) > 0
 
      BEGIN 
       SET @EJECUTOR = + 'UPDATE  '  + (SELECT TOP 1  NOMBRETABLA FROM @NOMBRETABLAS2) + ' SET ' +  (SELECT  TOP 1 NOMBRECOLUM FROM @NOMBRETABLAS2) + ' = ' + CHAR(39) + @MAIL + CHAR(39)
	   SET @NOMBTABLE = (SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS2)
	 EXEC (@EJECUTOR)
	   DELETE FROM @NOMBRETABLAS2 WHERE NOMBRETABLA = @NOMBTABLE
     END 
     
     
DELETE FROM @NOMBRETABLAS
DELETE FROM @NOMBRETABLAS2

PRINT 'CAMPOS BASICOS ACTUALIZADOS ' + CONVERT(VARCHAR, SYSDATETIME(), 120)
PRINT 'ACTUALIZANDO JEFES Y AUTORIZA ' + CONVERT(VARCHAR, SYSDATETIME(), 120)
DELETE FROM RPAUSER
DELETE FROM RCONDIS
DELETE FROM RUSUARIO
DELETE FROM RUSUARIOI
DELETE FROM RULTSEL 

INSERT INTO @NOMBRETABLAS  SELECT  SYSOBJECTS.NAME AS TABLE_NAME
		FROM         SYSOBJECTS INNER JOIN
			         SYSCOLUMNS ON SYSOBJECTS.ID = SYSCOLUMNS.ID INNER JOIN
                     SYSTYPES ON SYSCOLUMNS.XTYPE = SYSTYPES.XTYPE
		WHERE	     (SYSOBJECTS.XTYPE = 'U') 
					 AND (UPPER(SYSCOLUMNS.NAME) LIKE UPPER('JEFE')) AND SYSCOLUMNS.LENGTH = 12
		
				     ORDER BY SYSOBJECTS.NAME, SYSCOLUMNS.COLID


--SE SETEAN LAS VARIABLES
SET @EJECUTOR = ' '
SET @NOMBTABLE = ' '

WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0

      BEGIN 
       SET @EJECUTOR = + 'UPDATE  '  + (SELECT TOP 1  NOMBRETABLA FROM @NOMBRETABLAS) + ' SET  JEFE = ' + CHAR(39) + (SELECT TOP 1 CODIGO FROM REMPLES) + CHAR(39) 
	   SET @NOMBTABLE = (SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS)
	   EXEC (@EJECUTOR)
	  
	  SET @EJECUTOR = ' '  
	   DELETE FROM @NOMBRETABLAS WHERE NOMBRETABLA = @NOMBTABLE
     END 
     
DELETE FROM @NOMBRETABLAS


INSERT INTO @NOMBRETABLAS  SELECT  SYSOBJECTS.NAME AS TABLE_NAME
		FROM         SYSOBJECTS INNER JOIN
			         SYSCOLUMNS ON SYSOBJECTS.ID = SYSCOLUMNS.ID INNER JOIN
                     SYSTYPES ON SYSCOLUMNS.XTYPE = SYSTYPES.XTYPE
		WHERE	     (SYSOBJECTS.XTYPE = 'U') 
					 AND (UPPER(SYSCOLUMNS.NAME) LIKE UPPER('AUTORIZA')) AND SYSCOLUMNS.LENGTH = 12
		
				     ORDER BY SYSOBJECTS.NAME, SYSCOLUMNS.COLID


--SE SETEAN LAS VARIABLES
SET @EJECUTOR = ' '
SET @NOMBTABLE = ' '

WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0

      BEGIN 
       SET @EJECUTOR = + 'UPDATE  '  + (SELECT TOP 1  NOMBRETABLA FROM @NOMBRETABLAS) + ' SET  AUTORIZA = ' + CHAR(39) + (SELECT TOP 1 CODIGO FROM REMPLES) + CHAR(39) 
	   SET @NOMBTABLE = (SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS)
	   EXEC (@EJECUTOR)
	  
	  SET @EJECUTOR = ' '  
	   DELETE FROM @NOMBRETABLAS WHERE NOMBRETABLA = @NOMBTABLE
     END 
     
DELETE FROM @NOMBRETABLAS


DELETE FROM RUSUARIOS 
DELETE FROM RSEGGRUP WHERE GRUPO = 'FULLADMIN'
DELETE FROM RPERFILES WHERE PERFIL = 'FULLADMIN'

INSERT INTO RSEGGRUP([GRUPO],[NOMBRE],[EMPRESAS],[NGRAB],[JDD])
VALUES('FULLADMIN ','FULL ADMINISTRADOR            ','',0,0);

INSERT INTO RPERFILES([JDD],[PERFIL],[DESCRIP],[DATO])
VALUES(0,'FULLADMIN   ','FULL ADMINISTRADOR            ','QITVGVXOCG1IHX660NKLTMGU7RGPS78N        ');

INSERT INTO RUSUARIOS([JDD],[USUARIO],[ESTADO],[DESCRIP],[DATO],[HISTORIA],[FECHA_EXP],[PERFIL]
           ,[MAIL],[EMPRESA],[UBICA],[INTENTOS],[SELE],[ANTIG])
VALUES(0,'ADMIN       ','A','ADMINISTRADOR SISTEMA         ','GHAUWSJHP8BNSQNPMQJY5BPRYW9OYEXJDLW2C3CCHR2L0W5MZMPI1/JB6Z0UGSARZAI0G4SDAUSLSCFUUE/BBEZWWCAF119DLL2K7M2H1UMK0AUPJVIGQQLO/CSBAVXE/MNGW1BRITYFANNMRMZKEVZWSRQB4ZKR0COX66SQNUW=                                                                              ','','3000-01-01 00:00:00.000','FULLADMIN   '
,'EXAMPLE@ADP.COM','  1',1,0,'E','A');


INSERT INTO @NOMBRETABLAS  SELECT  SYSOBJECTS.NAME AS TABLE_NAME
		FROM         SYSOBJECTS INNER JOIN
			         SYSCOLUMNS ON SYSOBJECTS.ID = SYSCOLUMNS.ID INNER JOIN
                     SYSTYPES ON SYSCOLUMNS.XTYPE = SYSTYPES.XTYPE
		WHERE	     (SYSOBJECTS.XTYPE = 'U') 
					 AND (UPPER(SYSCOLUMNS.NAME) LIKE UPPER('USUARIO'))
		
				     ORDER BY SYSOBJECTS.NAME, SYSCOLUMNS.COLID


--SE SETEAN LAS VARIABLES
SET @EJECUTOR = ' '
SET @NOMBTABLE = ' '

WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0

      BEGIN 
       SET @EJECUTOR = + 'UPDATE  '  + (SELECT TOP 1  NOMBRETABLA FROM @NOMBRETABLAS) + ' SET  USUARIO = ' + CHAR(39) + 'ADMIN' + CHAR(39) 
	   SET @NOMBTABLE = (SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS)
	   EXEC (@EJECUTOR)
	  
	  SET @EJECUTOR = ' '  
	   DELETE FROM @NOMBRETABLAS WHERE NOMBRETABLA = @NOMBTABLE
     END 
     
DELETE FROM @NOMBRETABLAS
PRINT 'JEFES Y AUTORIZADORES ACTUALIZADO ' + CONVERT(VARCHAR, SYSDATETIME(), 120)

INSERT INTO @NOMBRETABLAS  SELECT EMPRESA FROM REMPRESA 

SET @CONTADOR = 1

WHILE (SELECT COUNT(*)FROM @NOMBRETABLAS ) > 0
	  BEGIN 
	   SET @EJECUTOR = + ' UPDATE REMPRESA SET NOMBRE = ''' + ('EMPRESA ')  + CONVERT(VARCHAR,@CONTADOR) + ''' WHERE EMPRESA = ' + (SELECT TOP 1  NOMBRETABLA FROM @NOMBRETABLAS) 
	   SET @EJECUTOR = @EJECUTOR + ' UPDATE REMPRESA SET RUT ='+CHAR(39)+SPACE(12-LEN((SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS)+'-'+CONVERT(VARCHAR,@CONTADOR)))+(SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS)+'-'+CONVERT(VARCHAR,@CONTADOR)+CHAR(39) + ' WHERE EMPRESA =' + (SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS)
	   EXEC (@EJECUTOR)
	   SET @NOMBTABLE = (SELECT TOP 1 NOMBRETABLA FROM @NOMBRETABLAS)
	  
	   SET @EJECUTOR = ' '
	   SET  @CONTADOR  = @CONTADOR + 1
	   DELETE FROM @NOMBRETABLAS WHERE NOMBRETABLA =  @NOMBTABLE 
	 
	  END			     
				     		     
UPDATE REMPRESA SET MAILRRHH = CHAR(39)+@MAIL+CHAR(39) , MAILREGI = CHAR(39)+@MAIL + CHAR(39) , EMAIL = CHAR(39)+@MAIL + CHAR(39) 
UPDATE REMPRESA SET AUTRRHH = (SELECT TOP 1 JEFE FROM REMPLES)
UPDATE REMPRESA SET FONO = @FONO

PRINT ' SE FINALIZO EL MEZCLADOR DE LA BASE DE DATOS ' + CONVERT(VARCHAR, SYSDATETIME(), 120)