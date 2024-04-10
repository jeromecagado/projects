# Microservice
The following document will show my partner how to request and receive data from the microservice.


## How to Programmatically Request Data:

To request the data from the microservice you will have to utilize the `subprocess` module in Python. Documentation on the `subprocess` module can be fine here: [Python documentation](https://docs.python.org/3/library/subprocess.html#module-subprocess).

How it works is by having the program run the command `subprocess.run()`. An example is below of how it is implemented. 


```python
import subprocess
import json

# create a function to pass the information to the microservice.
# When you call your get_conversion_example function you will pass in the following:
# from_currency will be the starting currency. Let's say you use USD for US currency. And you want to know
# how much 25 dollars would be in EU(European) currency. So pass in the from_currency, to_currency, and 25 as an example.

def get_conversion_example(from_currency, to_currency, amount):
    process = subprocess.run(
        ['python', 'microservice.py',
         str(from_currency), str(to_currency), str(amount)],
        text=True,
        capture_output=True
    )
```


## How to Programmatically Receive Data:

To receive data from the microservice, you must ensure there is no error in the process.

Once you make sure there is no error then you can deserialize the result of the `subprocess.run()` call. The result of the call will return you a Python dictionary of the result of your request. For your program, the microservice will return your to_currenncy and the amount of said currency. 

```python 
# This will get the data/receive the data from the microservice if there are no errors.
if process.returncode == 0:
    result = json.loads(process.stdout)
else:
    print(f'Error: {process.stderr}')
```

If there are no errors the information from the microservice will be stored in the result variable. You then print that variable to see the results. 

```python
# This is what the microservice will give the user once after you request and receive the below data. 
{'EUR': 23.353875}
```

## UML Sequence Diagram
![Assignment 6 UML Sequence Diagram](https://github.com/jcagado/Assignment9-Microservice/assets/122224291/b36e2566-f73f-4e15-8961-31cc7babda02)




 





