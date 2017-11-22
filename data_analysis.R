#set wd
setwd("Desktop/OneDrive/Fall_2017/CS_5306/Yelp_Project")
#load data
full_data<-read.csv("testv3.csv",sep=",",header=TRUE)
#get rid of rows with a lot of photos
nrow(full_data)
#156639
#summary stats stars no factor
summary(full_data)
# Simple Scatterplot
plot(full_data$photo_count, full_data$stars,main="Rating vs. Photo Count", xlab="Photo Count", ylab="Rating")   

plot(full_data$stars)
plot(full_data$photo_count, full_data$stars,main="Rating vs. Photo Count", xlab="Photo Count", ylab="Rating", xlim=c(0,400))
plot(full_data$photo_count, full_data$review_count,main="Review Count vs. Photo Count", xlab="Photo Count", ylab="Review Count", xlim=c(0,400))
str(full_data) #allows you to see the classes of the variables
#Calculate Avg Photo Count for each different rating
#Convert Stars to Factor????
full_data$stars_factor <- factor(full_data$stars)
#summary stats stars  factor
summary(full_data)
summary(full_data$stars)
total_photo_count = rep(0, 9)
count = rep(0, 9)
for(row in 1:dim(full_data)[1]){
#for(row in c(1,2)){
  if(full_data[row,2] == 1){
    i = 1
    count[i] = count[i] + 1
    total_photo_count[1] = total_photo_count[1] + full_data[row,1]
  }
  else if(full_data[row,2] == 1.5){
    i = 2
    count[i] = count[i] + 1
    total_photo_count[i] = total_photo_count[i] + full_data[row,1]
    
  }
  else if(full_data[row,2] == 2){
    i = 3
    count[i] = count[i] + 1
    total_photo_count[i] = total_photo_count[i] + full_data[row,1]
    
  }
  else if(full_data[row,2] == 2.5){
    i = 4
    count[i] = count[i] + 1
    total_photo_count[i] = total_photo_count[i] + full_data[row,1]
    
  }
  else if(full_data[row,2] == 3){
    i = 5
    count[i] = count[i] + 1
    total_photo_count[i] = total_photo_count[i] + full_data[row,1]
    
  }
  else if(full_data[row,2] == 3.5){
    i = 6
    count[i] = count[i] + 1
    total_photo_count[i] = total_photo_count[i] + full_data[row,1]
    
  }
  else if(full_data[row,2] == 4){
    i = 7
    count[i] = count[i] + 1
    total_photo_count[i] = total_photo_count[i] + full_data[row,1]
    
  }
  else if(full_data[row,2] == 4.5){
    i = 8
    count[i] = count[i] + 1
    total_photo_count[i] = total_photo_count[i] + full_data[row,1]
    
  }
  else{
    i = 9
    count[i] = count[i] + 1
    total_photo_count[i] = total_photo_count[i] + full_data[row,1]
    
  }
}
#calculate average photo count per rating
average_photos = c()
for(i in 1:9){
  average_photos = c(average_photos, total_photo_count[i]/count[i])
}
#Graph bar plot
barplot(average_photos, main="Average Photo Count for Each Rating Level", names.arg=c(1,1.5,2,2.5,3,3.5,4,4.5,5))