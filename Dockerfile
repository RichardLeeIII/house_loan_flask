# Use an official Python runtime as a parent image
FROM continuumio/miniconda3:latest

# Set environment variables
ENV FLASK_APP=app
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=8090

# Copy requirements file and install dependencies
COPY requirements.txt /app/requirements.txt
RUN ls /app  # Debugging step: Check if requirements.txt is copied correctly
RUN conda create -n flask-env python=3.10 -y
SHELL ["conda", "run", "-n", "flask-env", "/bin/bash", "-c"]
RUN conda install --file /app/requirements.txt && conda clean --all --yes

# Copy the rest of the application code
COPY . /app

# Set the working directory
WORKDIR /app

# Run the training script if needed
# RUN python flask-train.py

# Expose port 8080 to the outside world
EXPOSE 8090

# Command to run the Flask app
CMD ["conda", "run", "-n", "flask-env", "flask", "run", "--host=0.0.0.0", "--port=8090"]

