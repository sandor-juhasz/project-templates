CREATE DATABASE testdb;

\connect testdb

CREATE TABLE test (
    id   INTEGER,
    name VARCHAR(200)
);

INSERT INTO test VALUES (1, 'Joe');
INSERT INTO test VALUES (2, 'Greg');
INSERT INTO test VALUES (2, 'Daisy');
