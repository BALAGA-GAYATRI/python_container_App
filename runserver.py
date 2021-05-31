from os import environ 
from FlaskWebProject1 import app 

if __name__ == '__main__': 
# Run the app server with default Flask port 
app.run(port=5555, host='0.0.0.0')
