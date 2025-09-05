# Ejercitación - Clase 2: Diseño y estética
# Curso: Visualización de datos con R y ggplot2
# Estación R - 2025

library(tidyverse)
library(eph)
library(arrow)
library(here)
library(RColorBrewer)
library(viridis)
library(scales)
library(patchwork)

# Datos para los ejercicios
# Datos para los ejercicios
df_eph <- read_csv(
  "https://estacion-r.github.io/Curso-Intro_Viz/datos/eph_2020_25.csv"
)

# =============================================================================
# EJERCICIO 1: TÍTULOS Y ETIQUETAS (Dificultad: ⭐)
# =============================================================================
# Consigna: Tomar el gráfico básico de desocupación y agregar:
# - Título: "Evolución de la desocupación"
# - Subtítulo: "Argentina 2020-2025"
# - Etiqueta del eje X: "Año"
# - Etiqueta del eje Y: "Cantidad de desocupados"
# - Pie de página: "Fuente: EPH - INDEC"

# =============================================================================
# EJERCICIO 2: ESCALAS Y FORMATO DE NÚMEROS (Dificultad: ⭐⭐)
# =============================================================================
# Consigna: Mejorar el gráfico anterior agregando:
# - Formato de números con separador de miles en el eje Y
# - Límites del eje Y desde 0 hasta 10% más que el valor máximo
# - Breaks más legibles en el eje Y (usar pretty_breaks)

# =============================================================================
# EJERCICIO 3: PALETAS DE COLORES BÁSICAS (Dificultad: ⭐⭐)
# =============================================================================
# Consigna: Crear un gráfico de barras donde cada año tenga un color diferente:
# - Mapear el color de relleno (fill) al año
# - Usar la paleta "Set2" de RColorBrewer
# - Ocultar la leyenda (guides(fill = "none"))

# =============================================================================
# EJERCICIO 4: PALETAS VIRIDIS (Dificultad: ⭐⭐)
# =============================================================================
# Consigna: Crear el mismo gráfico pero usando:
# - scale_fill_viridis_d() para variables discretas
# - Probar las opciones: "viridis", "plasma", "inferno", "cividis"

# =============================================================================
# EJERCICIO 5: TEMAS PROFESIONALES (Dificultad: ⭐⭐)
# =============================================================================
# Consigna: Tomar uno de los gráficos anteriores y probar diferentes temas:
# - theme_minimal()
# - theme_classic()
# - theme_void()
# ¿Cuál te parece más apropiado y por qué?

# =============================================================================
# EJERCICIO 6: FACETAS BÁSICAS (Dificultad: ⭐⭐⭐)
# =============================================================================
# Consigna: Crear un dataset con ocupados y desocupados por año, y visualizar
# con facetas separadas para cada condición de actividad

# Primer paso: crear los datos
df_por_estado <- df_eph |>
  filter(ESTADO %in% c(1, 2)) |>
  count(ANO4, ESTADO) |>
  mutate(
    Estado_lab = case_when(
      ESTADO == 1 ~ "Ocupados",
      ESTADO == 2 ~ "Desocupados"
    )
  )

# Segundo paso: visualizar con facet_wrap()

# =============================================================================
# EJERCICIO 7: FACETAS POR AGLOMERADO (Dificultad: ⭐⭐⭐)
# =============================================================================
# Consigna: Crear un gráfico que muestre la evolución de ocupados y desocupados
# para 3 aglomerados diferentes (32, 17, 30), con una faceta por aglomerado

# Preparar los datos:
df_ejercicio <- df_eph |>
  filter(ESTADO %in% c(1, 2), AGLOMERADO %in% c(32, 17, 30)) |>
  count(ANO4, AGLOMERADO, ESTADO) |>
  mutate(
    AGLOMERADO_lab = case_when(
      AGLOMERADO == 32 ~ "CABA",
      AGLOMERADO == 17 ~ "Neuquén - Plottier",
      AGLOMERADO == 30 ~ "Santa Rosa - Toay"
    ),
    ESTADO_lab = factor(ESTADO, labels = c("Ocupados", "Desocupados"))
  )

# Tu visualización (usar geom_line con diferentes colores por estado):

# =============================================================================
# EJERCICIO 8: PATCHWORK BÁSICO (Dificultad: ⭐⭐⭐)
# =============================================================================
# Consigna: Crear tres gráficos diferentes y combinarlos:
# p1: Gráfico de barras de desocupación
# p2: Gráfico de líneas de desocupación
# p3: Gráfico de puntos de desocupación
# Combinar los tres en diferentes layouts

# Crear los gráficos:
p1 <- ggplot(tbl_desocup_2020_25, aes(x = Anio, y = n)) +
  geom_col(fill = "#4F7CFF") +
  theme_minimal() +
  labs(title = "Barras")

p2 <- # Tu código para el gráfico de líneas
  p3 <- # Tu código para el gráfico de puntos
    # Combinar horizontalmente:

    # Combinar en formato 2x2 con p3 abajo:

    # =============================================================================
    # EJERCICIO 9: PERSONALIZACIÓN AVANZADA DE TEMA (Dificultad: ⭐⭐⭐⭐)
    # =============================================================================
    # Consigna: Crear un gráfico "publication-ready" con:
    # - Título centrado y en negrita (size = 16)
    # - Subtítulo centrado y gris (size = 12, color = "grey50")
    # - Ejes con texto de tamaño apropiado (size = 10)
    # - Remover gridlines menores
    # - Fondo del panel en color muy suave

    # =============================================================================
    # EJERCICIO 10: CONTROL AVANZADO DE ESCALAS (Dificultad: ⭐⭐⭐⭐)
    # =============================================================================
    # Consigna: Crear un gráfico que muestre ocupados vs desocupados con:
    # - Dos escalas de color personalizadas (azul para ocupados, rojo para desocupados)
    # - Formato de números con "K" para miles
    # - Breaks personalizados en el eje Y
    # - Etiquetas de años abreviadas ('20, '21, '22, etc.)

    # Preparar datos combinados:
    df_combinado <- bind_rows(
      tbl_desocup_2020_25 |> mutate(tipo = "Desocupados"),
      df_eph |>
        filter(ESTADO == 1) |>
        count(ANO4, name = "n") |>
        rename(Anio = ANO4) |>
        mutate(tipo = "Ocupados")
    )

# =============================================================================
# EJERCICIO DESAFÍO: DASHBOARD SIMPLE (Dificultad: ⭐⭐⭐⭐⭐)
# =============================================================================
# Consigna: Crear un "dashboard" combinando 4 visualizaciones:
# 1. Serie temporal de desocupación (línea)
# 2. Distribución por sexo en un año específico (barras)
# 3. Distribución de edades de desocupados (histograma)
# 4. Facetas por aglomerado (puntos)
#
# Usar patchwork para organizarlos en una grilla 2x2
# Todos deben tener el mismo tema y paleta de colores coherente
