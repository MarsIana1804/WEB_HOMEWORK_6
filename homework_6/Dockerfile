# Use the official PostgreSQL image from the Docker Hub
FROM postgres:latest

# Set environment variables (these can also be set in the docker-compose.yml file)
ENV POSTGRES_USER=marina_admin
ENV POSTGRES_DB=homework_6

# Copy initialization SQL file if needed
COPY init.sql /docker-entrypoint-initdb.d/

# Expose the PostgreSQL port
EXPOSE 5432