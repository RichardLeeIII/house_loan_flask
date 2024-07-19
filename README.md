# Setup Virtual Environment

```python
conda create -n flask-env python=3.10 -y
conda activate flask-env
pip install -r requirements.txt
```

```
flask --app main run
```

# Deploy on AWS
FLASK_APP=app FLASK_RUN_HOST=0.0.0.0 FLASK_RUN_PORT=8090 flask run || exit 1


```deploying to AWS
also check https://www.youtube.com/watch?v=Zem1H7Rr9yM
pip install gunicorn
docker build -t flaskapp .
docker run -p 8090:8090 flaskapp

sudo apt-get update
sudo apt install git
git clone repository address
after that install docker
https://docs.docker.com/engine/install/ubuntu/
sudo docker build -t flaskapp .
sudo docker run -d -p 8090:8090 flaskapp

for stopping the image
sudo docker stop <container_id>

```