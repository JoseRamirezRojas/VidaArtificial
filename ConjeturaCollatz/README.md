# Extra - Conjetura de Collatz

Para poder correr el archivo es necesario primero instalar las siguientes dependencias:

- NumPy `pip install numpy`
- Pillow `python3 -m pip install --upgrade Pillow` 

Para ejecutar el programa es necesario tener un editor que abra libretas de Jupyter (archivos `.ipynb`).

Corriendo la única celda de la libreta se pide ingresar un número entero, al hacerlo se puede visualizar la aplicación de la función de Collatz y la generación de una imagen llamada `collatz_attempt.png` donde se muestra la ejecución pero donde cada dígito es un color distinto.

La imagen generada se guarda a la misma altura de la libreta y se sobreescribe en cada ejecución, el número ingresado para intentar dar un contraejemplo de la conjetura se guarda en un archivo llamada `conjecture.txt` .