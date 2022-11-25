/**
 * Ejecución de Random Boolean Network de Stuart A.Kauffman 
 * 
 * Permite guardar una imagen con una RBN generada aleatoriamente
 */
 
RBNet net; 
PrintWriter output;

void setup() {
  size(1170, 550);
  frameRate(24);
  int[] rules = new int[8]; 
  int[][] network = new int[20][4]; 
   for (int i = 0; i < 8; i++) {
      rules[i] = int(random(2)); // aleatorizamos el valor de la regla inicial
    }
  for (int i = 0; i < 20; i++) 
      for (int j = 0; j < 4; j++)
        if (j == 0)
          network[i][j] = int(random(2)); // aleatorizamos el valor inicial del nodo
        else
          network[i][j] = int(random(20)); // aleatorizamos las referencias a otros nodos  
  net = new RBNet(rules, network);  
  background(0);
  output = createWriter("regla_usada.txt");
}

void draw() {
  net.render();  // dibujamos 
  net.generate();  // creamos nuevas generaciones
  
  if(net.lastGen()){
    // si se deja correr la animacion hasta la última generacion se guarda la imagen del automata
    save("random_boolean_net.jpg");  
    noLoop(); // detenemos la generación
    // reportamos que regla se usó en el automata generado
    output.println("000 -> " + net.reglas[0]);
    output.println("001 -> " + net.reglas[1]);
    output.println("010 -> " + net.reglas[2]);
    output.println("011 -> " + net.reglas[3]);
    output.println("100 -> " + net.reglas[4]);
    output.println("101 -> " + net.reglas[5]);
    output.println("110 -> " + net.reglas[6]);
    output.println("111 -> " + net.reglas[7]); 
    output.flush();  // escribimos y guardamos al archivo
    output.close(); // cerramos el archivo
  }
    
}

void mousePressed() {
  background(0);
  net.randomizeRules();
  net.randomizeNet();
  net.restart(); // al hacer clic se genera otro automata con otras reglas (aleatorias)
  output = createWriter("regla_usada.txt"); //reabrimos el archivo para escribir la nueva regla
  loop(); //reanudamos el método draw()
}
