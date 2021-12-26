library(tidyverse)
library(lubridate)


file.choose()

pwd <-"C:\\Users\\oscar\\Documents\\Git\\Rprojects\\data_csv\\ecobici_cdmx.csv"

raw_data <- read_csv("C:\\Users\\oscar\\Documents\\Git\\Rprojects\\data_csv\\ecobici_cdmx.csv")


#data process
viajes_diarios <- raw_data %>% 
  mutate(fecha_hora = dmy_hms(paste(Fecha_Retiro, Hora_Retiro))) %>% 
  filter(fecha_hora >= as.Date('2020-02-24'),
         fecha_hora <= as.Date('2020-02-27')) %>% 
  group_by(horas = floor_date(fecha_hora, unit = 'hour')) %>% 
  summarise(conteo = n())

#fill with zeros
horas_completas <- data.frame(
  horas = seq(
    floor_date(min(viajes_diarios$horas), unit = 'hour'),
    floor_date(max(viajes_diarios$horas), unit = 'hour'),
    by = 'hour'
  ))

#left join with hour
viajes_hora <- horas_completas %>% 
  group_by(horas_readondeadas = floor_date(horas, unit = 'hour')) %>% 
  left_join(viajes_diarios) %>% 
  mutate(conteo = ifelse(is.na(conteo), 0, conteo))

# grafica de lineas inicial
ggplot(data = viajes_diarios,
       aes(x = horas,
           y = conteo)) +
  geom_line()


#ARIMA
#Auto-regression of station mean 
#1 creando objeto ts para modelo
conteo_ts <- ts(viajes_hora$conteo,
                start = 1,
                frequency = 24)
viajes_hora$conteo
conteo_ts
# haciendo modelo ARIMA
# install.packages('forecast')
library(forecast)

ajuste <- auto.arima(y = conteo_ts)

summary(ajuste)

predicciones <- forecast(ajuste)
min(predicciones[['lower']])
max(predicciones[['upper']])

p_predict <- autoplot(predicciones)
p_predict


# graficando toda la semana
#data process
viajes_diarios <- raw_data %>% 
  mutate(fecha_hora = dmy_hms(paste(Fecha_Retiro, Hora_Retiro))) %>% 
  filter(fecha_hora >= as.Date('2020-02-24'),
         fecha_hora <= as.Date('2020-02-29')) %>% 
  group_by(horas = floor_date(fecha_hora, unit = 'hour')) %>% 
  summarise(conteo = n())

#fill with zeros
horas_completas <- data.frame(
  horas = seq(
    floor_date(min(viajes_diarios$horas), unit = 'hour'),
    floor_date(max(viajes_diarios$horas), unit = 'hour'),
    by = 'hour'
  ))

#left join with hour
viajes_hora <- horas_completas %>% 
  group_by(horas_readondeadas = floor_date(horas, unit = 'hour')) %>% 
  left_join(viajes_diarios) %>% 
  mutate(conteo = ifelse(is.na(conteo), 0, conteo))

# grafica de lineas inicial
ggplot(data = viajes_diarios,
       aes(x = horas,
           y = conteo)) +
  geom_line()






# procesamiento de datos
viajes_diarios <- raw_data %>% 
  mutate(fecha_hora = dmy_hms(paste(Fecha_Retiro, Hora_Retiro))) %>% 
  filter(fecha_hora >= as.Date('2020-02-24'),
         fecha_hora <= as.Date('2020-02-29')) %>% 
  group_by(horas = floor_date(fecha_hora, unit = 'hour')) %>% 
  summarise(conteo = n())

# rellenando los ceros
horas_completas <- data.frame(
  horas = seq(
    floor_date(min(viajes_diarios$horas), unit = 'hour'),
    floor_date(max(viajes_diarios$horas), unit = 'hour'),
    by = 'hour'
  ))

# left join con horas
viajes_hora <- horas_completas %>% 
  group_by(horas_readondeadas = floor_date(horas, unit = 'hour')) %>% 
  left_join(viajes_diarios) %>% 
  mutate(conteo = ifelse(is.na(conteo), 0, conteo))

# grafica de lineas inicial
ggplot(data = viajes_diarios,
       aes(x = horas,
           y = conteo)) +
  geom_line()+
  ylim(-551.5396, 4103.783) +
  labs(title = 'Realidad')

