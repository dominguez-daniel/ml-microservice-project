[![CircleCI](https://dl.circleci.com/status-badge/img/gh/dominguez-daniel/ml-microservice-project/tree/master.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/dominguez-daniel/ml-microservice-project/tree/master)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

### Project Files Description
.circleci/config.yml `CircleCI configuration file for building the project via CircleCI`\
model_data `Contains the model data for the Flask app`\
docker_out.txt `Prediction values log output`\
kubernetes_out.txt `Kubernetes prediction log output`\
Dockerfile `Builds Docker images based on the instructions`\
Makefile `Project manager file to setup, install, and lint the project`\
app.py `Flask app which converts a JSON payload to a DataFrame, passes data to the pre-trained model`\
make_predictions.sh `Sends input data to the flask app`\
requirements.txt `Lists required dependencies and package versions`\
run_docker.sh `Builds a Docker image and runs the container`\
kubernetes_output.sh `Downloads Docker image, deploys the pod, and forwards the port`\
upload_docker.sh `Pushes the built Docker image to DockerHub`

---

## Setup the Environment
* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv. 
```bash
python3 -m pip install --user venv
# You should have Python 3.7 available in your host. 
# Check the Python path using `which python3`
# Use a command similar to this one:
python3 -m venv --python=<path-to-Python3.7> .devops
source .devops/bin/activate
```
* Run `make install` to install the necessary dependencies
* Run `make lint` to lint the `app.py` and `Dockerfile`

### Running `app.py`
1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
  * Containerize app
  * Tag image and build
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps
1. Start a local cluster `minikube start`
2. Download Docker image, deploy to pod and forward the port `./run_kubernetes.sh`
3. Run predictions: open a new terminal tab and call `./make_prediction.sh`
4. Pause the cluster `minikube stop` or delete the cluster `minikube delete`
