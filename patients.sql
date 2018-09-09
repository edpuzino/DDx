CREATE TABLE IF NOT EXISTS
    patients(
      id SERIAL PRIMARY KEY,
      name VARCHAR(255),
      gender VARCHAR(255),
      DOB VARCHAR(255),
      diagnosis VARCHAR(255)
    );