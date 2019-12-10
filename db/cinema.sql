DROP TABLE tickets;
DROP TABLE screenings;
DROP TABLE customers;
DROP TABLE films;

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  funds INT
);

CREATE TABLE films (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  price INT
);

CREATE TABLE screenings (
  id SERIAL PRIMARY KEY,
  showtime VARCHAR(255),
  films_id INT NOT NULL REFERENCES films(id) ON DELETE CASCADE
);

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  customer_id INT NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
  films_id INT NOT NULL REFERENCES films(id) ON DELETE CASCADE,
  screening_id INT NOT NULL REFERENCES screenings(id) ON DELETE CASCADE
);
