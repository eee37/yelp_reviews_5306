#cd Desktop/OneDrive/Fall_2017/CS_5306/Yelp_Project
#Import Packages
import json
from pprint import pprint


#Ingest Data
business_array = [];
with open('dataset/sample.json') as business_data:
	for line in business_data:
		business_array.append(json.loads(line))



#for this to work need single json

#Want:
#Business:
		#Number of Photos
		#Stars

#array["business name"] = {business information}