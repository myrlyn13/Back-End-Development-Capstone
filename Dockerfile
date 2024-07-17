FROM python:3.9.16-slim

ENV PYTHONBUFFERED 1
ENV PYTHONWRITEBYTECODE 1

RUN apt-get update \
    && apt-get install -y netcat

ENV APP=/app

WORKDIR $APP

COPY requirements.txt $APP

RUN pip3 install -r requirements.txt

COPY . $APP

EXPOSE 8000

RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/bin/bash","/app/entrypoint.sh"]

# 7. insert code to set the run command to "python manage.py runserver 0.0.0.0:8000"

