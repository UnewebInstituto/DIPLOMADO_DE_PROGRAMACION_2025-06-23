
    // declaracion de variable publica
    var i = 0;

function timedCount(){
    //se incrementa i en 1
    i = i + 1;
    //se devuelve en un mensaje el contenido i
    postMessage(i);
    // se espera 1/2 segundo y ejecuta la
    //funcion timedCount()
    setTimeout("timedCount()",500);
    }



//al primer llamado ejecuta
//de inmediato la funcion timeCount()
timedCount();
