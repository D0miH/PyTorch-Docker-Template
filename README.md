# PyTorch-Docker-Template
A PyTorch template that supports yapf autoformatting, pre-commit, Weights and Biases and includes a Dockerfile to run the code in a Docker container

# Setup

## Docker
To build the Docker container run: 
```bash
./docker_build.sh -n <image-name> -w <wandb-key>
```

## Local Setup
To set up the project locally without running in a Docker container and to use `yapf` and `pre-commit`, you have to first install all dependencies using `conda` and `pip`:
```bash
conda install pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch
pip install -r requirements.txt
```

Then you have to set up 'pre-commit` to run yapf each time before committing:
```bash
pre-commit install
```

That's it!🎊️ 
Now you are setup and ready to go!

# Start Docker Container
To start the Docker container run the following command:
```bash
./docker_run.sh -n <container_name> -i <image_name> -d <comma_separated_device_ids>
```
e.g.
```bash
./docker_run.sh -n pytorch_docker_template -i pytorch_docker_template -d "0,1"
```
or
```bash
docker run --rm --name <container-name> --gpus '"device=<device-ids>"' -v $(pwd):/workspace  -it <image-name> bash
```
