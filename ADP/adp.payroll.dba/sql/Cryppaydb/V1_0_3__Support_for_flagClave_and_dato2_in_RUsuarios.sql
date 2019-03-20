/****** Object:  Table [dbo].[RUSUARIOS]    Script Date: 05/12/2016 10:43:59 ******/
/****** Description:  Creating columns: flagClave, dato2 in table RUsuarios, Domain DB.
to fix bug in eXpert creation user (N&S) funcitonality. ******/

ALTER TABLE RUsuarios
ADD [flagClave] [tinyint]

ALTER TABLE RUsuarios
ADD [dato2] [char](40)