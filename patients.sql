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
      description TEXT,
      keyword VARCHAR(255),
      treatment VARCHAR(255)
    );

    INSERT INTO diagnosis
    VALUES
    (DEFAULT, 'Torn ACL Knee Injury', 'https://human.biodigital.com/widget/?be=2dqG&ui-info=true&ui-zoom=true&ui-share=false&dk=a12bea4f3740380ca22d4e08ee0d27a8f5b22f48', 'A positive Lachman''s test has a fairly high indication of an ACL tear. As our MOI was a plant and twist injury, the patient is unable to walk unassisted, knee flexion is less than normal, a sound was heard (though inconclusive), and we got a positive Lachman''s test, most signs point to an ACL tear. Final confirmation should be done via imaging. Please send the patient to get this done asap. Make sure the patient knows to schedule a follow up with you in about a week to go over their imaging results. Until that time, have them follow RICE procedures (Rest Ice Compression Elevation)', 'medical imaging', 'Nearby Medical Imaging Clinics');
