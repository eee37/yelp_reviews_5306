#get rid of outliers
data_no_outliers = full_data[full_data$photo_count<10,]
nrow(data_no_outliers)
#151668
151668/156639
#count businesses with 0 photos
nrow(data_no_outliers[data_no_outliers$photo_count==0,])
#128789
128789/156639
#histogram of photo count
hist(data_no_outliers$photo_count,breaks=10)
# Simple Scatterplot
plot(data_no_outliers$photo_count, data_no_outliers$stars,main="Rating vs. Photo Count", xlab="Photo Count", ylab="Rating") 
plot(data_no_outliers$photo_count, data_no_outliers$review_count,main="Review Count vs. Photo Count", xlab="Photo Count", ylab="Review Count")

total_photo_count = rep(0, 9)
count = rep(0, 9)
for(row in 1:dim(data_no_outliers)[1]){
  #for(row in c(1,2)){
  if(data_no_outliers[row,2] == 1){
    i = 1
    count[i] = count[i] + 1
    total_photo_count[1] = total_photo_count[1] + data_no_outliers[row,1]
  }
  else if(data_no_outliers[row,2] == 1.5){
    i = 2
    count[i] = count[i] + 1
    total_photo_count[i] = total_photo_count[i] + data_no_outliers[row,1]
    
  }
  else if(data_no_outliers[row,2] == 2){
    i = 3
    count[i] = count[i] + 1
    total_photo_count[i] = total_photo_count[i] + data_no_outliers[row,1]
    
  }
  else if(data_no_outliers[row,2] == 2.5){
    i = 4
    count[i] = count[i] + 1
    total_photo_count[i] = total_photo_count[i] + data_no_outliers[row,1]
    
  }
  else if(data_no_outliers[row,2] == 3){
    i = 5
    count[i] = count[i] + 1
    total_photo_count[i] = total_photo_count[i] + data_no_outliers[row,1]
    
  }
  else if(data_no_outliers[row,2] == 3.5){
    i = 6
    count[i] = count[i] + 1
    total_photo_count[i] = total_photo_count[i] + data_no_outliers[row,1]
    
  }
  else if(data_no_outliers[row,2] == 4){
    i = 7
    count[i] = count[i] + 1
    total_photo_count[i] = total_photo_count[i] + data_no_outliers[row,1]
    
  }
  else if(data_no_outliers[row,2] == 4.5){
    i = 8
    count[i] = count[i] + 1
    total_photo_count[i] = total_photo_count[i] + data_no_outliers[row,1]
    
  }
  else{
    i = 9
    count[i] = count[i] + 1
    total_photo_count[i] = total_photo_count[i] + data_no_outliers[row,1]
    
  }
}
#calculate average photo count per rating
average_photos = c()
for(i in 1:9){
  average_photos = c(average_photos, total_photo_count[i]/count[i])
}
#Graph bar plot
barplot(average_photos, main="Average Photo Count for Each Rating Level", names.arg=c(1,1.5,2,2.5,3,3.5,4,4.5,5))