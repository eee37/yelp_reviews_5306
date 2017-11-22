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
with open('dataset/businesslite.json') as business_data:
	for line in business_data:
		business = yaml.safe_load(line)
		business['photo_count'] = 0
		business_dict[business['business_id'].encode('utf-8')] = business

photo_dict = {}

with open('dataset/photos.json') as photo_data:
	for line in photo_data:
		photo = json.loads(line)
		photo_dict[photo['photo_id']] = photo
		if business_dict.has_key(photo['business_id'].encode('utf-8')):
			business_dict[photo['business_id'].encode('utf-8')]['photo_count'] = business_dict[photo['business_id'].encode('utf-8')]['photo_count']  + 1

with open('testv3.csv', 'wb') as myfile:
	wr = csv.writer(myfile, delimiter=',',
                            quotechar='|', quoting=csv.QUOTE_MINIMAL)
	wr.writerow(["photo_count", "stars", "review_count", "name_length","days_open",  "takeout", "parking"])
	for key, value in business_dict.iteritems():
		wr.writerow(
				[value['photo_count'],
				value['stars'], 
				value['review_count'], 
				value['attributes']['RestaurantsPriceRange2'] if value['attributes'].has_key('RestaurantsPriceRange2') else "blank", 
				len(value['name']), 
				len(value["hours"]),
				value['attributes']['RestaurantsTakeOut'] if value['attributes'].has_key('RestaurantsTakeOut') else "blank",
				(str(value['attributes']['BusinessParking']["garage"]) + " " +  str(value['attributes']['BusinessParking']["street"]) + " " + str(value['attributes']['BusinessParking']["validated"]) + " " + str(value['attributes']['BusinessParking']["lot"]) + " " + str(value['attributes']['BusinessParking']["valet"])) 
				if (value['attributes'].has_key('BusinessParking') and len(value['attributes']['BusinessParking']) == 5) else "blank"])
		#not all businesses have value['attributes']['RestaurantsPriceRange2'] defined

