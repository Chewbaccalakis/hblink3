# syntax=docker/dockerfile:1

# Setting Base Image of Debian Bookwork Slim plus other misc data
FROM python:3.11-slim-bullseye
LABEL org.opencontainers.image.authors="Nikolas Trochalakis - KJ7AVX"

#Installing Package Dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git
RUN pip install --upgrade pip

#Creating "app" folder and moving HBlink3 plus whatever else I later add to it
RUN mkdir /app
COPY ./app /app
RUN cd /app
RUN chmod +x ./app.sh

#Installing pip dependencies
RUN pip3 install -r ./requirements.txt

#Expose Ports
EXPOSE 62031/udp

#Starting "hblink.py". Will be starting something else once i write a better solution
CMD ./app.sh