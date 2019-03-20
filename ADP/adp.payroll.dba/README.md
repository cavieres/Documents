# Payroll DB Manteinance

The objective of this repository is to orchestrate Database Administration, organizing changes in incremental updates.

## Migrations??

Migrations are a structured way to alter your database schema and are an alternative to creating lots of sql scripts that have to be run manually by every developer involved. Migrations solve the problem of evolving a database schema for multiple databases (for example, the developer’s local database, the test database and the production database).

## Tools

- flyway (https://flywaydb.org/getstarted/why)
- Powershell

## Versioning

Versioning starts with a root script. The goal of this script is to create the entire database (schema and data), for an specific environment.

## Getting started

- #### Clone the repository:
	`git clone <repo_url>`
- #### Change your local SQL SERVER 'sa' user password to 'payroll'
- #### run (use gitbash command prompt):
	`sh install-flyway.sh`
- #### copy the sqljdbc_auth.dll (\adp.payroll.dba\thirdparty\apps\flyway-4.0\drivers) in C:\Windows\System32
- #### Open a Powershell console (x86, Administrator mode), and give permissions over script ejecution:
	`set-executionpolicy remotesigned`
- #### Enable TCP/IP protocol in SQL Server Configuration Manager.
    - Start > All Programs > Microsoft SQL Server > Configuration Tools > Sql Server Configuration Manager
    - SQL Server Configuration Manager (Local) sidebar > SQL Server Network Configuration > Protocols for SQL
    - In list, enable TCP/IP protocol.
- #### Restart SQL Server services:
    - SQL Server Browser
    - SQL Server
- #### Open each DB script file desired to replicate.
- #### Whether it has, set SQL Server instance name in scripts.
    - When apply and adding the following instruction:

        `instanceName=SQLSERVERINSTANCENAME;`
    - Or add:
        `$serverName= "localhost\SQLSERVERINSTANCENAME"`
- #### Ensure that T-SQL files inside folder ´.\sql\<db-to-replicate>\´ are set with UTF-8 codification.
- #### Run migration scripts (in Powershell):
	- eXpert Chile
		- `.\scripts\migrateBASE0.ps1` setting up the dataset db.
		- `.\scripts\migrateCrypay.ps1` setting up the domain db.
	- eXpert Argentina
		- `.\scripts\migrateBASE0AR.ps1` setting up the dataset db.
		- `.\scripts\migrateCrypayAR.ps1` setting up the domain db.
	- N&S Mapping DB.
	- `.\scripts\migrateAuth.ps1` setting up the auth db.
- #### Crypted string connection, useful for configuration purposes (Web.config/settings.conf):
	- Auth: `f488m0WhtXwgjQIuDY2Bw0IBZddePmx1PZ3LInYmu2M5xFbrBid9BU0thy0u7Wm/KT+3HhGhnbLgIH1xpH7YHkBzBwu30mOZ`
	- Dataset (PAYROLLLOCAL): `f488m0WhtXwgjQIuDY2Bw0IBZddePmx1PZ3LInYmu2Oai4tv0MetCJ8wo6yLF5sBNMaXTU5/D5aDLmTsqWnR+rwTgSEicI221ur9IHiwC2o=`

### New changes to DB

Following changes in BD schema, must be done by an script, that executes a specific maintenance function in DB.

Structure and name versioning follows this rule:

`<version>__<description>.sql`
- Example:
 The sql scripts are stored at the follow path (in this case for dataset):
	- sql/BASE0db:
		- `V1__schema.sql`
		- `V2__data.sql`
		- `V3__update_for_local.sql`
