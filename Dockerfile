# Use the official Python image from the Docker Hub
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Create the directory for the u2net model
RUN mkdir -p /home/.u2net

# Download the u2net.onnx model if it's not already downloaded
RUN wget -O /home/.u2net/u2net.onnx https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2net.onnx

# Copy the local requirements.txt to the working directory
COPY requirements.txt .

# Install the dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the working directory
COPY . .

# Expose port 5100 to the outside world
EXPOSE 5100

# Run the application
CMD ["python", "app.py"]
