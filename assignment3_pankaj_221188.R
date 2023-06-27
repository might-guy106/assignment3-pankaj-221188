#Question 1

library(ggplot2)

data(iris)
head(iris)
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  geom_point() +
  
  labs(x = "Sepal Length", y = "Petal Length", title = "Scatterplot of Sepal Length and Petal Length") +
  scale_color_manual(values = c("#009E73", "#FF0099", "#0000FF"), 
                     labels = c("Setosa", "Versicolor", "Virginica")) +
  
  theme_light()

# there are 3 species in iris dataset
# from the plot, the sepal and petal lengths of virginica is more than versicolor (mostly)
# and versicolor is more than setosa by far


# QUESTION NO 2

data(txhousing, package = "ggplot2")
str(txhousing)
summary(txhousing)
missing_values <- sum(!complete.cases(txhousing))
cat("No of missing values:", missing_values, "\n")

# Scatterplot of sales by date

ggplot(txhousing, aes(x = date, y = sales),colour=city) +
  geom_point() +
  labs(x = "Date", y = "Sales",title = "Sales by Date") +
  theme_light()

# Scatterplot of median housing price by date
ggplot(txhousing, aes(x = date, y = median)) +
  geom_point() +
  labs(x = "Date", y = "Median Housing Price",title ="Median Housing Price by Date" ) +
  theme_bw()


# Bar plot of sales by month

txhousing$month <- format(txhousing$month, "%b")
ggplot(txhousing, aes(x = month)) +
  geom_bar() +
  labs(x = "Month", y = "Sales", title = "Sales by Month") +
  theme_minimal()

# Boxplot of sales by year

txhousing_sales <- txhousing[, c("year", "sales")]

ggplot(txhousing_sales, aes(x = year, y = sales ,)) +
  geom_boxplot() +
  facet_grid(year ~ ., scales = "free_x", space = "free_x") +
  labs(x = "Sale", y = "Year", title = "Box Plot of Sales by Year") +
  theme_minimal()


#Question 3

titanic = read.csv("D:/studies&projects/Projects/data science with R/titanic.csv")

titanic$Survived <- ifelse(titanic$Survived == 0, "dead", "survived")

final_Plot = ggplot(data=titanic,aes(y=Survived ,x=Fare,fill = Sex))+
  geom_boxplot(position = "dodge")+
  facet_grid(Survived ~ ., scales = "free_y", space = "free_y") +
  labs(x = "Fare", y = "", title = "Titanic") +
  theme_minimal()

final_Plot  
