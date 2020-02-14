# Copyright (c) Dovydas Ceilutka.

ARG BASE_CONTAINER=pytorch/pytorch:1.4-cuda10.1-cudnn7-runtime
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

WORKDIR /workspace
EXPOSE 8888

RUN python -m ipykernel.kernelspec

CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter lab --notebook-dir=/workspace --ip 0.0.0.0 --no-browser --allow-root --LabApp.token=''"]
