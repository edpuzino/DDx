CREATE TABLE IF NOT EXISTS
    patients(
      id SERIAL PRIMARY KEY,
      patientName VARCHAR(255),
      patientAge VARCHAR(255),
      patientGender VARCHAR(255),
      DOB VARCHAR(255),
      painLocation VARCHAR(255),
      diagnosis VARCHAR(255),
      answers TEXT
    );


    CREATE TABLE IF NOT EXISTS
    diagnosis (
      id SERIAL PRIMARY KEY,
      diagnosisKey VARCHAR(10),
      name VARCHAR(255),
      image_url VARCHAR(255),
      description VARCHAR,
      keyword VARCHAR(255),
      treatment VARCHAR
    );

    INSERT INTO diagnosis
    VALUES
    (DEFAULT, 'Torn ACL Knee Injury', 'https://human.biodigital.com/widget/?be=2dqG&ui-info=true&ui-zoom=true&ui-share=false&dk=a12bea4f3740380ca22d4e08ee0d27a8f5b22f48', 'A positive Lachman''s test has a fairly high indication of an ACL tear. As our MOI was a plant and twist injury, the patient is unable to walk unassisted, knee flexion is less than normal, a sound was heard (though inconclusive), and we got a positive Lachman''s test, most signs point to an ACL tear. Final confirmation should be done via imaging. Please send the patient to get this done asap. Make sure the patient knows to schedule a follow up with you in about a week to go over their imaging results. Until that time, have them follow RICE procedures (Rest Ice Compression Elevation)', 'medical imaging', 'Nearby Medical Imaging Clinics');

    INSERT INTO diagnosis
    VALUES
    (DEFAULT, 'Inversion Ankle Sprain', 'https://human.biodigital.com/widget/?be=2e36&camera=21.26,4.255,-2.888,0.256,5.652,8.8,0.051,0.998,-0.028&background.colors=250,254,255,1,250,254,255,1&load-rotate=15&ui-fullscreen=false&ui-zoom=true&ui-share=false&ui-info=true&uaid=2vd0y', 'A positive talar tilt test, in addition to the previously gathered data, seems to confirm our diagnosis of an inversion ankle sprain with involvement of the anterior talofibular ligaments. In some cases, imaging may be required to confirm diagnosis. Advise patient on R.I.C.E procedures and send them for a physical therapy consultation.', 'medical imaging', 'Nearby Medical Imaging Clinics');

    INSERT INTO diagnosis
    VALUES
    (DEFAULT, 'Lateral Epicondylitis', 'https://human.biodigital.com/widget/?be=2e3B&camera=-40.784,100.77,-45.974,3.662,103.797,5.502,-0.029,0.999,-0.034&load-rotate=15&ui-info=true&ui-fullscreen=false&ui-zoom=true&ui-share=false&uaid=2vdAG', 'All signs point to the patient experiencing lateral epicondylitis, or "tennis elbow" as it is colloquially known. Advise the patient to follow RICE procedures, and schedule further appointments with a physical therapist. If pain is debilitating for the patient, advise them on possible steroid injections and/or bracing.', 'physical therapy', 'Nearby Physical Therapy Clinic');