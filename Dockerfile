#Python image to use
FROM python:3.10-slim

ENV PYTHONUNBUFFERED True

#copy the local code
ENV APP_HOME /app 
WORKDIR $APP_HOME
COPY . ./

#install all required package 
RUN pip install -r requirements.txt

#Run web service using gunicorn
CMD exec gunicorn -b 0.0.0.0:8080 --workers 1 --threads 8 --timeout 0 app:app
