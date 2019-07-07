# Remote API
Use the iOS app to remotely control your Rasberry pi or Arduino.

> The first version of the Remote Flask HTTP RESTFUL Route API

## Introduction
This documentation will help you get familiar with the resources of the **Remote API** and show you how to make different queries, so that you can get the most out of it.

## Rest
**Base url:** __https://remote-rest-api.herokuapp.com__

The base url contains information about all available API's resources. All requests are GET requests and go over https. All responses will return data in json.

The base URL will return a string to confirm having made the connection.

*Sample request*
```URL
https://remote-rest-api.herokuapp.com/
```
```Python
"Hello, Remote API!"
```

___

There are currently two avaliable functions on this remote:
* __Motor__: can tell it to move forward and backward.
* __Sensor__: can check if the button is being pressed on the arduino or rasberry pi.

___

## Motor
The iphone app will have to tell the api to move forward or backward and have a route for the arduino or rasberry pi to move the motor.

## iOS Route (POST)
```URL
https://remote-rest-api.herokuapp.com/ios/motor
```
Sample POST
```
{'state':'forward'}
```
```
{'state':'stop'}
```
```
{'state':'backward'}
```

## Rasberry or Arduino Motor (GET)
```URL
https://remote-rest-api.herokuapp.com/arduino/motor
```
Sample Output
```
forward
```
```
stop
```
```
backward
```
## Sensor
The iphone app will have to tell the api to move forward or backward and have a route for the arduino or rasberry pi to move the motor.

## iOS Route (GET)
```URL
https://remote-rest-api.herokuapp.com/ios/sensor
```
Sample Output
```
0
```
```
1
```

## Rasberry or Arduino Motor (POST)
```URL
https://remote-rest-api.herokuapp.com/arduino/sensor
```
Sample POST
```
0
```
```
1
```
