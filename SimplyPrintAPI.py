import requests
import json

file_path = "C:/Users/tsvet/OneDrive/Documents/PortoflioS4/BIKE_PLA_11m45s.gcode" #path of the file that I want to sent
url = 'https://files.simplyprint.io/35300/files/Upload' #url to which the file will be sent
headers = {
    'X-API-KEY': '4ba17eea-6059-4885-9c92-05fd02093bfe',  #API Key
    'accept': 'application/json',  #informing the server that you want the response to be in JSON format
    'content-type': 'application/json' #informing the server that the data that is sent is in JSON format
}

files = {  #file data that will be sent in the request.
    'file': open(file_path, 'rb')
}

response = requests.post(url, headers=headers, files=files)
json_data = json.loads(response.text)
print(json_data)