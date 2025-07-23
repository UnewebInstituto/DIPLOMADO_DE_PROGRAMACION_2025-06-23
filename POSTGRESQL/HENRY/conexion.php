<?php
    // Declaración de variables
    $datos_de_la_conexion = "host=localhost port=5432 dbname=bd_henry_20250721 user=postgres password=123456";
    // Establecimiento de conexión
    $enlace = pg_connect($datos_de_la_conexion);
    // Se verifica la conexión
    if ($enlace){
        echo "Conexión exitosa.\n";
    }else{
        echo "Error en conexión.\n";
    }
    $sql = "SELECT * FROM vista_prov_prod_inner_join";
    $resultado = pg_query($enlace, $sql);
    echo "Consulta vista proveedores y productos.\n";
    while ($data = pg_fetch_array($resultado)){
        echo $data['proveedor'] . ", " . $data['contacto'] . ", " .$data['telefono'] . ", " . $data['producto'] . ", " . $data['precio'] ."\n";
    }
      echo "Fin del programa de conexión.\n";
?>