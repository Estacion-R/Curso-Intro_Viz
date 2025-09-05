# Ejercitación - Clase 1: Fundamentos de ggplot2
# Curso: Visualización de datos con R y ggplot2
# Estación R - 2025

library(tidyverse)
library(eph)
library(arrow)
library(here)

# Datos para los ejercicios
df_eph <- read_csv(
  "https://estacion-r.github.io/Curso-Intro_Viz/datos/eph_2020_25.csv"
)

# Tabla de desocupados por año
tbl_desocup_2020_25 <- df_eph |>
  filter(ESTADO == 2) |> # 2 = desocupados
  count(ANO4, name = "n") |>
  rename(Anio = ANO4)


# =============================================================================
# EJERCICIO 1: PRIMER GRÁFICO CON GGPLOT2 (Dificultad: ⭐)
# =============================================================================
# Consigna: Crear un gráfico de barras básico mostrando la desocupación por año
# usando los datos tbl_desocup_2020_25

# =============================================================================
# EJERCICIO 2: EXPLORANDO GEOMS (Dificultad: ⭐)
# =============================================================================
# Consigna: Usando los mismos datos, crear:
# a) Un gráfico de puntos
# b) Un gráfico de líneas

# a) Gráfico de puntos:

# b) Gráfico de líneas:

# =============================================================================
# EJERCICIO 3: PERSONALIZANDO GEOMS (Dificultad: ⭐⭐)
# =============================================================================
# Consigna: Crear un gráfico de puntos donde:
# - Los puntos sean de tamaño 4
# - Los puntos sean de color azul
# - El fondo del gráfico sea transparente (alpha = 0.7)

# =============================================================================
# EJERCICIO 4: COMBINANDO CAPAS (Dificultad: ⭐⭐)
# =============================================================================
# Consigna: Crear un gráfico que combine barras y puntos:
# - Barras de color celeste claro (lightblue) con transparencia (alpha = 0.7)
# - Puntos rojos de tamaño 4 encima de las barras

# =============================================================================
# EJERCICIO 5: AESTHETICS VS PARÁMETROS FIJOS (Dificultad: ⭐⭐)
# =============================================================================
# Consigna: Crear DOS gráficos de barras:
# a) Todas las barras del mismo color azul (parámetro fijo)
# b) Cada barra de diferente color según el año (aesthetic mapping)

# a) Barras del mismo color:

# b) Barras de diferentes colores:

# =============================================================================
# EJERCICIO 6: TRABAJANDO CON DATOS MÁS COMPLEJOS (Dificultad: ⭐⭐⭐)
# =============================================================================
# Consigna: Usando df_eph, crear una tabla que muestre la cantidad de ocupados
# por año y luego visualizarla con un gráfico de líneas

# Primer paso: crear la tabla (completa el código)
tbl_ocupados <- df_eph |>
  filter(ESTADO == ___) |> # 1 = ocupados
  count(___, name = "n")

# Segundo paso: visualizar

# =============================================================================
# EJERCICIO 7: COMPARANDO OCUPADOS Y DESOCUPADOS (Dificultad: ⭐⭐⭐)
# =============================================================================
# Consigna: Crear un gráfico que muestre en el mismo plot:
# - Barras para desocupados (usa tbl_desocup_2020_25)
# - Puntos para ocupados (usa la tabla que creaste en el ejercicio anterior)
# Usa diferentes colores para distinguir cada serie

# =============================================================================
# EJERCICIO 8: MAPEO DE AESTHETICS (Dificultad: ⭐⭐⭐)
# =============================================================================
# Consigna: Usando df_eph, crear un gráfico de puntos que muestre:
# - En X: los años (ANO4)
# - En Y: la edad (CH06)
# - Color de los puntos según el sexo (CH04: 1=Varón, 2=Mujer)
# - Filtrar solo personas entre 18 y 65 años

# =============================================================================
# EJERCICIO DESAFÍO: VISUALIZACIÓN LIBRE (Dificultad: ⭐⭐⭐⭐)
# =============================================================================
# Consigna: Elegí un dataset a gusto y crea una visualización
# que te parezca interesante.
# Experimenta con diferentes geoms y aesthetics
