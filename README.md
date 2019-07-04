# Arduino-Remote
> Making an iOS app to remote control an Arduino.

# The Arduino
## Tasks
* Will have a `button as a sensor`. Every time it is pressed, it will make an `API call` that will result in a response sent to the phone.
* It will also have a `motor` that can be `activated through API calls`.
* The API calls are gonna be made on a separate thread.

# Backend
## Tasks
* RESTful Routes
* Flask API
* DOCUMENTED!

# Frontend
## Tasks
* Make design programmatically.
* Connect to API.
* Use Concurrency to send and receive API calls.

# The app will have:
* `Forward Button` - That will call an API to let the arduino to spin the motor forward.
* `Backward Button` - That will call an API to let the arduino to spin the motor backward.
* `Rocketship Indicator` - That will rotate when the button on the arduino is being pressed.

# Future Plans
* This project is gonna be the ground work for many future apps I make and is gonna be open source.
  * I can add more functionality and make a really cool all in one arduino remote app.
  * I can also make an app that will allow anyone to connect their arduino to the app.

# Preview of app
![1](/img/1.png)
<!-- <br><br><br>![2](/img/2.png) -->

<br><br>

# Flask Instructions
To *create* virtualenv:
* `virtualenv flask`

To *run* virtualenv:
* `source bin/activate`

To *start* flask *locally*:
* `FLASK_APP=main.py flask run`
