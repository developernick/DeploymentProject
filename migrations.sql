psql

CREATE DATABASE chirpdb;

\c chirpdb;

CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(255));

CREATE TABLE chirps (id SERIAL PRIMARY KEY, message TEXT, user_id INTEGER REFERENCES users(id));
