# Use an official Python runtime as the base image
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Copy requirements and install them
COPY src/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY src/ .

# Expose the debug port
EXPOSE 5678

# Command to run the Python script
CMD ["python", "print_hello.py"]