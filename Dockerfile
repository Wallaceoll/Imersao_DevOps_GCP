FROM python:3.13.4-alpine3.22

# Set the working directory in the container
WORKDIR /app

# Copy and install requirements
# This layer is cached and only re-run if requirements.txt changes
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application source code
COPY . .

# Expose the port the application will run on
EXPOSE 8000

# Command to run the application in production
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
