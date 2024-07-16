# Use an official Python runtime as a parent image
FROM continuumio/miniconda3:latest

# Set environment variables
ENV FLASK_APP=app
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=8090

# Copy requirements file and install dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

# Copy the rest of the application code
COPY . /app

# Set the working directory
WORKDIR /app

# Create and activate the conda environment
RUN conda create -n flask-env python=3.10 -y
RUN echo "conda activate flask-env" >> ~/.bashrc
ENV PATH /opt/conda/envs/flask-env/bin:$PATH

# Run the training script
RUN python flask-train.py

# Expose port 8080 to the outside world
EXPOSE 8090

# Command to run the Flask app
CMD ["flask", "run"]
