# Use Python 3.10 as the base image
FROM python:3.10

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install other Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code into the container
COPY . /app/

# Run the application
CMD ["python", "app.py"]
