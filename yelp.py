#cd Desktop/OneDrive/Fall_2017/CS_5306/Yelp_Project
#encode('utf-8') to convert from bit to string
#Import Packages
import json
from pprint import pprint


#Ingest Business Data
business_dict = {};
with open('dataset/business.json') as business_data:
	for line in business_data:
		business = json.loads(line)
		business['photo_count'] = 0
		business_dict[business['business_id']] = business

#Ingest Photo Data & Aggregate Photo Count by Business
photo_dict = {};
with open('dataset/photo.json') as photo_data:
	for line in photo_data:
		photo = json.loads(line)
		photo_dict[photo['photo_id']] = photo
		#Update photo's business photo count
		business_dict[photo['business_id']]['photo_count'] = business_dict[photo['business_id']]['photo_count']  + 1

#Loop through all Businesses and Gather Rating and Photo Count Data
for business in business_dict:
