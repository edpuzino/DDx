CREATE TABLE IF NOT EXISTS
    patients (
      id SERIAL PRIMARY KEY,
      name VARCHAR(255),
      weight VARCHAR(255),
      height VARCHAR(255),
      gender VARCHAR(255),
      birthdate VARCHAR(255),
      diagnosis VARCHAR(255),
      answers TEXT
    );