# Use official MySQL image
FROM mysql:5.7

LABEL database="studentapp"

# Set root password and database
ENV MYSQL_ROOT_PASSWORD=1234
ENV MYSQL_DATABASE=studentdb
ENV MYSQL_USER=admin
ENV MYSQL_PASSWORD=admin

# Copy initial SQL script to initialize the database
COPY student.sql /docker-entrypoint-initdb.d/

# Expose MySQL port
EXPOSE 3306

# No CMD needed — the official MySQL image already starts MySQL

