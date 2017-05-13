Commandos de Git.
===================


En este documento pueden agregar los comandos mas usados en Git con una descripción.

----------

### Descargar repositorio.

```
1. git remote add origin https://github.com/jorge190588/basedatosII.git
```

### Crear un commit y actualizar el repositorio.

```
1. git status -> ver archivos sin agregar a un commit.
2. git add . -> agregar archivos
3. git commit -m "comentario" -> agregar commit
4. git pull origin master -> verificar si hay actualizaciones
5. git push origin master -> subir cambios al repositorio.

## en caso de que exista un conflicto entre el repositorio local y el de github
1. git fetch origin -> descargar cambios previos a una rama escondida llamada origin
2. git merge origin/master -> espejear los cambios guardados en origin anteriormente ahora en nuestra rama de nuestro repositorio local

opcional despues de esto realizar commits, esto garantiza que tendremos actualizado nuestro repositorio con el que esta en github.
```

### Crear una branch

```
1. git checkout -b "nuevaBranch" -> crear una branch.
2. git fetch -> actualizar branchs local
3. git push origin nuevaBranch -> subir cambios al repositorio.
```
