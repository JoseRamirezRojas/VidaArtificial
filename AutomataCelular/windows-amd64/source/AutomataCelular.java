/* autogenerated by Processing revision 1286 on 2022-08-30 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class AutomataCelular extends PApplet {

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
  
   public void randomize() {
    for (int i = 0; i < 8; i++) {
      reglas[i] = PApplet.parseInt(random(2)); // aleatorizamos el valor de las reglas
    }
  }
  
   public void restart() {
    for (int i = 0; i < celdas.length; i++)
      celdas[i] = 0;
      
    generacion = 0;
    celdas[celdas.length/2] = 1; // inicializamos la primera generación con el bit de en medio encendido
  }
  
   public void render() {
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

   public void genera() {
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
  
   public boolean ultimaGeneracion() {
    if (generacion > height) {
       return true; // paramos con tantas generaciones como la pantalla permita
    } else {
       return false;
    }
  }
}
/**
 * Ejecución de Automata 1D (Automata Celular)
 * 
 * Permite guardar una imagen con un automata celular generado aleatoriamente
 */
 
AutomataCel automata; 
PrintWriter output;

 public void setup() {
  /* size commented out by preprocessor */;
  frameRate(24);
  int[] rules = new int[8]; 
   for (int i = 0; i < 8; i++) {
      rules[i] = PApplet.parseInt(random(2)); // aleatorizamos el valor de la regla inicial
    }
  automata = new AutomataCel(rules);  
  background(0);
  output = createWriter("regla_usada.txt");
}

 public void draw() {
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

 public void mousePressed() {
  background(0);
  automata.randomize();
  automata.restart(); // al hacer clic se genera otro automata con otras reglas (aleatorias)
  output = createWriter("regla_usada.txt"); //reabrimos el archivo para escribir la nueva regla
  loop(); //reanudamos el método draw()
}


  public void settings() { size(1000, 600); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "AutomataCelular" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}