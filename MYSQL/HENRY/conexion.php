<?php
    // Declaración de variables
    $servidor = 'localhost';
    $usuario = 'root';
    $clave = '';
    $bd = 'bd_henry_20250714';
    // Establecimiento de conexión
    $enlace = mysqli_connect($servidor, $usuario, $clave, $bd);
    // Se verifica la conexión
    if ($enlace){
        echo "Conexión exitosa.\n";
    }else{
        echo "Error en conexión.\n";
    }
    $sql = "SELECT nombre, correo_electronico FROM proveedores";
    $resultado = mysqli_query($enlace, $sql);
    echo "Consulta de proveedores.\n";
    while ($data = mysqli_fetch_array($resultado)){
        echo $data['nombre'] . ", " . $data['correo_electronico'] . "\n";
    }
      echo "Fin del programa de conexión.\n";
?>