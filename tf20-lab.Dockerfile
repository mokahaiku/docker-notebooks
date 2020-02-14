# Copyright (c) Dovydas Ceilutka.

ARG BASE_CONTAINER=tensorflow/tensorflow:2.0.0-gpu-py3
FROM $BASE_CONTAINER

LABEL maintainer="Dovydas Ceilutka <d.ceilutka@gmail.com>"

RUN apt-get update -yq && apt-get install -yq --no-install-recommends \
    curl \
    gnupg \
    build-essential \
    wget \
    git \
    python-pydot \
    python-pydot-ng \
    graphviz \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash \
    apt-get install -yq nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && pip install --quiet \
    jupyter \
    jupyterlab \
    matplotlib \
    jupyter_http_over_ws

RUN jupyter serverextension enable --py jupyter_http_over_ws

WORKDIR /tf
EXPOSE 8888

RUN python -m ipykernel.kernelspec

CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter lab --notebook-dir=/tf --ip 0.0.0.0 --no-browser --allow-root --LabApp.token=''"]