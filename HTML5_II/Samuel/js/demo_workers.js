//Declaracion de variable publica
var i = 0;
//Declaracion de funcion
function timedCount(){
  // Se incrementa i en 1
  i = i +1;
  // Se devuelve en un mensaje el contenido de i
  postMessage(i);
  // Se espera 1/2 segundo y ejecuta la
  // Funcion timedCount()
  setTimeout("timedCount()",500);
}
// Al primer llamado ejecuta
// de inmediato la funcion timeCount()
timedCount();