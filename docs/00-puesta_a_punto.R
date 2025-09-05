##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            --
##- SCRIPT DE PUESTA A PUNTO PARA EL TALLER DE VISUALIZACIÓN DE DATOS CON R-----
##                                                                            --
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Este script instalará y cargará todos los paquetes necesarios para el taller.
# Utiliza el paquete `pacman` para simplificar el proceso.

# --- 1. Instalar pacman si no está presente ---
if (!require("pacman")) {
  install.packages("pacman")
}

# Cargar pacman
library(pacman)


#................2. Instalar paquetes desde CRAN.................

# p_load se encarga de instalar (si es necesario) y cargar los paquetes.
p_load(
  "tidyverse", # Colección de paquetes esenciales (incluye ggplot2, dplyr, tidyr)
  "patchwork", # Para combinar gráficos de ggplot
  "ggthemes", # Temas adicionales para ggplot2
  "RColorBrewer", # Paletas de colores predefinidas
  "viridis", # Paletas de colores amigables para personas con daltonismo
  "ggrepel", # Para etiquetas de texto que no se superponen
  "plotly", # Para crear gráficos interactivos
  "ggtext", # Permite usar Markdown en el texto de los gráficos
  "scales" # Para un mejor control de las escalas en los gráficos
)


#................3. Instalar paquetes desde GitHub...............

# p_load_gh hace lo mismo para paquetes alojados en GitHub.
p_load_gh(
  "hrbrmstr/hrbrthemes"
)

# ¡Listo! Todos los paquetes han sido instalados y cargados.
# Ya tenés todo lo necesario para el taller. ¡Nos vemos en clase!

# Limpiar el entorno para no dejar variables sueltas
rm(list = ls())
