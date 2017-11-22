#Decided to exclude takeout too many blanks
#Exclude rows of data that have parking or price blank
small_data <- full_data[full_data$price!="blank", ]
nrow(small_data)
#96355
small_data <- full_data[full_data$garage!="blank", ]
nrow(small_data)
#87221
head(small_data)
#rating fit small data set
rating_fit = lm(stars~.-takeout,data=small_data)
summary(rating_fit)
#rating fit big data set. not including variables w/ NAs or Blanks
rating_fit2 = lm(stars~photo_count+review_count+name_length+days_open,data=full_data)
summary(rating_fit2)