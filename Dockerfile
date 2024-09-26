FROM continuumio/miniconda3

WORKDIR /app/

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 -y

RUN conda create -p /app/env pip

RUN conda run -p /app/env pip install --upgrade pip

RUN conda run -p /app/env pip install pandas numpy opencv-python

COPY src/main.py /app/main.py

CMD ["/bin/bash","-c","conda run -p /app/env python /app/main.py"]
