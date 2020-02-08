# Copyright (c) Dovydas Ceilutka.

ARG BASE_CONTAINER=tensorflow/tensorflow:2.1.0-gpu-py3
FROM $BASE_CONTAINER

LABEL maintainer="Dovydas Ceilutka <d.ceilutka@gmail.com>"

RUN apt-get update -yq && apt-get upgrade -yq && apt-get install -yq curl gnupg build-essential wget git 
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -yq nodejs

RUN pip install --quiet jupyter jupyterlab matplotlib jupyter_http_over_ws 
RUN jupyter serverextension enable --py jupyter_http_over_ws

WORKDIR /tf
EXPOSE 8888

RUN python -m ipykernel.kernelspec

CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter lab --notebook-dir=/tf --ip 0.0.0.0 --no-browser --allow-root --LabApp.token=''"]
