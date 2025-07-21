const miVideo = document.getElementById('miVideo');
const miAudio = document.getElementById('miAudio');

// Cuando el video empieza a reproducirse, también lo hace el audio
miVideo.addEventListener('play', () => {
  miAudio.play();
});

// Cuando el video se pausa, también lo hace el audio
miVideo.addEventListener('pause', () => {
  miAudio.pause();
});

// Para mantener la sincronización si el usuario busca en el video
miVideo.addEventListener('seeking', () => {
  miAudio.currentTime = miVideo.currentTime;
});

// Para asegurarse de que el audio se detenga cuando el video termine
miVideo.addEventListener('ended', () => {
  miAudio.pause();
  miAudio.currentTime = 0; // Reinicia el audio si es necesario
});

// Opcional: Si quieres que el audio controle el video (menos común)
// miAudio.addEventListener('play', () => {
//   miVideo.play();
// });
// miAudio.addEventListener('pause', () => {
//   miVideo.pause();
// });
// miAudio.addEventListener('seeking', () => {
//   miVideo.currentTime = miAudio.currentTime;
// });