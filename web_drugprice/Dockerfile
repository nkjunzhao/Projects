FROM python:2
RUN mkdir /6440

# Set the working directory to /app
WORKDIR /6440

# Copy the current directory contents into the container at /app
ADD . /6440
ENV FLASK_DEBUG 1
ENV FLASK_APP run.py

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

EXPOSE 5000

# Run app.py when the container launches
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "5000"]
