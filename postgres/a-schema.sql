CREATE SCHEMA api;

CREATE TABLE api.products (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  price NUMERIC NOT NULL,
  hero BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE ROLE web NOLOGIN;

GRANT USAGE ON SCHEMA api to web;
GRANT SELECT, INSERT, UPDATE, DELETE ON api.products TO web;

CREATE ROLE authenticator NOINHERIT LOGIN PASSWORD 'apacheapisixrocks';
GRANT web TO authenticator;
