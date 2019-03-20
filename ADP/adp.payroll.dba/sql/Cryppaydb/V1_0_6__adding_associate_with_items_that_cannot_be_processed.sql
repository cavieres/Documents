/*
Date: 01-06-2017
Description: adding a batch process to execute a massive termination with an employee.
*/

USE [Cryppay]

INSERT INTO rbatch (Estado, JuegoDatos, Usuario, Path, Llamador, Llamado, Fecha, Params, Jdd, ProcessId, IdLauncher, JobId)
VALUES('F', 'BASE0           ', 'ADMIN       ', 'C:\Payroll4', 'RFINIQ', 'RFINIQ', '2017-01-04 17:02:08.000', 'null;M;null;False;0;False;0;01-01-1900;31-08-2014;01-01-1900;01-01-1900;9999;True;9999;9999;null;9999;True;True;False;False;False;False;True;0;0;False;False;False;False;False;False;-1;False;0;False;False;False;False;False;False;False;False;False;False;False;-1;0;12;True', '0', '0', '25084', '5D782512-F4C1-4F10-BD62-3FDB6355F7A2')