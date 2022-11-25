## Random Boolean Networks

Para correr el programa que genera redes binarias aleatorias hay que navegar a la carpeta respectiva del sistema operativo donde se va a correr el programa, ya sea `windows-amd64` o `linux-amd64`.

En Windows se tiene que abrir `RandomBinaryNetwork.exe` haciendo doble clic en el archivo.

En Linux se tiene que escribir el comando `./RandomBinaryNetwork` desde la terminal para ejecutar el archivo.

Los códigos fuente están a esta misma altura y en la carpeta `source` de ambas carpetas `windows-amd64` y `linux-amd64`.

Al ejecutarse el programa se abre una ventana que muestra una red binaria aleatoria generación a generación de izquierda a derecha, creada a partir de un conjunto de reglas aleatorias.

Cada celda en ejecución representa un nodo de la red, si esta se encuentra de color negro significa que es un 0 según el conjunto de reglas, y si está de color blanco es un 1.

Adicionalmente las celdas de color rojo nos indican que ocurrió una mutación en ese nodo donde cambió su valor de 0 a 1. El caso contrario sucede para las celdas de color azul, la mutación hizo cambiar el valor del nodo de 1 a 0. Las mutaciones tienen probabilidad de 1/20 de ocurrir.

Si la red se deja correr hasta alcanzar la última generación que la ventana permite visualizar entonces se generan dos archivos:

- Un archivo `regla_usada.txt` que nos indica cuál fue la regla que se usó para obtener las generaciones de la red según las adyacencias de esta.
- Un archivo `random_boolean_net.jpg` que nos permite visualizar la imagen de la red que se mostro ejecutándose.

Al hacer clic en la ventana se genera una nueva red con una regla distinta, también aleatoria. Si se deja correr hasta la última generación entonces los archivos generados se sobreescriben.


