# -*- coding: utf-8 -*-

# Importando librería para el manejo de Directorios
import os

class Inicializar():
    # Directorio Base
    basedir = os.path.abspath(os.path.join(__file__, "../.."))
    dateFormat = '%d/%m/%Y'
    hourFormat = "%H%M%S"

    # JsonData
    json_data = basedir + u"/data"
    data_body = basedir + u"/data/data_body"
    data_responses = basedir + u"/data/data_response"

    Environment = 'PetStore.test'

    if Environment == 'PetStore.test':
        # API
        API_hostAddressBase = "https://petstore.swagger.io/v2/"

        # API HEADERS
        API_headers = {
            'version': '1.0-preview.1',
            'content-type': 'application/json',
        }

        # API BODY
        API_body = {}

        # API SUB-BODY DICTIONARY
        API_subBody_dict = {}

        # API SUB-BODY ARRAY
        API_subBody_array = []

        Scenary = {}

        # DATABASE CONECTION
        DB_DRIVER = "{PostgreSQL Unicode}"
        DB_SERVER = "localhost"
        DB_PORT = "5432"
        DB_USER = "postgres"
        DB_PASS = "7434C6F7RTM"
        DB_DATABASE = "udemy_api"


    if Environment == 'PetStore.dev':
        # API
        API_hostAddressBase = "https://petstore.swagger.io/v1/"

        # API HEADERS
        API_headers = {
            'version': '1.0-preview.1',
            'content-type': 'application/json',
        }

        # API BODY
        API_body = {}

        # API SUB-BODY DICTIONARY
        API_subBody_dict = {}

        # API SUB-BODY ARRAY
        API_subBody_array = []

        Scenary = { }

        # DATABASE CONECTION
        DB_DRIVER = "{PostgreSQL Unicode}"
        DB_SERVER = "localhost"
        DB_PORT = "5432"
        DB_USER = "postgres"
        DB_PASS = "7434C6F7RTM"
        DB_DATABASE = "udemy_api"