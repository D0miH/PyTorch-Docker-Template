FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-devel

ARG WANDB_KEY

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# set the working directory and copy everything to the docker file
WORKDIR ./
COPY ./requirements.txt ./

RUN apt-get update
RUN apt-get -y upgrade
RUN conda update conda
RUN conda install python=3.10
RUN conda install pytorch torchvision torchaudio pytorch-cuda=11.6 -c pytorch -c nvidia
RUN pip install -r requirements.txt -f https://download.pytorch.org/whl/torch_stable.html

RUN if [ -z "$WANDB_KEY" ] ; then echo WandB API key not provided ; else wandb login "$WANDB_KEY"; fi
