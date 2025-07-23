<?php

//DECLARACION DE VARIBALES
  $datos_de_la_conexion = "host=localhost port=5432 dbname=bd_reinaldo_20250721 user=postgres password=123456";
  //ESTABLECIMIENTO DE CONEXION
  $enlace = pg_connect($datos_de_la_conexion);
  //SE VERIFICA LA CONEXION
  if ($enlace){
    echo "conexion existosa.\n ";
  } else{
    echo "error de conexion.\n";
  }
  $sql = "SELECT * FROM vista_prov_prod_inner_join";
  $resultado = pg_query($enlace, $sql);
    echo "consulta vista proveedores y productos.\n";
  while ($data = pg_fetch_array($resultado)){
    echo $data['proveedor'] . ", " . $data['contacto'] . "," . $data['telefono'] . ", " . $data['producto'] . ", " . $data['precio'] . "\n";
  }
  echo "fin del programa.";
?>


