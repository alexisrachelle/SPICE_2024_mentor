#Double Line Graph Example:
##############################################################

#Package(s)
library(ggplot2)
library(tidyr)
library(scales)  # Load scales package for number formatting

# Data
data <- data.frame(
  year = c("2019", "2020", "2021"),
  NZ = c(4960000, 5060000, 5130000),
  papaNG = c(9542486, 9749640, 9949437)
)

# Reshape data from wide to long format
data_long <- pivot_longer(data, cols = c(NZ, papaNG), names_to = "Location", values_to = "Population")

# Add a grouping variable
data_long$group <- ifelse(data_long$Location == "NZ", "New Zealand", "Papa New Guinea")

# Visual
ggplot(data_long, aes(x = year, y = Population, color = group, group = group)) +
  geom_line() +
  geom_text(aes(label = format(Population, big.mark = ",")),  # Add data labels with thousand separators
            size = 3,
            vjust = -0.5,  # Adjust vertical position of labels
            hjust = 1) +  # Adjust horizontal position of labels
  labs(title = "Title",
       x = "Year",
       y = "Population",
       color = "Location") +
  scale_color_manual(values = c("blue", "red"),
                     labels = c("New Zealand", "Papua New Guinea")) +
  scale_y_continuous(labels = scales::label_number(scale = 1e-6))  # Formats y-axis labels in millions