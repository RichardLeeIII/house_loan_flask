# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Create and set working directory
WORKDIR /user/src/app

# Copy requirements file and install dependencies
COPY requirements.txt /user/src/app/

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port your application will run on
EXPOSE 8090

# Specify the command to run your application
CMD ["gunicorn", "--bind", "0.0.0.0:8090", "app:app"]

