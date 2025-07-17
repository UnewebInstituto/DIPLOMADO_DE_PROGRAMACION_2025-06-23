<?php
//declaracion de variable
$servidor = "localhost";
$usuario = "root";
$clave = "";
$bd = "bd_alejandro_20250714";
//etablecimiento de conexion
$enlace = mysqli_connect($servidor,$usuario,$clave,$bd);
// se verifica la conexion
if ($enlace){
    echo "conexion exitosa.\n";

}else{
    
echo "error de conexion.\n";

}
$sql = "select nombre, correo_electronico from proveedores";
$resultado = mysqli_query($enlace, $sql);
echo "consulta de proveedores.\n";
while ($data =mysqli_fetch_array($resultado)){
    echo $data["nombre"] . "," .$data["correo_electronico"] . "\n";
}

    echo "fin del programa de conexion.\n";




?>