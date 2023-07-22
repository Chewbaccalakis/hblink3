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
RUN cd /app
COPY ./hblink3 ./hblink3

#Installing pip dependencies
RUN pip3 install -r ./hblink3/requirements.txt

#Starting "hblink.py". Will be starting something else once i write a better solution
RUN python3 ./hblink3/hblink.py