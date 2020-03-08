# Docker Notebooks

Dockerfiles for Jupyter Lab notebooks.

## Initial setup

1. Login to your server with local port forwarding e.g. `ssh -L 8888:localhost:8888 -L 6666:localhost:6666 -t root@55.111.222.33`
1. Run `bash setup.sh`

## Usage

### GPU

- PyTorch 1.3 `docker-compose up -d pytorch13`
- PyTorch 1.4 `docker-compose up -d pytorch14`
- TensorFlow 2.0 `docker-compose up -d tf20`
- TensorFlow 2.1 `docker-compose up -d tf21`

### CPU

- PyTorch 1.3 `docker-compose -f docker-compose.cpu.yml up -d pytorch13`
- PyTorch 1.4 `docker-compose -f docker-compose.cpu.yml up -d pytorch14`
- TensorFlow 2.0 `docker-compose -f docker-compose.cpu.yml up -d tf20`
- TensorFlow 2.1 `docker-compose -f docker-compose.cpu.yml up -d tf21`
