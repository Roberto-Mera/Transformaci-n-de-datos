#-------------------------------------------------------------------------------------------------

# Instalación de paquetes necesarios
install.packages("tidyr")       # Para la manipulación de datos en formato largo/ancho
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
ruta_1 = "C:/Users/dtdis59/Desktop/ROBERTO MERA/Proyecto 1_Tablero de datos dinámicos para el reporte de resumen por distrito/Datos de prueba/Transformación de datos/Datos_VCompleta.xlsx"

# Cargamos las hojas del archivo Excel en dataframes
# Cada hoja del archivo Excel se carga en un dataframe separado.
distritos <- read_xlsx(path = ruta_1, sheet = "Distritos_Ubigeo")
proyecciones <- read_xlsx(path = ruta_1, sheet = "PROYECCIONES DE POBLACIÓN")
censos <- read_xlsx(path = ruta_1, sheet = "Censos")
minedu <- read_xlsx(path = ruta_1, sheet = "MINEDU")
programas_sociales <- read_xlsx(path = ruta_1, sheet = "PROGRAMAS SOCIALES")
onpe <- read_xlsx(path = ruta_1, sheet = "ONPE")
reniec <- read_xlsx(path = ruta_1, sheet = "RENIEC")
minsa <- read_xlsx(path = ruta_1, sheet = "MINSA")
pobreza <- read_xlsx(path = ruta_1, sheet = "POBREZA")


#----------------------------------------------------------------------------------------------
# Se renombran las columnas de cada tabla para facilitar su manejo y comprensión.

#Tabla Proyecciones
colnames(proyecciones)
proyecciones <- proyecciones %>%
  rename("Proyección 2018"="POB_PROY_TOT_2018",
         "Proyección 2019"="POB_PROY_TOT_2019",
         "Proyección 2020"="POB_PROY_TOT_2020",
         "Proyección 2021"="POB_PROY_TOT_2021",
         "Proyección 2022"="POB_PROY_TOT_2022",
         "Proyección 2023"="POB_PROY_TOT_2023",
         "Proyección 2024"="POB_PROY_TOT_2024"
         )

#Tabla Censos
colnames(censos)
censos <- censos %>%
  rename("Población censada hombres 2007"= "HOM_CENS_CPV2007",
         "Población censada mujeres 2007"="MUJ_CENS_CPV2007",
         "Población total censada 2007"="POB_TOTAL_AMBOS_CPV2007",
         "Población censada según LDR hombres 2007"="HOM_LRH_CPV2007",
         "Población censada según LDR mujeres 2007"="MUJ_LRH_CPV2007",
         "Población total censada por LDR hombres 2007"="PTOT_H_LRH_CPV2007",
         "Población total censada por LDR mujeres 2007"="PTOT_M_LRH_CPV2007",
         "Viviendas particulares ocupadas por personas presentes y ausentes 2007"="VIV_OCUP_CPV2007",
         "Viviendas particulares ocupadas uso ocasional 2007"="VIV_USOC_CPV2007",
         "Viviendas particulares desocupadas 2007"="VIV_DESO_CPV2007",
         "Viviendas colectivas 2007"="VIV_COLE_CPV2007",
         "Asistencia primaria 2007"="Asist_Prim_Censo_2007",
         "Asistencia secundaria 2007"="Asist_Sec_Censo_2007",
         "Población censada por lugar de nacimiento 2007"="TOT_LUG_NAC_CPV2007",
         "Promedio de personas por hogar 2007"="PROM_PERSxHOG_2007",
         "Tasa de migración neta 2007"="TMN_2007",
         "Población censada 2017"="POB_CENS_AMB_CPV2017_rec",
         "Población total censada 2017"="POB_TOTAL_AMB_CPV2017_rec",
         "Población censada según LDR 2017"="PCENS_AMB_LRH_CPV2017",
         "Población total censada por LDR 2017"="PTOT_LRH_CPV2017",
         "Viviendas particulares ocupadas por personas presentes y ausentes 2017"="VIV_OCUP_CPV2017_rec",
         "Viviendas particulares ocupadas uso ocasional 2017"="VIV_USOC_CPV2017_rec",
         "Viviendas particulares desocupadas 2017"="VIV_DESO_CPV2017_rec",
         "Viviendas colectivas 2017"="VIV_COLE_CPV2017_rec",
         "Asistencia primaria 2017"="Asist_Prim_Censo_2017",
         "Asistencia secundaria 2017"="Asist_Sec_Censo_2017",
         "Población censada por lugar de nacimiento 2017"="LUG_NAC_CPV2017",
         "Promedio de personas por hogar 2017"="PROM_PERSxHOG_2017",
         "Tasa de migración neta 2017"="TMN_2017_REC_1891"
         )

#Tabla Pobreza
colnames(pobreza)
pobreza <- pobreza %>%
  rename("1 Necesidad Básica Insatisfecha 2007"="UN_NBI_2007",
         "Al menos 2 Necesidades Básicas Insatisfechas 2007"="AL_MENOS_2NBI_2007",
         "1 Necesidad Básica Insatisfecha 2017"="UN_NBI_2017",
         "Al menos 2 Necesidades Básicas Insatisfechas 2017"="AL_MENOS_2NBI_2017",
         "Incidencia de Pobreza Monetaria Total 2013"="POBR_MONET_2013",
         "Incidencia de Pobreza Monetaria Total 2018"="POBR_MONET_2018")

#Tabla Minedu
colnames(minedu)
minedu <- minedu %>%
  rename("Inicial 2008"="MAT_INIC_MINEDU2008",
         "Inicial 2017"="MAT_INIC_MINEDU2017",
         "Inicial 2018"="MAT_INIC_MINEDU2018", 
         "Inicial 2019"="MAT_INIC_MINEDU2019",
         "Inicial 2020"="MAT_INIC_MINEDU2020",
         "Inicial 2021"="MAT_INIC_MINEDU2021",
         "Inicial 2022"="MAT_INIC_MINEDU2022",
         "Inicial 2023"="MAT_INIC_MINEDU2023",
         "Primaria 2008"="MAT_PRIM_MINEDU2008",
         "Primaria 2017"="MAT_PRIM_MINEDU20172",
         "Primaria 2018"="MAT_PRIM_MINEDU2018",
         "Primaria 2019"="MAT_PRIM_MINEDU2019",
         "Primaria 2020"="MAT_PRIM_MINEDU2020",
         "Primaria 2021"="MAT_PRIM_MINEDU2021",
         "Primaria 2022"="MAT_PRIM_MINEDU2022",
         "Primaria 2023"="MAT_PRIM_MINEDU2023",
         "Secundaria 2008"="MAT_SEC_MINEDU2008",
         "Secundaria 2017"="MAT_SEC_MINEDU20172", 
         "Secundaria 2018"="MAT_SEC_MINEDU2018",
         "Secundaria 2019"="MAT_SEC_MINEDU2019",
         "Secundaria 2020"="MAT_SEC_MINEDU2020",
         "Secundaria 2021"="MAT_SEC_MINEDU2021",
         "Secundaria 2022"="MAT_SEC_MINEDU2022",  
         "Secundaria 2023"="MAT_SEC_MINEDU2023"
         )

#Tabla minsa
colnames(minsa)
minsa <- minsa %>%
  rename("Nacimientos Minsa Manual y Línea 2007"="NACIM_MINSA2007",               
         "Defunciones Minsa Manual y Línea 2007"="DEFUN_MINSA2007",
         "Nacimientos Minsa Manual y Línea 2017"="NAC2017_MINSA\r\nMANUAL-LÍNEA",
         "Defunciones Minsa Manual y Línea 2017"="DEF2017_MINSA",                
         "Nacimientos Minsa Manual y Línea 2018"="NAC2018_MINSA\r\nMANUAL-LÍNEA",
         "Defunciones Minsa Manual y Línea 2018"="DEF2018_MINSA",
         "Nacimientos Minsa solo Línea 2019"="NAC2019_MINSA\r\nSOLO LÍNEA",
         "Nacimientos Minsa solo Línea 2020"="NAC2020_MINSA\r\nSOLO LÍNEA",
         "Nacimientos Minsa solo Línea 2021"="NACIMIENTOS MINSA 2021 LINEA",
         "Nacimientos Minsa solo Línea 2022"="NACIMIENTOS MINSA 2022 LINEA",
         "Nacimientos Minsa solo Línea 2023"="NAC2023_MINSA_L",
         "Defunciones Minsa Manual y Línea 2019"="DEF2019_MINSA",
         "Defunciones Minsa Manual y Línea 2020"="DEF2020_MINSA",                 
         "Defunciones Minsa Manual y Línea 2021"="DEFUNCIONES MINSA 2021\r\n M-L",
         "Defunciones Minsa Manual y Línea 2022"="DEF2022_MINSA"
         )

#Tabla onpe
colnames(onpe)
onpe <- onpe %>%
  rename("Población electoral hábil generales 2011"="Elect_Hab_2011",
         "Población electoral asistente generales 2011"="Elect_Asist_2011",
         "Población electoral hábil municipales 2014"="Elect_Hab_2014",
         "Población electoral asistente municipales 2014"="Elect_Asist_2014",
         "Población electoral hábil generales 2016"="Elect_Hab_2016",
         "Población electoral asistente generales 2016"="Elect_Asist_2016",
         "Población electoral hábil municipales 2018"="Elect_Hab_2018",
         "Población electoral asistente municipales 2018"="Elect_Asist_2018",
         "Población electoral hábil generales 2021"="Elect_Hab_2021",
         "Población electoral asistente generales 2021"="Elect_Asist_2021",
         "Población electoral hábil municipales 2022"="Elect_Hab_2022",
         "Población electoral asistente municipales 2022"="Elect_Asist_2022"
         )

#Tabla programas_sociales
colnames(programas_sociales)
programas_sociales <- programas_sociales %>%
  rename("SIS 2017"="SIS_2017",
         "SIS 2018"="SIS_2018",
         "SIS 2019"="SIS_2019",
         "SIS 2020"="SIS_2020",
         "Vaso de leche 2017"="VASO_LECHE_2017",
         "Vaso de leche 2018"="VASO_LECHE_2018",
         "Vaso de leche 2019"="VASO_LECHE_2019",
         "FISE 2017"="FISE_2017",
         "FISE 2018"="FISE_2018",
         "FISE 2019"="FISE_2019",
         "FISE 2020"="FISE_2020",
         "Pension 65 2019"="PENSION_65_A2019_2",
         "Pension 65 2020"="PENSION_65_A2020_2",
         "Pension 65 2021"="PENSION_65_A2021",
         "Pension 65 2022"="PENSION_65_A2022",
         "Juntos 2019"="JUNTOS_2019_2",     
         "Juntos 2020"="JUNTOS_2020_2",
         "Juntos 2021"="JUNTOS_2021",
         "Juntos 2022"="JUNTOS_2022"
         )

#Tabla reniec
colnames(reniec)
reniec <- reniec %>%
  rename("Nacimientos Reniec Manual y Línea 2017"="NAC_RENIEC_2017_AMB",
         "Nacimientos Reniec Manual y Línea 2018"="NAC_RENIEC_2018_AMB",
         "Nacimientos Reniec solo Línea 2019"="NAC_RENIEC_2019_AMB_LINEA",
         "Nacimientos Reniec solo Línea 2020"="NAC_RENIEC_2020_AMB_LINEA",
         "Nacimientos Reniec solo Línea 2021"="NACIMIENTOS\r\nRENIEC\r\n2021 - LÍNEA",
         "Nacimientos Reniec solo Línea 2022"="NACIMIENTOS\r\nRENIEC\r\n2022 - LÍNEA",
         "Nacimientos Reniec solo Línea 2023"="NAC_RENIEC_2023_AMB_LINEA",
         "Defunciones Reniec solo Línea 2017"="DEF_RENIEC_2017_AMB_LINEA",
         "Defunciones Reniec solo Línea 2018"="DEF_RENIEC_2018_AMB_LINEA",
         "Defunciones Reniec solo Línea 2019"="DEF_RENIEC_2019_AMB_LINEA",            
         "Defunciones Reniec solo Línea 2020"="DEF_RENIEC_2020_AMB_LINEA",
         "Defunciones Reniec solo Línea 2021"="DEFUNCIONES\r\nRENIEC\r\n2021 - LÍNEA",
         "Defunciones Reniec solo Línea 2022"="DEFUNCIONES\r\nRENIEC\r\n2022 - LÍNEA",
         "Defunciones Reniec solo Línea 2023"="DEF_RENIEC_2023_AMB_LINEA",
         "Población identificada con DNI 2017"="TOT_DNI_2017",
         "Población identificada con DNI 2018"="TOT_DNI_2018",
         "Población identificada con DNI 2019"="TOT_DNI_2019",
         "Población identificada con DNI 2020"="TOT_DNI_2020",
         "Población identificada con DNI 2021"="TOT_DNI_2021",
         "Población identificada con DNI 2022"="TOT_DNI_2022",
         "Población identificada con DNI 2023"="TOT_DNI_2023"
         )

#----------------------------------------------------------------------------------------------
# Eliminamos los guiones (-) de cada columna, lo dejaremos en blanco
# Luego, cambiamos los datos de tipo caracter a flotante

# Función para limpiar cada tabla
limpiar_tabla <- function(df) {
  df %>%
    mutate(across(where(is.character), ~ na_if(., "-"))) %>%  # Reemplaza "-" por NA
    mutate(across(where(is.character) & !all_of(c("Distrito", "Ubigeo")), as.numeric))  # Convierte a numérico solo si es character, excepto distrito y ubigeo
}

# Aplicamos la función de limpieza a cada tabla
censos <- limpiar_tabla(censos)
minedu <- limpiar_tabla(minedu)
minsa <- limpiar_tabla(minsa)
onpe <- limpiar_tabla(onpe)
programas_sociales <- limpiar_tabla(programas_sociales)
proyecciones <- limpiar_tabla(proyecciones)
reniec <- limpiar_tabla(reniec)
pobreza <- limpiar_tabla(pobreza)

#-----------------------------------------------------------------------------------------------
# En la tabla censos tenemos información dividida por género, pero como solo nos interesa
# la población total y no a qué género pertenece, crearemos una nueva columna que contenga toda la población.

censos <- censos %>%
  mutate(
    `Población censada 2007` = ifelse(is.na(`Población censada hombres 2007`) | is.na(`Población censada mujeres 2007`), 
                                      NA, 
                                      `Población censada hombres 2007` + `Población censada mujeres 2007`),
    `Población censada según LDR 2007` = ifelse(is.na(`Población censada según LDR hombres 2007`) | is.na(`Población censada según LDR mujeres 2007`), 
                                                NA, 
                                                `Población censada según LDR hombres 2007` + `Población censada según LDR mujeres 2007`),
    `Población total censada por LDR 2007` = ifelse(is.na(`Población total censada por LDR hombres 2007`) | is.na(`Población total censada por LDR mujeres 2007`), 
                                                NA, 
                                                `Población total censada por LDR hombres 2007` + `Población total censada por LDR mujeres 2007`)
  )

censos <- censos %>%
  select(-"Población censada hombres 2007", 
         -"Población censada mujeres 2007", 
         -"Población censada según LDR hombres 2007", 
         -"Población censada según LDR mujeres 2007",
         -"Población total censada por LDR hombres 2007",
         -"Población total censada por LDR mujeres 2007")

#-----------------------------------------------------------------------------------------------
# Pivotear las columnas 

# Función para pivotear las tablas
# Esta función toma un dataframe y lo transforma de formato ancho a largo, manteniendo las columnas "Ubigeo" y "Distrito" como identificadores.
# Además, extrae el año del nombre del indicador y lo coloca en una columna separada.
transformar_tabla <- function(df) {
  df %>%
    pivot_longer(
      cols = -c(Ubigeo, Distrito),  # Mantenemos fijas las columnas Ubigeo y Distrito
      names_to = "Indicador",       # La columna con los nombres de los indicadores
      values_to = "Valor"           # La columna con los valores de los indicadores
    ) %>%
    mutate(
      Año = str_extract(Indicador, "20\\d{2}"),   # Extrae el año del nombre del indicador
      Indicador = str_remove(Indicador, "20\\d{2}"),  # Elimina el año del nombre del indicador
      Indicador = trimws(Indicador)  # Elimina espacios en blanco extra
    )
}

# Aplicamos la función de transformación a cada tabla
censos <- transformar_tabla(censos)
minedu <- transformar_tabla(minedu)
minsa <- transformar_tabla(minsa)
onpe <- transformar_tabla(onpe)
programas_sociales <- transformar_tabla(programas_sociales)
proyecciones <- transformar_tabla(proyecciones)
reniec <- transformar_tabla(reniec)
pobreza <- transformar_tabla(pobreza)

# Definimos la ruta donde se guardará el archivo transformado
ruta_2 = "C:/Users/dtdis59/Desktop/ROBERTO MERA/Proyecto 1_Tablero de datos dinámicos para el reporte de resumen por distrito/Datos de prueba/Transformación de datos/Datos_Transformados.xlsx"

# Se crea un nuevo archivo Excel utilizando el paquete openxlsx.
wb <- createWorkbook()

# Cada tabla se añade como una hoja separada en el archivo Excel.
addWorksheet(wb, "DISTRITOS_UBIGEO")
writeData(wb, "DISTRITOS_UBIGEO", distritos)

addWorksheet(wb, "Censos")
writeData(wb, "Censos", censos)

addWorksheet(wb, "MINEDU")
writeData(wb, "MINEDU", minedu)

addWorksheet(wb, "MINSA")
writeData(wb, "MINSA", minsa)

addWorksheet(wb, "ONPE")
writeData(wb, "ONPE", onpe)

addWorksheet(wb, "PROGRAMAS SOCIALES")
writeData(wb, "PROGRAMAS SOCIALES", programas_sociales)

addWorksheet(wb, "PROYECCIONES DE POBLACIÓN")
writeData(wb, "PROYECCIONES DE POBLACIÓN", proyecciones)

addWorksheet(wb, "RENIEC")
writeData(wb, "RENIEC", reniec)

addWorksheet(wb, "POBREZA")
writeData(wb, "POBREZA", pobreza)

# Finalmente, se guarda el archivo Excel en la ruta especificada.
saveWorkbook(wb,file=ruta_2, overwrite = TRUE)