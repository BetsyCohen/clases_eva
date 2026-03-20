## Clase 2025-11-12
## Temas: Unir filas de tablas con bind rows y repaso de gt


# setup -------------------------------------------------------------------

library(tidyverse)
library(gt)


# Tema 1 Unir filas de tablas con bind rows -------------------------------

# dadas dos tablas de similar estructura y nombres de variables

starwars_1 <- starwars
starwars_2 <- starwars

# puedo unirlas con la función bind rows 
starwars_unido <- bind_rows(starwars_1,
                            starwars_2)

# si no estoy segura de la estructura de lo puedo chequear con la funcion
# compare_df_cols de janitor

janitor::compare_df_cols(starwars_1,starwars_2)




# Tema 2: Repaso de gt ----------------------------------------------------
# trabajamos con la tabla sp500 que ya viene pre cargada en el paquete

# Defino un rango de fechas
start_date <- "2010-06-07"
end_date <- "2010-06-14"

# creo una objeto tabla 
tabla_sin_gt <- sp500 |>
  dplyr::filter(date >= start_date & date <= end_date) |>
  dplyr::select(-adj_close) 


tabla_sin_gt %>% 
  # la covierto en un objeto gt con la función gt()
  gt() %>% 
  # agrego un titulo y subtitulo con tab_header()
  tab_header(
    title = "Cotización S&P 500",
    subtitle = "Entre 2010-06-07 y 2010-06-14"
  ) %>% 
  # agrego un pie de pagina con tab_footnote()
  tab_footnote("Nota al pie contando cositas") %>% 
  # agrego un pie de la fuente con tab_source_note()
  tab_source_note("Fuente: lo saque del mismo paquete") %>% 
  # le pongo formato de dinero a las columnas
  fmt_currency() %>% 
  # le pongo formato de fecha a la columna fecha con un estilo 
  # dia mes (ver el resto de los estilos en la documentacion de la función)
  fmt_date(columns = date,  date_style = "day_m") %>%
  # le pongo formato de numero a la columna fecha
  # le pido que le ponga sufijos para que reduzca a billones
  # podes ver otras opciones en la documentación
  fmt_number(columns = volume,suffixing = TRUE )
