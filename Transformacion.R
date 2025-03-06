# Instalación de paquetes necesarios
install.packages("tidyr")       
install.packages("readxl")      # Para leer archivos Excel (.xlsx)
install.packages("dplyr")       # Para la manipulación de datos
install.packages("stringr")     # Para trabajar con cadenas de texto
install.packages("openxlsx")    # Para exportar datos a Excel

# Carga de los paquetes
library("tidyr")
library("readxl")
library("dplyr")
library("stringr")
library("openxlsx")

# Definimos la ruta del archivo de datos de entrada
ruta = "C:/Users/analista1/Desktop/ROBERTO MERA/Proyecto 1_Tablero de datos dinámicos para el reporte de resumen por distrito/Datos de prueba/Transformación de datos/Datos_Prueba_V2.xlsx"

# Cargamos la hoja "CENSOS" del archivo Excel en un dataframe llamado 'censos'
censos <- read_xlsx(path = ruta, sheet = "CENSOS")

# Transformamos la tabla usando pivot_longer para convertir las columnas de indicadores en filas
censos_pivoteada <- censos %>%
  pivot_longer(
    cols = -c(Ubigeo, Distrito),  # Mantenemos fijas las columnas Ubigeo y Distrito
    names_to = "Indicador",       # La columna con los nombres de los indicadores
    values_to = "Valor"           # La columna con los valores de los indicadores
  )

# Extraemos el año de los nombres de los indicadores (se asume un formato con años en el rango 2000-2099)
censos_pivoteada <- censos_pivoteada %>%
  mutate(Año = str_extract(Indicador, "20\\d{2}"))

# Eliminamos el año del nombre del indicador para uniformizar los nombres
censos_pivoteada <- censos_pivoteada %>%
  mutate(Indicador = str_remove(Indicador, "20\\d{2}"))

# Eliminamos espacios en blanco adicionales al inicio y final de los nombres de los indicadores
censos_pivoteada <- censos_pivoteada %>%
  mutate(Indicador = trimws(Indicador))

# Definimos la ruta donde se guardará el archivo transformado
ruta_2 = "C:/Users/analista1/Desktop/ROBERTO MERA/Proyecto 1_Tablero de datos dinámicos para el reporte de resumen por distrito/Datos de prueba/Transformación de datos/Datos_Transformados.xlsx"

# Guardamos la tabla transformada en un archivo Excel
write.xlsx(censos_pivoteada, ruta_2, overwrite = TRUE)

# Mensaje de confirmación
print("El archivo transformado ha sido guardado exitosamente en la ruta especificada.")
