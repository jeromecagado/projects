import sys
import json
import requests


access_key = "d1b14f76ce39fc2988fe0b534a3b9d31"
# Base URL for the exchangeratesapi
base_url = "https://api.exchangeratesapi.io/v1/"
endpoint = "convert"

def make_conversion(from_currency, to_currency, amount):

    # Construct the API URL
    api_url = f"{base_url}{endpoint}?access_key={access_key}&from={from_currency}&to={to_currency}&amount={amount}"

    # Make the API request
    response = requests.get(api_url)

    # Check if the request was successful (status code 200)
    if response.status_code == 200:
        # Parse the JSON response
        data = response.json()
        converted_amount = data["result"]

        return{
            to_currency: converted_amount
        }

    else:
        # Print an error message if the request was not successful
        print(f"Error: {response.status_code} - {response.text}")
        return None

if __name__ == '__main__':


    # get command line.
    from_currency = sys.argv[1]
    to_currency = sys.argv[2]
    amount = float(sys.argv[3])

    # perform calculations
    conversion = make_conversion(from_currency, to_currency, amount)
    if conversion is not None:
        print(json.dumps(conversion))
