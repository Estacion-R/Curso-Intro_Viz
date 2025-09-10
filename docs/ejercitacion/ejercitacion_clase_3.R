# Ejercitación - Clase 3: Anotaciones, Interactividad y Publicación
# Curso: Visualización de datos con R y ggplot2
# Estación R - 2025

library(tidyverse)
library(eph)
library(arrow)
library(here)
library(scales)
library(RColorBrewer)
library(patchwork)
library(ggrepel)
library(plotly)

# Datos para los ejercicios
df_eph <- read_csv(
  "https://estacion-r.github.io/Curso-Intro_Viz/datos/eph_2020_25.csv"
)

# Tabla de desocupados por año (para continuidad con clases anteriores)
tbl_desocup_2020_25 <- df_eph |>
  filter(ESTADO == 2) |>
  count(ANO4, name = "n") |>
  rename(Anio = ANO4)

# =============================================================================
# EJERCICIO 1: PRIMERAS ANOTACIONES CON GEOM_TEXT (Dificultad: ⭐)
# =============================================================================
# Consigna: Tomar el gráfico de barras de desocupación y agregar:
# - Etiquetas con geom_text() mostrando el valor de cada barra
# - Las etiquetas deben estar centradas arriba de cada barra (vjust = -0.5)


# =============================================================================
# EJERCICIO 2: COMPARANDO GEOM_TEXT VS GEOM_LABEL (Dificultad: ⭐)
# =============================================================================
# Consigna: Crear DOS versiones del mismo gráfico de líneas:
# a) Con geom_text() para mostrar los valores
# b) Con geom_label() para mostrar los valores con fondo

# a) Con geom_text():


# b) Con geom_label():


# =============================================================================
# EJERCICIO 3: CONTROL DE POSICIÓN CON VJUST Y HJUST (Dificultad: ⭐⭐)
# =============================================================================
# Consigna: Crear un gráfico de barras donde las etiquetas:
# - Estén posicionadas dentro de las barras (vjust = 1)
# - Estén alineadas a la izquierda dentro de las barras (hjust = 0.1)
# - Sean de color blanco y negrita para mayor contraste


# =============================================================================
# EJERCICIO 4: ANOTACIONES CON ANNOTATE() (Dificultad: ⭐⭐)
# =============================================================================
# Consigna: Usando tbl_desocup_2020_25, crear un gráfico de líneas que incluya:
# - Una anotación de texto que señale el año con mayor desocupación
# - La anotación debe estar posicionada cerca del punto máximo
# - Usar annotate("text", x = ..., y = ..., label = ...)


# =============================================================================
# EJERCICIO 5: LÍNEAS DE REFERENCIA (Dificultad: ⭐⭐)
# =============================================================================
# Consigna: Crear un gráfico que muestre:
# - Línea de la evolución de desocupación
# - Una línea horizontal de referencia mostrando el promedio del período
# - Una anotación explicando qué representa la línea de referencia

# Calcular el promedio primero:
promedio_desocup <- mean(tbl_desocup_2020_25$n)

# Tu gráfico:


# =============================================================================
# EJERCICIO 6: COMBINANDO GEOM_HLINE Y ANNOTATE (Dificultad: ⭐⭐⭐)
# =============================================================================
# Consigna: Usando los datos de ocupados y desocupados, crear un gráfico que:
# - Muestre ambas series como líneas de diferente color
# - Incluya líneas de referencia para el promedio de cada serie
# - Tenga anotaciones explicativas para cada línea de referencia

# Preparar datos de ocupados:
tbl_ocupados <- df_eph |>
  filter(ESTADO == 1) |>
  count(ANO4, name = "n") |>
  rename(Anio = ANO4)

# Combinar datos:
df_estados <- bind_rows(
  tbl_desocup_2020_25 |> mutate(Estado = "Desocupados"),
  tbl_ocupados |> mutate(Estado = "Ocupados")
)

# Tu gráfico:


# =============================================================================
# EJERCICIO 7: USANDO GGREPEL PARA ETIQUETAS (Dificultad: ⭐⭐⭐)
# =============================================================================
# Consigna: Crear un gráfico de dispersión usando df_eph que muestre:
# - En X: edad (CH06), filtrar entre 18 y 65 años
# - En Y: ingresos (P21), filtrar valores mayores a 0
# - Color por sexo (CH04)
# - Usar geom_text_repel() para etiquetar solo los 10 casos con mayores ingresos

# Preparar datos:
df_scatter <- df_eph |>
  filter(
    CH06 >= 18, CH06 <= 65,
    P21 > 0, !is.na(P21)
  ) |>
  mutate(
    sexo = factor(CH04, labels = c("Varón", "Mujer"))
  ) |>
  slice_max(P21, n = 500) # Tomar una muestra para mejor visualización

# Tu gráfico (recuerda usar geom_text_repel solo para los top 10):


# =============================================================================
# EJERCICIO 8: PRIMER GRÁFICO INTERACTIVO (Dificultad: ⭐⭐)
# =============================================================================
# Consigna: Convertir el gráfico básico de desocupación a interactivo:
# - Crear un gráfico de líneas con puntos
# - Usar ggplotly() para hacerlo interactivo
# - Los tooltips deben mostrar año y cantidad de desocupados


# =============================================================================
# EJERCICIO 9: TOOLTIPS PERSONALIZADOS (Dificultad: ⭐⭐⭐)
# =============================================================================
# Consigna: Crear un gráfico interactivo con tooltips personalizados que muestren:
# - El año
# - El número de desocupados con formato (usar scales::comma)
# - Un mensaje adicional "Fuente: EPH-INDEC"

# Recuerda usar el aesthetic 'text' para personalizar el tooltip:


# =============================================================================
# EJERCICIO 10: INTERACTIVIDAD CON MÚLTIPLES SERIES (Dificultad: ⭐⭐⭐)
# =============================================================================
# Consigna: Usar df_estados (ocupados y desocupados) para crear:
# - Gráfico de líneas con ambas series
# - Cada serie con color diferente
# - Convertir a plotly
# - Tooltips que muestren: año, tipo de población, y cantidad


# =============================================================================
# EJERCICIO 11: EXPORTACIÓN BÁSICA (Dificultad: ⭐⭐)
# =============================================================================
# Consigna: Crear un gráfico completo con títulos y guardarlo:
# - Gráfico de la evolución de desocupación
# - Títulos apropiados (title, subtitle, caption)
# - Guardar como PNG de 12x8 cm a 300 DPI

mi_grafico_final <- # Tu código del gráfico


# Guardar:
# ggsave("mi_grafico_desocupacion.png", plot = mi_grafico_final, 
#        width = 12, height = 8, units = "cm", dpi = 300)

# =============================================================================
# EJERCICIO 12: MÚLTIPLES FORMATOS DE EXPORTACIÓN (Dificultad: ⭐⭐⭐)
# =============================================================================
# Consigna: Tomar un gráfico y guardarlo en diferentes formatos:
# - PNG para web (150 DPI, 10x6 cm)
# - PNG para impresión (300 DPI, 8x6 pulgadas)
# - PDF vectorial (6x4 pulgadas)

# Usar el gráfico del ejercicio anterior


# =============================================================================
# EJERCICIO 13: RECTÁNGULOS DE ANOTACIÓN (Dificultad: ⭐⭐⭐)
# =============================================================================
# Consigna: Crear un gráfico que destaque el período 2020-2022 como "Pandemia":
# - Gráfico de líneas de desocupación
# - Rectángulo semitransparente cubriendo 2020-2022
# - Anotación de texto explicativa


# =============================================================================
# EJERCICIO 14: COMBINANDO ANOTACIONES (Dificultad: ⭐⭐⭐⭐)
# =============================================================================
# Consigna: Crear una visualización "publication-ready" que incluya:
# - Datos de desocupación por sexo (usar CH04 en df_eph)
# - Facetas por sexo
# - Líneas de referencia (promedio por sexo)
# - Anotaciones explicativas
# - Títulos completos
# - Tema profesional

# Preparar datos:
df_por_sexo <- df_eph |>
  filter(ESTADO == 2, CH04 %in% c(1, 2)) |>
  count(ANO4, CH04) |>
  mutate(
    sexo = factor(CH04, labels = c("Varones", "Mujeres"))
  ) |>
  rename(Anio = ANO4, desocupados = n)

# Tu visualización completa:


# =============================================================================
# EJERCICIO 15: PROYECTO INTEGRADOR (Dificultad: ⭐⭐⭐⭐⭐)
# =============================================================================
# Consigna: Crear una visualización completa que incluya TODO lo aprendido:
# 
# 1. **Datos**: Elegir una variable interesante de df_eph
# 2. **Visualización**: Tipo de gráfico apropiado 
# 3. **Anotaciones**: Al menos 2 tipos (texto + línea de referencia o rectángulo)
# 4. **Personalización**: Colores, títulos completos, tema profesional
# 5. **Interactividad**: Versión interactiva con tooltips personalizados
# 6. **Exportación**: Guardar en formato PNG de alta calidad
#
# Sugerencias de variables:
# - Ingresos por nivel educativo (P21 + NIVEL_ED)
# - Desocupación por grupo etario
# - Ocupados por aglomerado urbano
# - Cualquier otra que te resulte interesante

# Ejemplo de estructura:
# 1. Preparar datos
# 2. Crear gráfico estático completo
# 3. Versión interactiva
# 4. Exportar

# 1. Datos:


# 2. Gráfico estático:


# 3. Versión interactiva:


# 4. Exportación:
# ggsave("mi_proyecto_final.png", plot = mi_grafico, 
#        width = 12, height = 8, units = "in", dpi = 300)

# =============================================================================
# EJERCICIO DESAFÍO: DASHBOARD CON PATCHWORK (Dificultad: ⭐⭐⭐⭐⭐)
# =============================================================================
# Consigna: Crear un "dashboard" combinando 4 gráficos diferentes:
# 1. Serie temporal de desocupación (con anotaciones)
# 2. Gráfico de barras por aglomerado (top 5)
# 3. Distribución de edades de desocupados (histograma)
# 4. Comparación ocupados vs desocupados (líneas)
#
# Usar patchwork para combinarlos en una grilla 2x2
# Todos con tema consistente y paleta coherente

# Gráfico 1:


# Gráfico 2:


# Gráfico 3:


# Gráfico 4:


# Combinar:
# dashboard <- (grafico1 + grafico2) / (grafico3 + grafico4)
# dashboard + plot_annotation(
#   title = "Dashboard: Mercado Laboral Argentino 2020-2025",
#   subtitle = "Análisis integral de la situación ocupacional",
#   caption = "Fuente: EPH - INDEC | Elaborado por [Tu nombre]"
# )

# ¡Opcional! Convertir el dashboard a interactivo:
# ggplotly(dashboard) # Nota: puede requerir ajustes adicionales