#!/bin/sh
set -e

psql -v on_error_stop=1 --username "$postgres_user" --dbname "$postgres_db" <<-eosql
    create database example_db;
eosql
