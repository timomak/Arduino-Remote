# remote.py
# from gpiozero import LED, Button
from time import sleep
import requests
import json
import threading

# button = Button(6)
# green = LED(17)
# red = LED(27)
# blue = LED(13)



# Remote API (https://timomak.github.io/Arduino-Remote/#/api-docs)
url = "https://remote-rest-api.herokuapp.com/arduino/motor"

state_of_motor = ""

def set_motor_state_to(state):
    if state != state_of_motor:
        if state == "stop":
            # Blue light on
            print("Blue")
        elif state == "forward":
            # Green light on
            print("Green")
        elif state == "backward":
            # Red light on
            print("Red")
    get_motor_state()

def get_motor_state():
    """
    For the device to check what the motor actions should be.
    Can only be one of these three: "forward", "backward", "stop"
    """
    myRequest = requests.get(url)

    if (myRequest.ok):
        print("Successful Connection")
        response = myRequest.text
        print("response:", response)
        # TODO: Handle Response
        set_motor_state_to(response)
    else:
      # If response code is not ok (200), print the resulting http error code with description
        myRequest.raise_for_status()

def start_thread():
    set_motor_state_to("stop")

threading.Thread(target=start_thread).start()


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
