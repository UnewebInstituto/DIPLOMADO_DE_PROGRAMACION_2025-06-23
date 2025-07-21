<?php

//DECLARACION DE VARIBALES
  $servidor = 'localhost';
  $usuario = 'root';
  $clave = '';
  $bd = 'bd_reinaldo_20250714';
  //ESTABLECIMIENTO DE CONEXION
  $enlace = mysqli_connect($servidor,$usuario,
  $clave,$bd);
  //SE VERIFICA LA CONEXION
  if ($enlace){
    echo "conexion existosa.\n ";
  } else{
    echo "error de conexion.\n";
  }
  $sql = "SELECT nombre, correo_electronico FROM proveedores";
  $resultado = mysqli_query($enlace, $sql);
  while ($data = mysqli_fetch_array($resultado)){
    echo $data['nombre'] . ", " . $data['correo_electronico'] 
    . "\n";
  }
  echo "fin del programa.";
?>