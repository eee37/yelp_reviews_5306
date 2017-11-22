require(leaps)
require(MASS)
#Best Subset Selection
fwd_stepwise_selection = regsubsets(stars~.-takeout,data=small_data, method = "forward")
summary(fwd_stepwise_selection)

fwd_stepwise_selection = regsubsets(review_count~.-takeout,data=small_data, method = "forward")
summary(fwd_stepwise_selection)