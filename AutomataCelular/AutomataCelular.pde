/**
 Abstraccion de un automata celular
 
 Jose David Ramirez Rojas
 */
class AutomataCel {

  int[] celdas;  
  int[] reglas;  
  int generacion;  

  AutomataCel(int[] r) {
    reglas = r;
    celdas = new int[width];  // hay tantas celdas como el tamaño de la pantalla donde se vea
    restart();
  }
  
  void randomize() {
    for (int i = 0; i < 8; i++) {
      reglas[i] = int(random(2)); // aleatorizamos el valor de las reglas
    }
  }
  
  void restart() {
    for (int i = 0; i < celdas.length; i++)
      celdas[i] = 0;
      
    generacion = 0;
    celdas[celdas.length/2] = 1; // inicializamos la primera generación con el bit de en medio encendido
  }
  
  void render() {
    for (int i = 0; i < celdas.length; i++) {
      if (celdas[i] == 1) {
        fill(255);  // llenamos con blanco con donde el automata sea 1
      } else { 
        fill(5);  //llenamos con negro (gris oscuro)
      }
      noStroke(); // para que se vean las celdas
      rect(i,generacion, 1, 1); // dibujamos la celda en las posiciones (x,y) = (i,generacion) con alto y ancho = 1
    }
  }

  void genera() {
    int[] nextGen = new int[celdas.length]; //creamos una nueva generacion
    
    for (int i = 1; i < celdas.length-1; i++) { 
      // empezando por la segunda celda hasta la penultima vemos los vecinos
      int izq = celdas[i-1];   
      int actual = celdas[i];       
      int der = celdas[i+1]; 
      if (izq == 0 && actual == 0 && der == 0) { nextGen[i] = reglas[0]; } //aplicamos reglas
      if (izq == 0 && actual == 0 && der == 1) { nextGen[i] = reglas[1]; }
      if (izq == 0 && actual == 1 && der == 0) { nextGen[i] = reglas[2]; }
      if (izq == 0 && actual == 1 && der == 1) { nextGen[i] = reglas[3]; }
      if (izq == 1 && actual == 0 && der == 0) { nextGen[i] = reglas[4]; }
      if (izq == 1 && actual == 0 && der == 1) { nextGen[i] = reglas[5]; }
      if (izq == 1 && actual == 1 && der == 0) { nextGen[i] = reglas[6]; }
      if (izq == 1 && actual == 1 && der == 1) { nextGen[i] = reglas[7]; }
    }
    for (int i = 1; i < celdas.length-1; i++) {
      celdas[i] = nextGen[i];
    }
    generacion++;
  }
  
  boolean ultimaGeneracion() {
    if (generacion > height) {
       return true; // paramos con tantas generaciones como la pantalla permita
    } else {
       return false;
    }
  }
}
