/**
 * Ejecución de Automata 1D (Automata Celular)
 * 
 * Permite guardar una imagen con un automata celular generado aleatoriamente
 */
 
AutomataCel automata; 
PrintWriter output;

void setup() {
  size(1000, 600);
  frameRate(24);
  int[] rules = new int[8]; 
   for (int i = 0; i < 8; i++) {
      rules[i] = int(random(2)); // aleatorizamos el valor de la regla inicial
    }
  automata = new AutomataCel(rules);  
  background(0);
  output = createWriter("regla_usada.txt");
}

void draw() {
  automata.render();  // dibujamos 
  automata.genera();  // creamos nuevas generaciones
  
  if(automata.ultimaGeneracion()){
    // si se deja correr la animacion hasta la última generacion se guarda la imagen del automata
    save("automata_celular.jpg");  
    noLoop(); // detenemos la generación
    // reportamos que regla se usó en el automata generado
    output.println("000 -> " + automata.reglas[0]);
    output.println("001 -> " + automata.reglas[1]);
    output.println("010 -> " + automata.reglas[2]);
    output.println("011 -> " + automata.reglas[3]);
    output.println("100 -> " + automata.reglas[4]);
    output.println("101 -> " + automata.reglas[5]);
    output.println("110 -> " + automata.reglas[6]);
    output.println("111 -> " + automata.reglas[7]); 
    output.flush();  // escribimos y guardamos al archivo
    output.close(); // cerramos el archivo
  }
    
}

void mousePressed() {
  background(0);
  automata.randomize();
  automata.restart(); // al hacer clic se genera otro automata con otras reglas (aleatorias)
  output = createWriter("regla_usada.txt"); //reabrimos el archivo para escribir la nueva regla
  loop(); //reanudamos el método draw()
}
