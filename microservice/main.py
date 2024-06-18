import subprocess
import json


def get_conversion_data(from_currency, to_currency, amount):
    process = subprocess.run(
        ['python', 'microservice.py',
         str(from_currency), str(to_currency), str(amount)],
        text=True,
        capture_output=True
    )

    if process.returncode == 0:
        result = json.loads(process.stdout)
        return result
    else:
        print(f'Error: {process.stderr}')


# user data
from_currency = "USD"
to_currency = "PHP"
amount = 25
currency_convert = get_conversion_data(from_currency, to_currency, amount)
print(currency_convert)

