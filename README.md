# Proyecto de Análisis de Biomas (UNIR - Bioinformática)
## Autores (Lote 1, Equipo 1)
Óscar Saiz
María Cordón
Laura Albarracín 
Juan Martínez Pomares

## Descripción del Proyecto
Este proyecto tiene como objetivo analizar diferentes biomas utilizando herramientas de bioinformática. Nos enfocamos en aplicar modelos de aprendizaje automático supervisado y no supervisado para extraer patrones y conocimientos a partir de los datos biológicos.

## Objetivos
- Analizar datos de biomas para identificar patrones significativos.
- Aplicar técnicas de aprendizaje automático para clasificar y agrupar los datos.
- Utilizar herramientas bioinformáticas para procesar y visualizar los resultados.

## Estructura del Proyecto
El proyecto está organizado de la siguiente manera:

<pre>
proyecto_bioinf_01/     # Carpeta raíz del proyecto
├── Results/            # Resultados obtenidos
├── data/               # Datasets a usar en el proyecto
├── documents/          # Papers y documentación de apoyo
└── scripts/            # Ficheros en .R usando diferentes modelos de ML supervisado y no supervisado
</pre>

## Utilizando GitHub
Primero creamos el repositorio y cada uno de nosotros lo clonó en su máquina local para poder realizar los cambios desde la terminal.
Una vez tuvimos todos el repositorio clonado, creamos cada uno una rama desde el main para crear una carpeta cada uno e ir añadiendo la información necesaria para realizar el proyecto.
Cuando ya todos subimos nuestra carpeta al repositorio virtual, hicimos un pull request para juntar las ramas en una "microbioma-proyecto". 
Al hacer el pull request tuvimos que solucionar algun problema de incompatibilidad de ramas.
Una vez estuvo la rama "microbioma-pryecto" con todas las carpetas y archivos, fuimos añadiendo archivos e información para trabajar en el proyecto.

Durante la creación del repositorio y el trabajo en equipo con GitHub, enfrentamos varios desafíos, entre ellos:

- **Resolución de conflictos de ramas:** Al realizar el pull request, tuvimos que solucionar problemas de incompatibilidad entre ramas. Aprendimos a manejar los conflictos utilizando las herramientas de Git y GitHub.
- **Coordinación del equipo:** Sincronizar los cambios realizados por diferentes miembros del equipo y asegurarnos de que todos trabajaran sobre la misma versión del proyecto fue un reto significativo.
- **Gestión de ramas:** La creación y el manejo de múltiples ramas para las diferentes partes del proyecto requirió un esfuerzo adicional para mantener la consistencia y organización del repositorio.

A pesar de estos desafíos, logramos completar nuestro proyecto de manera efectiva, mejorando nuestras habilidades en el uso de Git y GitHub para la colaboración en equipo.

## Algunos Comandos de Git Utilizados

```sh
# Clonar el repositorio
git clone https://github.com/Mariacordonmontiel/ActividadGrupal---UNIR.git

# crear rama nueva
git branch rama1

# crear rama nueva
git branch microbiomas-proyecto

# Crear una nueva rama para trabajar en una característica
git checkout -b microbiomas-proyecto

# Añadir los cambios al área de preparación
git add .

# Hacer un commit de los cambios
git commit -m "Agregando rama microbiomas-proyecto"

# Subir los cambios a GitHub
git push origin microbiomas-proyecto

# Actualizar el repositorio local con los cambios del remoto
git pull

# Eliminar una rama local
git branch -d rama1
```

## Comandos GIT de Referencia
![Comando GIT](https://res.cloudinary.com/practicaldev/image/fetch/s--Zib71Fgv--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/n082uxea33j6zq3mca7u.png)

