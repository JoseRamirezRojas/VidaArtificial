/**
 Abstraccion de un automata celular
 
 Jose David Ramirez Rojas
 */
class RBNet {

  int[] celdas;  
  int[] reglas; 
  int[][] red;
  int generacion;
  boolean generacionMutada;
  int nodoMutado;

  RBNet(int[] rules, int[][] network) {
    reglas = rules;
    red = network;
    celdas = new int[20];  // hay 20 celdas, cada una es el estado de un nodo de la red
    generacionMutada = false;
    nodoMutado = 9999;
    restart();
  }
  
  void randomizeRules() {
    for (int i = 0; i < 8; i++) {
      reglas[i] = int(random(2)); // aleatorizamos el valor de las reglas
    }
  }
  
  void randomizeNet() {
    for (int i = 0; i < 20; i++) 
      for (int j = 0; j < 4; j++)
        if (j == 0)
          red[i][j] = int(random(2)); // aleatorizamos el valor inicial del nodo
        else
          red[i][j] = int(random(20)); // aleatorizamos las referencias a otros nodos
  }
  
  void restart() {
    for (int i = 0; i < 20; i++)
      celdas[i] = red[i][0];
      
    generacion = 0;
  }
  
  void render() {
    for (int i = 0; i < celdas.length; i++) {
      if (generacionMutada && i == nodoMutado && celdas[i] == 1){
        fill(204, 2, 0);
      }
      else if (generacionMutada && i == nodoMutado && celdas[i] == 0){
        fill(0, 2, 204);
      }
      else if (celdas[i] == 1) {
        fill(250);  // llenamos con blanco con donde el automata sea 1
      } else { 
        fill(10);  //llenamos con negro (gris oscuro)
      } 
      rect(generacion * 15, i * 25, 15, 25); // dibujamos la celda en las posiciones (x,y) = (i,generacion) con alto y ancho = 25 x 15
    }
  }

  void generate() {
    int[] nextGen = new int[20]; //creamos una nueva generacion
    float prob = random(1);
    if (prob > 0.92)
      generacionMutada = true;
    else
      generacionMutada = false;
    if(generacionMutada){
      nodoMutado = int(random(20));
    }
    for (int i = 0; i < 20; i++) { 
      // empezando por la segunda celda hasta la penultima vemos los vecinos
      int edge1 = red[i][1];   
      int edge2 = red[i][2];       
      int edge3 = red[i][3]; 
      if (red[edge1][0] == 0 && red[edge2][0] == 0 && red[edge3][0] == 0) { nextGen[i] = reglas[0]; }
      if (red[edge1][0] == 0 && red[edge2][0] == 0 && red[edge3][0] == 1) { nextGen[i] = reglas[1]; }
      if (red[edge1][0] == 0 && red[edge2][0] == 1 && red[edge3][0] == 0) { nextGen[i] = reglas[2]; }
      if (red[edge1][0] == 0 && red[edge2][0] == 1 && red[edge3][0] == 1) { nextGen[i] = reglas[3]; }
      if (red[edge1][0] == 1 && red[edge2][0] == 0 && red[edge3][0] == 0) { nextGen[i] = reglas[4]; }
      if (red[edge1][0] == 1 && red[edge2][0] == 0 && red[edge3][0] == 1) { nextGen[i] = reglas[5]; }
      if (red[edge1][0] == 1 && red[edge2][0] == 1 && red[edge3][0] == 0) { nextGen[i] = reglas[6]; }
      if (red[edge1][0] == 1 && red[edge2][0] == 1 && red[edge3][0] == 1) { nextGen[i] = reglas[7]; }
      
      if (generacionMutada && i == nodoMutado) { // checamos si hay gen mutado esta generación
        nextGen[i] = (nextGen[i] + 1) % 2;
      }
    }
    for (int i = 0; i < 20; i++) {  
      celdas[i] = nextGen[i];
      red[i][0] = nextGen[i];
    }  
    generacion++;
  }
  
  boolean lastGen() {
    if (generacion > width) {
       return true; // paramos con tantas generaciones como la pantalla permita
    } else {
       return false;
    }
  }
}
