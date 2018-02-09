<?php 
$serverName = 'HP\SQLEXPRESS';
$connectionInfo = array(
    "Database"=>"XtremeWorld", 
    "UID"=>"[usuario]", 
    "PWD"=>"[contraseña]", 
    "CharacterSet"=>"UTF-8");

$conn = sqlsrv_connect($serverName, $connectionInfo);


