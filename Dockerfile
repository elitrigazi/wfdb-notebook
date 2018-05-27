FROM jupyter/scipy-notebook:4ebeb1f2d154

RUN pip install wfdb pyqt5

USER root
RUN apt-get update && apt-get install -y gcc libcurl4-openssl-dev libexpat1-dev
COPY wfdb-10.6.0 /root/wfdb-10.6.0
RUN cd /root/wfdb-10.6.0 && \
    ./configure && make install && make check
USER $NB_UID

