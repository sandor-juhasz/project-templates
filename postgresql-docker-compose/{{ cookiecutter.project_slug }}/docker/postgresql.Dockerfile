FROM postgres

RUN mkdir -p /docker-entrypoint-initdb.d

COPY sql/testdb.sql /docker-entrypoint-initdb.d/testdb.sql
