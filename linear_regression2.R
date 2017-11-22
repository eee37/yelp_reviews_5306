#Decided to exclude takeout too many blanks
#Exclude rows of data that have parking or price blank
small_data <- data_no_outliers[data_no_outliers$price!="blank", ]
nrow(small_data)
#91444
small_data <- data_no_outliers[data_no_outliers$garage!="blank", ]
nrow(small_data)
#82521
head(small_data)
nrow(small_data[small_data$photo_count==0,])
63121/82521
#rating fit small data set
rating_fit = lm(stars~.-takeout,data=small_data)
summary(rating_fit)
#rating fit big data set. not including variables w/ NAs or Blanks
rating_fit2 = lm(stars~photo_count+review_count+name_length+days_open,data=data_no_outliers)
summary(rating_fit2)

#Now look at review count linear models
review_count_fit = lm(review_count~.-takeout,data=small_data)
summary(review_count_fit)
#rating fit big data set. not including variables w/ NAs or Blanks
rating_fit2 = lm(review_count~photo_count+review_count+name_length+days_open+stars,data=data_no_outliers)
summary(rating_fit2)