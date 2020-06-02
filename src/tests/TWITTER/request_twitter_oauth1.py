# -*- coding: utf-8 -*-
'''
Created on 23 abr. 2020

@author: MuNGuia10

API Rest - OAUTH TOKEN - TWITTER
https://api.twitter.com/labs/1/users?usernames={USERNAMES}&format=detailed

'''
# Importando librerías JSON
import json
# Importando librerías básicas de API REST
import requests

usernames = "Buenafuente"

url = f"https://api.twitter.com/labs/1/users?usernames={usernames}&format=detailed"

api_key = "D063saPRyoeH6u8Uy5vh05O5e"

access_token = "1253323820078780422-Krwr9k09Z2M7CteM1glkudgM2oe4af"

payload = {}
headers = {
  'Authorization': 'OAuth oauth_consumer_key="D063saPRyoeH6u8Uy5vh05O5e",oauth_token="1253323820078780422-Krwr9k09Z2M7CteM1glkudgM2oe4af",oauth_signature_method="HMAC-SHA1",oauth_timestamp="1587740244",oauth_nonce="IT2gHCI297B",oauth_version="1.0",oauth_signature="RBdANq%2FFCvxlx31JBvYRFDwbHjg%3D"',
  'Cookie': 'personalization_id="v1_RsVD6ci+uMaXDc+f2GTPBQ=="; guest_id=v1%3A158772238385561903'
}

response = requests.request("GET", url, headers=headers, data=payload)

json_response = json.loads(response.text)

print(json.dumps(json_response, indent=3))
