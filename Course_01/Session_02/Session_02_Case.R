# Case Study: Online Store Sales Analysis

# 1. Load necessary packages
# install.packages(c("dplyr", "lubridate", "ggplot2"))
library(dplyr)
library(lubridate)
library(ggplot2)

# 2. Create sample data (data structure: data frame)
set.seed(2024) # you can access to the same data all time

sales <- data.frame(
  date = seq(as.Date("2023-01-01"), as.Date("2023-12-31"), by = "day"), # 365 days
  product = sample(c("A", "B", "C"), 365, replace = TRUE),
  quantity = sample(1:10, 365, replace = TRUE),
  unit_price = runif(365, 10, 100)
)

head(sales)

# 3. Function to calculate total sales
calculate_total <- function(quantity, price) {
  result <- quantity * price
  return(result)
}

# 4. Add total sales column using our function
sales$total <- mapply(calculate_total, sales$quantity, sales$unit_price)

head(sales)
# 5. Function to categorize sales
categorize_sale <- function(total) {
  if (total < 100) {
    return("Low")
  } else if (total < 500) {
    return("Medium")
  } else {
    return("High")
  }
}

# 6. Apply the categorization function
sales$category <- sapply(sales$total, categorize_sale)

tail(sales)

# 7. Basic analysis using dplyr
monthly_summary <- sales %>%
  mutate(month = floor_date(date, "month")) %>%
  group_by(month, product) %>%
  summarise(
    total_sales = sum(total),
    daily_average = mean(total),
    .groups = "drop"
  )

print(head(monthly_summary))

# 8. Visualization with ggplot2
ggplot(monthly_summary, aes(x = month, y = total_sales, color = product)) +
  geom_line() +
  geom_point() +
  labs(title = "Monthly Sales by Product",
       x = "Month",
       y = "Total Sales") +
  theme_minimal()

# 9. Function for top product analysis
top_product <- function(data, n = 1) {
  top <- data %>%
    group_by(product) %>%
    summarise(total_sales = sum(total)) %>%
    arrange(desc(total_sales)) %>%
    slice_head(n = n)
  
  return(top)
}

# 10. Use the top product function
top_product_result <- top_product(sales)
print(top_product_result)

# 11. Analysis of category distribution
category_distribution <- sales %>%
  group_by(category) %>%
  summarise(count = n()) %>%
  mutate(proportion = count / sum(count))

print(category_distribution)

# 12. Visualization of category distribution
ggplot(category_distribution, aes(x = "", y = proportion, fill = category)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  labs(title = "Distribution of Sales Categories") +
  theme_void()
