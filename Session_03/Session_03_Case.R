# Case Study: Olympic Medals Visualization

# Load necessary libraries
library(readr)
library(dplyr)
library(ggplot2)
library(tidyr)

# 1. Import the data
medals <- read_csv("medals_total.csv")

# 2. Inspect the data
print(head(medals))
summary(medals)

# 3. Data Preparation
# Assuming the columns are: Country, Gold, Silver, Bronze, Total

# 4. Create a bar plot of total medals by country (top 20)
ggplot(medals %>% arrange(desc(Total)) %>% head(20), 
       aes(x = reorder(Country, Total), y = Total)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  coord_flip() +
  labs(title = "Top 20 Countries by Total Medals",
       x = "Country",
       y = "Total Medals") +
  theme_minimal()

# 5. Stacked bar plot of medal types
medals_long <- medals %>%
  select(Country, Gold, Silver, Bronze) %>%
  pivot_longer(cols = c(Gold, Silver, Bronze), 
               names_to = "Medal_Type", 
               values_to = "Count")

ggplot(medals_long %>% 
         group_by(Country) %>% 
         summarise(Total = sum(Count)) %>% 
         top_n(15, Total) %>% 
         left_join(medals_long), 
       aes(x = reorder(Country, Total), y = Count, fill = Medal_Type)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  scale_fill_manual(values = c("gold", "grey", "brown")) +
  labs(title = "Medal Distribution for Top 15 Countries",
       x = "Country",
       y = "Number of Medals") +
  theme_minimal()

# 6. Scatter plot: Relationship between Gold and Total medals
ggplot(medals, aes(x = Gold, y = Total)) +
  geom_point(aes(color = Country), alpha = 0.7) +
  geom_text(aes(label = Country), check_overlap = TRUE, vjust = 1.5, size = 3) +
  labs(title = "Relationship between Gold Medals and Total Medals",
       x = "Number of Gold Medals",
       y = "Total Number of Medals") +
  theme_minimal() +
  theme(legend.position = "none")

# 7. Pie chart of medal types for a specific country
country_of_interest <- "United States"  # Change this to any country in your dataset

country_medals <- medals %>%
  filter(Country == country_of_interest) %>%
  select(Gold, Silver, Bronze) %>%
  pivot_longer(cols = everything(), names_to = "Medal_Type", values_to = "Count")

ggplot(country_medals, aes(x = "", y = Count, fill = Medal_Type)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  scale_fill_manual(values = c("gold", "grey", "brown")) +
  labs(title = paste("Medal Distribution for", country_of_interest),
       fill = "Medal Type") +
  theme_void() +
  theme(legend.position = "right")

# 8. Correlation heatmap
correlation_matrix <- cor(medals[, c("Gold", "Silver", "Bronze", "Total")])

ggplot(data = reshape2::melt(correlation_matrix), aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  geom_text(aes(label = round(value, 2)), color = "black", size = 4) +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0) +
  theme_minimal() +
  labs(title = "Correlation Heatmap of Medal Types",
       x = "", y = "") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# 9. Function to create a custom plot
plot_medal_ratio <- function(data, medal_type) {
  data %>%
    mutate(Ratio = !!sym(medal_type) / Total) %>%
    arrange(desc(Ratio)) %>%
    head(10) %>%
    ggplot(aes(x = reorder(Country, Ratio), y = Ratio)) +
    geom_bar(stat = "identity", fill = "lightgreen") +
    coord_flip() +
    labs(title = paste("Top 10 Countries by", medal_type, "Medal Ratio"),
         x = "Country",
         y = paste(medal_type, "Medals / Total Medals")) +
    theme_minimal()
}

# Use the custom function
plot_medal_ratio(medals, "Gold")