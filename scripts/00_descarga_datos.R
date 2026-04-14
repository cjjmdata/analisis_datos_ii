# =============================================================================
# Descarga y preparación de datos: Inside Airbnb — Ciudad de México
# =============================================================================
# Fuente:  https://insideairbnb.com/get-the-data/
# Corte:   2025-09-27 (congelado para todo el Parcial 3)
# Licencia: Creative Commons Attribution 4.0 International
# -----------------------------------------------------------------------------
# Ejecutar este script una sola vez. Genera:
#   - datos/listings_cdmx_raw.csv.gz   (archivo original)
#   - datos/listings_cdmx.rds          (versión limpia para clase)
# =============================================================================

# Paquetes ---------------------------------------------------------------------
# Si falta alguno: install.packages(c("dplyr", "readr", "stringr", "janitor"))
library(dplyr)
library(readr)
library(stringr)
library(janitor)

# Rutas y URL ------------------------------------------------------------------
url_datos <- paste0(
  "https://data.insideairbnb.com/mexico/df/mexico-city/",
  "2025-09-27/data/listings.csv.gz"
)

archivo_crudo   <- "datos/listings_cdmx_raw.csv.gz"
archivo_limpio  <- "datos/listings_cdmx.rds"

# Descarga (solo si no existe localmente) --------------------------------------
if (!file.exists(archivo_crudo)) {
  message("Descargando ~40 MB desde Inside Airbnb...")
  download.file(url_datos, destfile = archivo_crudo, mode = "wb")
} else {
  message("El archivo ya existe localmente. Se omite la descarga.")
}

# Lectura ----------------------------------------------------------------------
# El CSV trae ~75 columnas; leemos solo las que usaremos en el curso.
columnas_interes <- c(
  "id", "name", "neighbourhood_cleansed",
  "latitude", "longitude",
  "property_type", "room_type",
  "accommodates", "bedrooms", "beds", "bathrooms_text",
  "price",
  "minimum_nights", "maximum_nights",
  "number_of_reviews", "number_of_reviews_ltm",
  "review_scores_rating", "review_scores_location",
  "review_scores_cleanliness", "review_scores_value",
  "host_is_superhost", "host_since",
  "instant_bookable",
  "availability_365", "reviews_per_month"
)

listings_raw <- read_csv(
  archivo_crudo,
  col_select = all_of(columnas_interes),
  show_col_types = FALSE
)

message("Filas leídas: ", nrow(listings_raw))

# Limpieza ---------------------------------------------------------------------
# La columna `price` viene como texto: "$1,250.00". Hay que convertir a numérico.
# Convertimos variables categóricas relevantes a factor con niveles estables.

listings <- listings_raw |>
  mutate(
    # Precio: quitar símbolo y comas, convertir a numérico (MXN por noche).
    precio = price |>
      str_remove_all("[\\$,]") |>
      as.numeric(),

    # Extraer número de baños del texto ("1.5 baths", "Half-bath", etc.).
    banios = str_extract(bathrooms_text, "[0-9\\.]+") |> as.numeric(),

    # Factores: estables y con etiquetas claras.
    tipo_habitacion = factor(room_type,
      levels = c("Entire home/apt", "Private room",
                 "Shared room", "Hotel room"),
      labels = c("Propiedad completa", "Cuarto privado",
                 "Cuarto compartido", "Habitación de hotel")
    ),
    superhost = factor(host_is_superhost,
      levels = c(FALSE, TRUE),
      labels = c("No superhost", "Superhost")
    ),
    reserva_inmediata = factor(instant_bookable,
      levels = c(FALSE, TRUE),
      labels = c("No", "Sí")
    )
  ) |>
  rename(
    alcaldia       = neighbourhood_cleansed,
    tipo_propiedad = property_type,
    capacidad      = accommodates,
    recamaras      = bedrooms,
    camas          = beds,
    min_noches     = minimum_nights,
    max_noches     = maximum_nights,
    resenas_total  = number_of_reviews,
    resenas_12m    = number_of_reviews_ltm,
    calif_general  = review_scores_rating,
    calif_ubicacion = review_scores_location,
    calif_limpieza = review_scores_cleanliness,
    calif_valor    = review_scores_value,
    disp_365       = availability_365,
    resenas_por_mes = reviews_per_month
  ) |>
  select(
    id, name, alcaldia, latitude, longitude,
    tipo_propiedad, tipo_habitacion,
    capacidad, recamaras, camas, banios,
    precio,
    min_noches, max_noches,
    resenas_total, resenas_12m, resenas_por_mes,
    calif_general, calif_ubicacion, calif_limpieza, calif_valor,
    superhost, reserva_inmediata,
    disp_365
  )

# Filtros básicos de calidad ---------------------------------------------------
# Removemos listings con precios absurdos o datos esenciales faltantes.
# Nota: estos umbrales son defendibles, no arbitrarios. Véase discusión en clase.
listings <- listings |>
  filter(
    !is.na(precio),
    precio >= 200,      # precios < $200 MXN son casi siempre errores de captura
    precio <= 20000,    # precios > $20,000 MXN son outliers sin valor pedagógico
    !is.na(recamaras),
    !is.na(tipo_habitacion)
  )

message("Filas después de limpieza: ", nrow(listings))

# Resumen rápido para inspección -----------------------------------------------
cat("\n--- Alcaldías con más listings ---\n")
listings |>
  count(alcaldia, sort = TRUE) |>
  head(10) |>
  print()

cat("\n--- Resumen de precios por tipo de habitación ---\n")
listings |>
  group_by(tipo_habitacion) |>
  summarise(
    n          = n(),
    precio_med = median(precio, na.rm = TRUE),
    precio_mean = round(mean(precio, na.rm = TRUE), 0)
  ) |>
  print()

# Guardado ---------------------------------------------------------------------
saveRDS(listings, archivo_limpio)
message("\nArchivo guardado: ", archivo_limpio)
message("Listings finales: ", nrow(listings),
        " | Columnas: ", ncol(listings))

# -----------------------------------------------------------------------------
# Próximo paso: en el notebook de clase se carga así:
#   listings <- readRDS("datos/listings_cdmx.rds")
# -----------------------------------------------------------------------------
