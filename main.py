from flask import Flask, request, jsonify

app = Flask(__name__)

# Motor actions
motor_state = "stop"

def motor(action):
    if action is "forward":
        # Ping arduino to move motor forward.
        return "forward"
    elif action is "stop":
        # TODO: Ping arduino to stop moving the motor.
        return "stop"
    elif action is "backward":
        # TODO: Ping arduino to move the motor backward.
        return "backward"


# Sensor actions
sensor_state = "0"

# Test app
@app.route("/", methods=['GET'])
def home():
    return "Hello, Arduino Remote!"

# App to change motor value
@app.route('/ios/motor', methods=['POST'])
def signal_motor():
    # Handle error
    if not request.json or not 'state' in request.json:
        abort(400)

    # update motor state
    global motor_state
    motor_state = request.json['state']
    return jsonify({'state': motor_state}), 201

# Tell arduino the motor state
@app.route("/ios/sensor", methods=['GET'])
def check_sensor():
    global sensor_state
    return jsonify({'state': sensor_state}), 201


# Tell arduino the motor state
@app.route("/arduino/motor", methods=['GET'])
def check_motor():
    global motor_states
    return motor(motor_state) # In the function for now inn case I need to return something different.

# Arduino Sensor state
@app.route('/arduino/sensor', methods=['POST'])
def signal_sensor():
    # Handle error
    if not request.json or not 'state' in request.json:
        abort(400)

    # update motor state
    global sensor_state
    sensor_state = request.json['state']
    return jsonify({'state': sensor_state}), 201


@app.errorhandler(404)
def not_found(error):
    return make_response(jsonify({'error': 'Not found'}), 404)

if __name__ == '__main__':
    app.run()


# # Example of RESTful API
# tasks = [ # Sample data
#     {
#         'id': 1,
#         'title': u'Buy groceries',
#         'description': u'Milk, Cheese, Pizza, Fruit, Tylenol',
#         'done': False
#     },
#     {
#         'id': 2,
#         'title': u'Learn Python',
#         'description': u'Need to find a good Python tutorial on the web',
#         'done': False
#     }
# ]
#
# def make_public_task(task):
#     new_task = {}
#     for field in task:
#         if field == 'id':
#             new_task['uri'] = url_for('get_task', task_id=task['id'], _external=True)
#         else:
#             new_task[field] = task[field]
#     return new_task
#
# @app.route('/todo/api/v1.0/tasks', methods=['GET'])
# def get_tasks():
#     return jsonify({'tasks': [make_public_task(task) for task in tasks]})
#
# @app.route('/todo/api/v1.0/tasks/<int:task_id>', methods=['GET'])
# def get_task(task_id):
#     """
#     Get the user's task for id.
#     Runtime: O(n)
#     """
#     task = [task for task in tasks if task['id'] == task_id]
#     if len(task) == 0:
#         abort(404)
#     return jsonify({'task': task[0]})
#
# @app.route('/todo/api/v1.0/tasks', methods=['POST'])
# def create_task():
#     if not request.json or not 'title' in request.json:
#         abort(400)
#     task = {
#         'id': tasks[-1]['id'] + 1,
#         'title': request.json['title'],
#         'description': request.json.get('description', ""),
#         'done': False
#     }
#     tasks.append(task)
#     return jsonify({'task': task}), 201
#
#
# @app.route('/todo/api/v1.0/tasks/<int:task_id>', methods=['PUT'])
# def update_task(task_id):
#     task = [task for task in tasks if task['id'] == task_id]
#     if len(task) == 0:
#         abort(404)
#     if not request.json:
#         abort(400)
#     if 'title' in request.json and type(request.json['title']) != unicode:
#         abort(400)
#     if 'description' in request.json and type(request.json['description']) is not unicode:
#         abort(400)
#     if 'done' in request.json and type(request.json['done']) is not bool:
#         abort(400)
#     task[0]['title'] = request.json.get('title', task[0]['title'])
#     task[0]['description'] = request.json.get('description', task[0]['description'])
#     task[0]['done'] = request.json.get('done', task[0]['done'])
#     return jsonify({'task': task[0]})
#
# @app.route('/todo/api/v1.0/tasks/<int:task_id>', methods=['DELETE'])
# def delete_task(task_id):
#     task = [task for task in tasks if task['id'] == task_id]
#     if len(task) == 0:
#         abort(404)
#     tasks.remove(task[0])
#     return jsonify({'result': True})
