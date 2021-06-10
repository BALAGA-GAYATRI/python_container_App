# # first layer is our python base image enabling us to run pip
# FROM python:3.7-windowsservercore-1809 

# # create directory in the container for adding your files
# WORKDIR /user/src/app 

# # copy over the requirements file and run pip install to install the packages into your container at the directory defined above
# COPY requirements.txt ./ 
# RUN pip install --no-cache-dir -r requirements.txt --user 
# COPY . . 

# # enter entry point parameters executing the container
# ENTRYPOINT ["python", "./runserver.py"] 

# # exposing the port to match the port in the runserver.py file
# EXPOSE 5555

# syntax=docker/dockerfile:1
FROM python:3.7-alpine
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]
