# Transformación de Datos de Censos

Este proyecto tiene como objetivo transformar y organizar datos censales provenientes de un archivo Excel, aplicando limpieza y estructuración para su uso en tableros dinámicos de análisis.

## 📂 Estructura del Proyecto

```
Proyecto_Transformacion_Datos/
│-- Datos_Prueba_V2.xlsx  # Archivo de datos original
│-- Datos_Transformados.xlsx  # Archivo de datos procesados
│-- script_transformacion.R  # Script en R para transformación de datos
│-- README.md  # Documento actual
```

## 🚀 Requisitos

Para ejecutar este proyecto, se deben instalar los siguientes paquetes en R:

```r
install.packages("tidyr")
install.packages("readxl")
install.packages("dplyr")
install.packages("stringr")
install.packages("openxlsx")
```

## 🔧 Pasos para ejecutar el script

1. Clonar este repositorio en tu máquina local.
2. Abrir RStudio o tu entorno de desarrollo preferido.
3. Cargar las bibliotecas necesarias con `library()`.
4. Ajustar la variable `ruta` con la ubicación del archivo Excel de entrada.
5. Ejecutar el script `Transformacion.R`.
6. El archivo transformado se guardará en la ruta especificada como `Datos_Transformados.xlsx`.

## 📌 Descripción del Script

El script realiza las siguientes tareas:
- Carga los datos desde un archivo Excel.
- Transforma la tabla con `pivot_longer()` para reorganizar los datos.
- Extrae el año de los indicadores y lo almacena en una nueva columna.
- Limpia los nombres de los indicadores eliminando el año y espacios en blanco.
- Guarda la tabla transformada en un nuevo archivo Excel.



