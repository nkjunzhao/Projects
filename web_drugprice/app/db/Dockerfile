FROM mysql:5.7

ENV MYSQL_ROOT_PASSWORD cs6440
ENV MYSQL_DATABASE cs6440
ENV MYSQL_USER cs6440
ENV MYSQL_PASSWORD cs6440

COPY ./schema.sql /docker-entrypoint-initdb.d/1-schema.sql
COPY ./seed_data.sql /docker-entrypoint-initdb.d/2-seed_data.sql
