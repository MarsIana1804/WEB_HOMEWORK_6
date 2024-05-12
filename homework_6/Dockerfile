# Use the official PostgreSQL image
FROM postgres:latest

# Install Python
RUN apt-get update && apt-get install -y python3 python3-pip

# Install psycopg2
#RUN apt-get update && \
#    apt-get install -y libpq-dev && \
#    pip install psycopg2

# Set environment variables
ENV POSTGRES_HOST=db
ENV POSTGRES_PORT=5433
ENV POSTGRES_DB=homework_6
ENV POSTGRES_USER=marina_admin
ENV POSTGRES_PASSWORD=mar123@@@
ENV POSTGRES_TYPE=PostgreSQL


# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed dependencies specified in requirements.txt
#RUN pip install --no-cache-dir -r requirements.txt

# Copy SQL scripts to initialize the database
COPY init.sql /docker-entrypoint-initdb.d/

# Expose PostgreSQL port
EXPOSE 5433

#CMD ["python", "init_db.py"]