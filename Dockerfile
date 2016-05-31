# Establish a working envirionment for Spark with more than just the basics.
## @TODO: establish a stable base image tag to work from.
FROM jupyter/pyspark-notebook:latest

MAINTAINER Docker Support <docker-support@brillozon.com>

USER root

RUN \
     echo "deb http://ftp.us.debian.org/debian/ jessie main contrib non-free" >> /etc/apt/sources.list \
  && echo "deb-src http://ftp.us.debian.org/debian/ jessie main contrib non-free" >> /etc/apt/sources.list \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get update -q \
  && apt-get build-dep -q -y python-imaging \
  && apt-get install -q -y -o Dpkg::Options::="--force-confnew" \
             curl

RUN \
     pip install --upgrade pip \
  && pip install \
         boto3 \
         pillow \
         thunder-python

ADD https://archive.ics.uci.edu/ml/machine-learning-databases/covtype/covtype.data.gz /home/jovyan/work/data/
COPY simple-spark.ipynb /home/jovyan/work/

USER jovyan

