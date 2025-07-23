<?php
//declaracion de variable
$datos_de_la_conexion = "host=localhost port=5432 dbname=bd_alejandro_20250721 user=postgres password=123456";
//etablecimiento de conexion
$enlace = pg_connect($datos_de_la_conexion);
// se verifica la conexion
if ($enlace){
    echo "conexion exitosa.\n";

}else{
    
echo "error de conexion.\n";

}
$sql = "SELECT * from vista_prov_prod_inner_join";
$resultado = pg_query($enlace, $sql);
echo "consulta vista proveedores y productos .\n";
while ($data =pg_fetch_array($resultado)){
    echo $data["proveedor"] . "," .$data["contacto"] ."," .$data["telefono"] . "," .$data["producto"] ."," .$data["precio"]."\n";
}

    echo "fin del programa de conexion.\n";




?>