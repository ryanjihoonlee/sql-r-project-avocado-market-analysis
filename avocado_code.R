
library(tidyverse)
library(scales)

## Data Import

avocado <- read_csv("/Users/ryanlee/Desktop/SQL/SQL Projects/Avocado/dataset/avocado.csv")

# Exploratory Data Analysis

avocado_summary <- avocado |> 
  group_by(year) |> 
  summarize(TotalVolume = sum(TotalVolume),
            SmallHassAvocado = sum(plu4046),
            LargeHassAvocado = sum(plu4225),
            ExtraLargeHassAvocado = sum(plu4770))

ggplot(avocado_summary, aes(x = year)) +
  geom_line(aes(y = TotalVolume, color = "Total Volume")) +
  geom_line(aes(y = SmallHassAvocado, color = "Small Hass Avocado")) +
  geom_line(aes(y = LargeHassAvocado, color = "Large Hass Avocado")) +
  geom_line(aes(y = ExtraLargeHassAvocado, color = "Extra Large Hass Avocado")) +
  scale_color_manual(values = c("Total Volume" = "#568203", "Small Hass Avocado" = "#5B3A29", "Large Hass Avocado" = "#A57C2C", "Extra Large Hass Avocado" = "#4B8F8C")) +
  scale_y_continuous(labels = comma) +
  labs(title = "Annual Sales Volume of Avocados", x = "Year", y = "Volume of Avocados Sold (in units)") +
  theme(plot.title = element_text(face = "bold"))

ggplot(avocado_summary, aes(x = year)) +
  geom_line(aes(y = SmallHassAvocado, color = "Small Hass Avocado")) +
  geom_line(aes(y = LargeHassAvocado, color = "Large Hass Avocado")) +
  geom_line(aes(y = ExtraLargeHassAvocado, color = "Extra Large Hass Avocado")) +
  scale_color_manual(values = c("Small Hass Avocado" = "#568203", "Large Hass Avocado" = "#5B3A29", "Extra Large Hass Avocado" = "#A57C2C")) +
  scale_y_continuous(labels = comma) +
  labs(title = "Annual Sales Volume of Avocados by Size", x = "Year", y = "Volume of Avocados Sold (in units)") +
  theme(plot.title = element_text(face = "bold"))

regions <- c("West", "California", "SouthCentral", "Northeast", "Southeast", "GreatLakes", "Midsouth", "Plains")

selected_regions <- avocado |> 
  filter(region %in% regions)

region_data <- selected_regions |> 
  group_by(region) |> 
  summarize(TotalVolume = sum(TotalVolume), na.rm = TRUE)

ggplot(region_data, aes(x = fct_reorder(region, TotalVolume, .desc = TRUE), y = TotalVolume)) +
  geom_bar(stat = "identity", fill = "#568203") +
  scale_y_continuous(labels = comma) +
  labs(title = "Total Volume of Avocados Sold by Region", x = "Region", y = "Total Volume (in units)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 10),
        plot.title = element_text(face = "bold"))

cities <- c("LosAngeles", "NewYork", "DallasFtWorth", "PhoenixTucson", "Houston", "Denver", "BaltimoreWashington", "SanFrancisco", "Chicago")

selected_cities <- avocado |> 
  filter(region %in% cities)

city_data <- selected_cities |> 
  group_by(region) |> 
  summarize(TotalVolume = sum(TotalVolume), na.rm = TRUE)

new_cities <- c("Los Angeles", "NYC", "Dallas/Fort Worth", "Phoenix/Tucson", "Houston", "Denver", "Baltimore/Washington", "San Francisco", "Chicago")

ggplot(city_data, aes(x = fct_reorder(region, TotalVolume, .desc = TRUE), y = TotalVolume)) +
  geom_bar(stat = "identity", fill = "#568203") +
  scale_x_discrete(labels = new_cities) +
  scale_y_continuous(labels = comma) +
  labs(title = "Total Volume of Avocados Sold by City", x = "City", y = "Total Volume (in units)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 10),
        plot.title = element_text(face = "bold"))

los_angeles <- avocado |> 
  filter(region == "LosAngeles")

los_angeles_summary <- los_angeles |> 
  group_by(year) |> 
  summarize(TotalVolume = sum(TotalVolume),
            SmallHassAvocado = sum(plu4046),
            LargeHassAvocado = sum(plu4225),
            ExtraLargeHassAvocado = sum(plu4770))

ggplot(los_angeles_summary, aes(x = year)) +
  geom_line(aes(y = TotalVolume, color = "Total Volume")) +
  geom_line(aes(y = SmallHassAvocado, color = "Small Hass Avocado")) +
  geom_line(aes(y = LargeHassAvocado, color = "Large Hass Avocado")) +
  geom_line(aes(y = ExtraLargeHassAvocado, color = "Extra Large Hass Avocado")) +
  scale_color_manual(values = c("Total Volume" = "#568203", "Small Hass Avocado" = "#5B3A29", "Large Hass Avocado" = "#A57C2C", "Extra Large Hass Avocado" = "#4B8F8C")) +
  scale_y_continuous(labels = comma) +
  labs(title = "Annual Sales Volume of Avocados in Los Angeles", x = "Year", y = "Volume of Avocados Sold (in units)") +
  theme(plot.title = element_text(face = "bold"))

average_price_year <- avocado |> 
  group_by(year) |> 
  summarize(AveragePrice = mean(AveragePrice, na.rm = TRUE))

ggplot(average_price_year, aes(x = year, y = AveragePrice)) +
  geom_line(size = 1, color = "#568203") +
  geom_point(size = 2, color = "#5B3A29") +
  labs(title = "Average Avocado Price by Year", x = "Year", y = "Average Price (in $)") +
  theme(plot.title = element_text(face = "bold"))

total_volume_year <- avocado |> 
  group_by(year) |> 
  summarize(TotalVolume = sum(TotalVolume, na.rm = TRUE))

ggplot(total_volume_year, aes(x = year, y = TotalVolume)) +
  geom_line(size = 1, color = "#568203") +
  geom_point(size = 2, color = "#5B3A29") +
  scale_y_continuous(labels = comma) +
  labs(title = "Total Volume of Avocadoes Sold by Year", x = "Year", y = "Total Volume") +
  theme(plot.title = element_text(face = "bold"))

top_cities <- c("LosAngeles", "NewYork", "DallasFtWorth", "PhoenixTucson", "Houston", "Denver", "BaltimoreWashington", "SanFrancisco", "Chicago")

selected_top_cities <- avocado |> 
  filter(region %in% top_cities)

top_cities_data <- selected_top_cities |> 
  group_by(year, region) |> 
  summarize(TotalVolume = sum(TotalVolume), na.rm = TRUE)

ggplot(top_cities_data, aes(x = year, y = TotalVolume, color = region)) +
  geom_smooth(method = "loess", size = 1, se = FALSE) +
  scale_y_continuous(labels = comma) +
  labs(title = "Total Avocado Sales Volume in Top U.S. Cities (2015-2021)", x = "Year", y = "Total Volume", color = "City" ) +
  theme(plot.title = element_text(face = "bold"))

totalus <- avocado |> 
  filter(region %in% "TotalUS")

totalus_data <- totalus |> 
  group_by(year, region) |> 
  summarize(TotalVolume = sum(TotalVolume), na.rm = TRUE)

ggplot(totalus_data, aes(x = year, y = TotalVolume, color = region)) +
  geom_smooth(method = "loess", size = 1, se = FALSE) +
  scale_y_continuous(labels = comma) +
  scale_color_manual(values = c("TotalUS" = "#568203")) + 
  labs(title = "Total Avocado Sales Volume in the US (2015-2021)", x = "Year", y = "Total Volume") +
  theme(plot.title = element_text(face = "bold"), legend.position = "none" )
