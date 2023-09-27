# Dockerfile with Requirements.txt for OpenaiContainer

# Base Image
FROM python:3.9

# Set environment variables
ENV FLASK_APP=app.py

# Copy requirements.txt and install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy the application folder inside the container
COPY . /app

# Set the working directory
WORKDIR /app

# Expose the port the app runs on
EXPOSE 5000

# Command to run the application
CMD ["flask", "run", "--host=0.0.0.0"]
