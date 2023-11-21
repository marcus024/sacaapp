import requests

url = 'http://localhost:5000/predict_api'
r = requests.post(url,json={'temp':2, 'soilM':3, 'humidity':4,'area':5})
print(r.json())