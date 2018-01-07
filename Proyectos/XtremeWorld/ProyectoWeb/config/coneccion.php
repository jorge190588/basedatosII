<?php 
$serverName = 'HP\SQLEXPRESS';
$connectionInfo = array(
    "Database"=>"XtremeWorld", 
    "UID"=>"acceso", 
    "PWD"=>"proyecto1", 
    "CharacterSet"=>"UTF-8");

$conn = sqlsrv_connect($serverName, $connectionInfo);

/*
if($conn_sis) {
    echo "conexion exitosa";
} else {
    echo "fallo en la coneccion";
    die(print_r(sqlsrv_errors(), true));
}
*/
