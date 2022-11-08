FROM python:3.10.4-alpine

ADD . /api
WORKDIR /api

RUN apk add --no-cache build-base \
    && pip install --no-cache-dir -r requirements.txt \
    && apk del build-base
RUN apk add --no-cache tzdata

EXPOSE 8100
CMD [ "python", "/api/startapi.py" ]