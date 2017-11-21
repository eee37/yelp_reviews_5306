#cd Desktop/OneDrive/Fall_2017/CS_5306/Yelp_Project
#encode('utf-8') to convert from bit to string
#sudo python get-pip.py install pip 
#pip install pyyaml
#Import Packages
import json
import yaml
import csv
from pprint import pprint

#Ingest Business Data
business_dict = {}
business_dict_NY = {}
with open('dataset/business.json') as business_data:
	for line in business_data:
		business = yaml.safe_load(line)
		business['photo_count'] = 0
		if business['state'] == 'NY':
			business_dict_NY[business['business_id']] = business
		#business_dict[business['business_id']] = business

#Ingest Photo Data & Aggregate Photo Count by Business
photo_dict = {}

with open('dataset/sample_photo.json') as photo_data:
	for line in photo_data:
		photo = yaml.safe_load(line)
		photo_dict[photo['photo_id']] = photo
		#Filter through Photo's to Only Include Photos from ________.
		#Update photo's business photo count
		business_dict[photo['business_id']]['photo_count'] = business_dict[photo['business_id']]['photo_count']  + 1

#Loop through all Businesses and Gather Rating and Photo Count Data
#Want to look at photo count vs. avg rating and num reviews vs. photo count

#Attempt to export relevant data as CSV
bus_photo = []
for key, value in business_dict.iteritems():
	bus_photo.append([value['photo_count'], value['stars'], value['review_count'], value['attributes']['RestaurantsPriceRange2']])

with open('test.csv', 'wb') as myfile:
    wr = csv.writer(myfile, quoting=csv.QUOTE_ALL)
    wr.writerow(bus_photo)



#for this to work need single json

#Want:
#Business:
		#Number of Photos
		#Stars

#array["business name"] = {business information}
