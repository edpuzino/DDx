CREATE TABLE IF NOT EXISTS
    patients(
      id SERIAL PRIMARY KEY,
      name VARCHAR(255),
      gender VARCHAR(255),
      birthdate VARCHAR(255),
      diagnosis VARCHAR(255),
      answers TEXT
    );


    CREATE TABLE IF NOT EXISTS
    diagnosis (
      id SERIAL PRIMARY KEY,
      name VARCHAR(255),
      image_url VARCHAR(255),
      description TEXT
    );