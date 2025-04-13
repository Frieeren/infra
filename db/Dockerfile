# Use the official MySQL image as a base
FROM mysql:latest

# Copy MySQL configuration
# COPY ./my.cnf /etc/mysql/conf.d/
COPY ./init.sql /docker-entrypoint-initdb.d/

# Create data directory and set permissions
RUN mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql

# Expose port 3306 to allow connections to the database
EXPOSE 3306