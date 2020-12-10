FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8-alpine3.10
# FROM python:3.6-alpine


RUN apk add --no-cache \
    curl \
    build-base \
    unixodbc-dev \
    unixodbc \
    freetds-dev
# RUN apk add --no-cache tzdata
# ENV TZ America/Phoenix
# RUN rm -rf /var/cache/apk/*
RUN curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.5.2.2-1_amd64.apk
RUN apk add --allow-untrusted msodbcsql17_17.5.2.2-1_amd64.apk
# RUN curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.6.1.1-1_amd64.apk
# RUN apk add --allow-untrusted msodbcsql17_17.6.1.1-1_amd64.apk


# RUN apk add gcc musl-dev python3-dev libffi-dev openssl-dev
# RUN pip install cryptography --no-binary cryptography
RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip install -r requirements.txt


