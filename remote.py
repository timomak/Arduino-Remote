# remote.py
# from gpiozero import LED, Button
from time import sleep
import requests
import json
#
# button = Button(6)
# green = LED(17)
# red = LED(27)
# blue = LED(13)



# Remote API (https://timomak.github.io/Arduino-Remote/#/api-docs)
url = "https://remote-rest-api.herokuapp.com/arduino/motor"

def get_motor_state():
    """
    For the device to check what the motor actions should be.
    Can only be one of these three: "forward", "backward", "stop"
    """
    myRequest = requests.get(url)

    if (myRequest.ok):
        print("Successful Connection")
        print(str(myRequest.content))
    else:
      # If response code is not ok (200), print the resulting http error code with description
        myRequest.raise_for_status()
get_motor_state()

# def buttonPressed():
#     pass
#
# # It is a good practice not to hardcode the credentials. So ask the user to enter credentials at runtime
# myResponse = requests.get(url,auth=HTTPDigestAuth(raw_input("username: "), raw_input("Password: ")), verify=True)
# #print (myResponse.status_code)
#
# # For successful API call, response code will be 200 (OK)
# if(myResponse.ok):
#
#     # Loading the response data into a dict variable
#     # json.loads takes in only binary or string variables so using content to fetch binary content
#     # Loads (Load String) takes a Json file and converts into python data structure (dict or list, depending on JSON)
#     jData = json.loads(myResponse.content)
#
#     print("The response contains {0} properties".format(len(jData)))
#     print("\n")
#     for key in jData:
#         print key + " : " + jData[key]
# else:
#   # If response code is not ok (200), print the resulting http error code with description
#     myResponse.raise_for_status()
