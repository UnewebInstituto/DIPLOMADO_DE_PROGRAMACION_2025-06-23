function cambiar(){ var elemento= document.getElementById('clave');
    var imagen=document.getElementById('ojo');
    console.log(elemento.value);
    if (elemento.type=='password'){
        elemento.type='text'
        imagen.src='../img/nover.png'   
    } else{ 
        elemento.type='password';
        imagen.src='../img/ver.png' 
   }

 }