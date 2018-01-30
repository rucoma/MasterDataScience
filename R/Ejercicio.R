library(data.table)
library(tidyverse)

system.time(
  {
    path <- './salesForcasting/'

    train <- fread(input = paste0(path, 'train_sample.csv'))
    stores <- fread(input = paste0(path, 'stores.csv'))
    items <- fread(input = paste0(path, 'items.csv'))
    transactions <- fread(input = paste0(path, 'transactions.csv'))

    # Data cleaning
    train[, `:=` (V1 = NULL, date = as.Date(date, format = '%Y-%m-%d'))]
    train[, round_unit_sales := round(unit_sales, digits = 0)]

    # Evolución de venta por día
    salesPerDay <- train[, .(salesDay = sum(round_unit_sales)), by = date]
    plot(x = salesPerDay$date, y = salesPerDay$salesDay, type = 'l')
    salesPerDay[, `:=` (weekday = weekdays(date),
                        month = month(date))]

    salesWeekday <- salesPerDay[, .(salesWeekday = sum(salesDay)), by = weekday]
    barplot(salesWeekday$salesWeekday, names.arg = salesWeekday$weekday)

    # Evolución de crecimiento de ventas por día.
    salesPerDay[, dif := (salesDay / shift(x = salesDay, n = 1, type = 'lag') - 1) * 100]

    # ¿Cuál son las top 3 Tiendas en venta?
    salesPerStore <- train[, .(salesStore = sum(round_unit_sales)), by = store_nbr][order(-salesStore)]
    top3Stores <- head(salesPerStore, 3)
    top3Stores <- stores[top3Stores, on = 'store_nbr']

    # ¿Cuáles Productos más vendidos y de qué categorías son?
    salesPerProduct <- train[, .(salesProduct = sum(round_unit_sales)), by = item_nbr][order(-salesProduct)]
    top3Product <- head(salesPerProduct, 3)
    top3Product <- items[top3Product, on = 'item_nbr']

    # Escribe cuál es el producto más vendido para cada tienda
    productPerStore <- train[, .(Sales = sum(unit_sales)), by = .(store_nbr, item_nbr)] %>%
      .[order(store_nbr, -Sales)] %>%
      .[, lapply(.SD, head, 1), by = store_nbr]
    productPerStore <- items[productPerStore, on = 'item_nbr']

    # ¿Qué tienda tiene más productos en oferta en el mes de Junio?
    promoJune <- train[month(date) == 6 & onpromotion ==TRUE, .(uniqProdPromo = length(unique(item_nbr))), by = .(store_nbr)] %>%
      .[order(-uniqProdPromo)] %>%
      head(., 5)
    promoJune <- stores[promoJune, on = 'store_nbr']

    # ¿Qué ciudad tiene el número más alto de tiendas?
    storesPerCity <- train[, 'store_nbr']
    storesPerCity <- storesPerCity[!duplicated(storesPerCity$store_nbr)]
    storesPerCity <- stores[storesPerCity, on = 'store_nbr'] %>%
      .[, .(N = .N), by = city] %>%
      .[order(-N)] %>%
      head(., 5)

    # ¿Qué ciudad tiene más alto promedio de venta por número de tiendas?
    averageSapesPerStore <- train[, .(sales = sum(unit_sales)), by = store_nbr]
    averageSapesPerStore <- stores[averageSapesPerStore, on = 'store_nbr']
    averageSapesPerStore <- averageSapesPerStore[, .(sales = sum(sales), N = .N), by = city] %>%
      .[, avgSales := sales / N, by = city] %>%
      .[order(-avgSales)] %>%
      head(., 5)

    # evolución de porcentaje de productos perecederos por día
    perishablePerDay <- train[, .(sales = sum(unit_sales)), by = .(date, item_nbr)]
    perishablePerDay <- items[perishablePerDay, on = 'item_nbr'] %>%
      .[, .(sales = sum(sales)), by = .(date, perishable)] %>%
      .[, pctSales := sales / sum(sales), by = date] %>%
      .[perishable == 1]

    plot(perishablePerDay$date, perishablePerDay$pctSales, type = 'l')

    # ¿Cuál es el día de semana que se vende más? ¿Y menos?
    # Contestada antes

    # ¿Evolución de ventas por cluster de tiendas.
    salesPerCluster <- train[, .(sales = sum(unit_sales)), by = .(date, store_nbr)]
    salesPerCluster <- stores[salesPerCluster, on = 'store_nbr'] %>%
      .[, .(sales = sum(sales)), by = .(date, cluster)]
    ggplot(salesPerCluster, aes(x = date, y = sales, col = factor(cluster))) +
      geom_line()

    # ¿Cuál es el producto más/menos vendido por cada tienda?
    topBottomProd <- train[, .(sales = sum(unit_sales)), by = .(store_nbr, item_nbr)] %>%
      .[order(store_nbr, -sales)]
    topProd <- topBottomProd[, head(.SD, 1), by = 'store_nbr'][, rk := 'TOP']
    bottomProd <- topBottomProd[, tail(.SD, 1), by = 'store_nbr'][, rk := 'BOTTOM']
    topBottom <- rbind(topProd, bottomProd) %>%
      .[order(store_nbr, -sales)]

    # ¿Para cada tienda cuál es la familia de productos que vende más?
    salesPerFamily <- train[, .(sales = sum(unit_sales)), by = .(store_nbr, item_nbr)]
    salesPerFamily <- items[salesPerFamily, on = 'item_nbr']
    salesPerFamily <- salesPerFamily[, .(sales = sum(sales)), by = .(store_nbr, family)] %>%
      .[order(store_nbr, -sales)] %>%
      .[, head(.SD, 1), by = store_nbr]

    # ¿Qué 5 productos ha tenido las subida más grande de venta de Mayo a Junio?
    salesMayJune <- train[month(date) == 5 | month(date) == 6, .(sales = sum(unit_sales)), by = .(month(date), item_nbr)] %>%
      .[order(item_nbr, month)] %>%
      .[, evol := sales / shift(sales, 1, 'lag') - 1, by = item_nbr] %>%
      .[!is.na(evol)] %>%
      .[order(-evol)] %>%
      head(., 5)
  }
)
