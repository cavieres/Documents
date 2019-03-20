[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.ConnectionInfo")
[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo")

$serverName= "localhost\SQLEXPRESS"
$username = "sa"
$passowrd = "payroll"
$dbName = "Auth"
#set the credentials
$connection = new-object Microsoft.SqlServer.Management.Common.ServerConnection
$connection.LoginSecure = $FALSE
$connection.Login = $username
$connection.Password = $passowrd
$connection.ServerInstance = $serverName
#Connect to the local, default instance of SQL Server
$server = new-object Microsoft.SqlServer.Management.Smo.Server($connection)

#Create a new database
$db = New-Object -TypeName Microsoft.SqlServer.Management.Smo.Database -argumentlist $server, $dbName
$test = $server.Databases
If ($server.Databases.Contains($dbName)) { $server.KillDatabase($dbName) }
$db.Create()

#Reference the database and display the date when it was created.
$db = $server.Databases[$dbName]
$db.CreateDate
