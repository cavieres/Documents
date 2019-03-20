.\scripts\createDatabaseBASE0.ps1
$flyway = ".\thirdparty\apps\flyway-4.0\flyway" 
$flyway_arg1 = "-configFile=conf/BASE0db.conf"
$flyway_arg2 = "migrate"
& $flyway $flyway_arg1 $flyway_arg2
# TODO: if ($LastExitCode -ne 0) { ... handle error ... }