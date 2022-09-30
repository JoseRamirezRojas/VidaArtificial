## Hormiga de Langton y Turmitas

Para correr este programa que dibuja de manera generalizada turmitas, es necesario tener un editor que abra libretas de Jupyter (archivos con extensión `.ipynb`) e instalar la siguiente dependencia:

- NumPy   ```pip install numpy```

La libreta tiene que ejecutarse con un kernel de Python 3.x para funcionar.

Corriendo la única celda de la libreta se pide ingresar una regla, es decir una cadena que consista solamente de 'L's y 'R's, al hacerlo se puede visualizar la generación del recorrido de una turmita, tomando colores aleatorios por cada comportamiento especificado por las reglas.

Particularmente para la regla "LR" se genera la hormiga de Langton tradicional.

Dado que el comportamiento de las turmitas es cíclico, la función que dibuja su recorrido ejecuta un ciclo `while` de manera indefinida, por lo que para terminar la ejecución de la celda de la libreta hay que directamente cerrar la ventana de `Python Turtle Graphics` que se abre al introducir las reglas.