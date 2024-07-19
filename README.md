# Setup Virtual Environment

```python
conda create -n flask-env python=3.10 -y
conda activate flask-env
pip install -r requirements.txt
```

```
flask --app main run
```


# Move to the repository directory
cd ${WORKSPACE}

# Check if Miniconda is already installed
if [ ! -d "$HOME/miniconda" ]; then
    echo "Miniconda not found, installing..."
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
    bash miniconda.sh -b -p $HOME/miniconda
else
    echo "Miniconda already installed, skipping installation."
fi

# Initialize conda
eval "$($HOME/miniconda/bin/conda shell.bash hook)"

# Create and activate the conda environment
conda create -n flask-env python=3.10 -y || exit 1
conda activate flask-env

# Install dependencies
if [ -f requirements.txt ]; then
    pip install -r requirements.txt || exit 1
else
    echo "requirements.txt not found"
    exit 1
fi

# Run the training script
python flask-train.py || exit 1

# Run the Flask app using Flask CLI on port 8080
# Run the Flask app using Flask CLI on port 8080
FLASK_APP=app FLASK_RUN_HOST=0.0.0.0 FLASK_RUN_PORT=8090 flask run || exit 1


```deploying to AWS
also check https://www.youtube.com/watch?v=Zem1H7Rr9yM
pip install gunicorn
docker build -t flaskapp .
docker run -p 8090:8090 flaskapp
```