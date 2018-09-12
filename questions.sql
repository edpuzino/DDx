
CREATE TABLE IF NOT EXISTS knee (
  id SERIAL PRIMARY KEY,
  questionKey VARCHAR(10),
  question VARCHAR(255),
	image_url VARCHAR(255),
  answer1 VARCHAR(255),
  key1 VARCHAR(10),
  answer2 VARCHAR(255),
  key2 VARCHAR(10),
  answer3 VARCHAR(255),
  key3 VARCHAR(10),
  answer4 VARCHAR(255),
  key4 VARCHAR(10),
  answer5 VARCHAR(255),
  key5 VARCHAR(10),
  answer6 VARCHAR(255),
  key6 VARCHAR(10),
  answer7 VARCHAR(255),
  key7 VARCHAR(10),
  answer8 VARCHAR(255),
  key8 VARCHAR(10),
  answer9 VARCHAR(255),
  key9 VARCHAR(10),
  answer10 VARCHAR(255),
  key10 VARCHAR(10)
);

//Example
INSERT INTO knee (questionKey, question, answer1, key1, answer2, key2, answer3, key3, answer4, key4, answer5, key5, answer6, key6, answer7, key7, answer8, key8, answer9, key9, answer10, key10) VALUES('questionKey', 'Example question', 'Possible answer #1', '#1key', 'Possible answer #2', '#2key', 'Possible answer #3', '#3key', 'Possible answer #4', '#4key', 'Possible answer #5', '#5key', 'Possible answer #6', '#6key', 'Possible answer #7', '#7key', 'Possible answer #8', '#8key', 'Possible answer #9', '#9key', 'Possible answer #10', '#10key');


INSERT INTO knee (questionKey, question, answer1, key1, answer2, key2, answer3, key3, answer4, key4, answer5, key5) VALUES('1', 'You''ve indicated an issue with the patients knee. What was the mechanism of injury?', 'Sports', '2', 'Fall from height', '0', 'Auto accident', '0', 'Impact Injury', '0', 'Unknown', '0');

INSERT INTO knee (questionKey, question, answer1, key1, answer2, key2, answer3, key3, answer4, key4, answer5, key5, answer6, key6, answer7, key7, answer8, key8) VALUES('2', 'You''ve indicated that the mechanism of injury was sports related. How did they injure it during sports?', 'Body Contact', '0', 'Equipment Contact', '0', 'Plant Foot and Twist', '3', 'Explosive/Dynamic Movement Involving Knee Extension (eg: Jump)', '0', 'Explosive/Dynamic Movement Involving Knee Flexion (eg: Squat)', '0', 'Lateral Movement', '0', 'Fall', '0', 'Unknown', '0');

INSERT INTO knee (questionKey, question, answer1, key1, answer2, key2) VALUES('3', 'Plant foot and twist injuries often involve injury to the ligament or meniscus of the knee. Let''s investigate further with that in mind. Can the patient walk unassisted?', 'Yes', '0', 'No', '4');

INSERT INTO knee (questionKey, question, answer1, key1, answer2, key2, answer3, key3, answer4, key4) VALUES('4', 'So the patient can''t walk unassisted and our mechanism of injury was plant/twist. Let''s test the patient''s knee range of motion (ROM). Normal knee flexion is ~142deg. Normal knee extension is ~1.6deg.', 'ROM is normal', '0', 'ROM is > than normal', '0', 'ROM is < than normal', '5', 'Unable to perform', '0');

INSERT INTO knee (questionKey, question, answer1, key1, answer2, key2, answer3, key3, answer4, key4, answer5, key5) VALUES('5', 'Knee ROM being less than normal is typical of most knee injuries. Was there any popping, clicking, or other abnormal sounds? Popping or clicking could indicate injury to the menisucs.', 'Popping', '0', 'Clicking', '0', 'Other', '6', 'None', '0', 'Unable to perform', '0');

INSERT INTO knee (questionKey, question, answer1, key1, answer2, key2, answer3, key3) VALUES('6', 'Since the sound we heard was inconclusive, let''s do some manual tests, starting with McMurrys. This will help determine if our injury is to the medial or lateral meniscus.', 'Test was positive', '0', 'Test was negative', '7', 'Unable to perform', '0');

INSERT INTO knee (questionKey, question, answer1, key1, answer2, key2, answer3, key3) VALUES('7', 'A negative McMurry''s test means our injury is unlikely to be meniscal in origin (though we can not rule it out entierly). Let''s perform Lachman''s test to see if there is involvement of the anterior cruciate ligament (ACL).', 'Test was positive', 'D1', 'Test was negative', '0', 'Unable to perform', '0');

INSERT INTO knee (questionKey, question, answer1, key1) VALUES('0', 'This branch of the diagnosis tree is not built yet please be patient.', 'Please press this tab to return to the first question.', '1');

//Questions and Answers
1. You've indicated an issue with the patients knee. What was the mechanism of injury?
	Sports
	Fall from height
	Auto accident
	Impact Injury
	Unknown
	
2. You've indicated that the mechanism of injury was sports related. How did they injure it during sports?
	Body Contact 
	Equipment Contact
	Plant Foot and Twist
	Explosive/Dynamic Movement Involving Knee Extension (eg: Jump)
	Explosive/Dynamic Movement Involving Knee Flexion (eg: Squat)
	Lateral Movement
	Fall
	Unknown
	
3. Plant foot and twist injuries often involve injury to the ligament or meniscus of the knee. Let's investigate further with that in mind. Can the patient walk unassisted?
	Yes
	No
	
4. So the patient can't walk unassisted and our mechanism of injury was plant/twist. Let's test the patient's knee range of motion (ROM). Normal knee flexion is ~142deg. Normal knee extension is ~1.6deg.
	ROM is normal
	ROM is > than normal
	ROM is < than normal
	Unable to perform
	
	
5. Knee ROM being less than normal is typical of most knee injuries. Was there any popping, clicking, or other abnormal sounds? Popping or clicking could indicate injury to the menisucs. 
	Popping
	Clicking
	Other
	None
	Unable to perform

6. Since the sound we heard was inconclusive, let's do some manual tests, starting with McMurrys. This will help determine if our injury is to the medial or lateral meniscus.
	Test was positive
	Test was negative
	Unable to perform
	
7. A negative McMurry's test means our injury is unlikely to be meniscal in origin (though we can not rule it out entierly). Let's perform Lachman's test to see if there is involvement of the anterior cruciate ligament (ACL). 
	Test was positive
	Test was negative
	Unable to perform






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

//Example
INSERT INTO diagnosis (diagnosisKey, name, description, treatment, keyword, image_url) VALUES('diagnosisKey', 'name', 'description', 'treatment', 'keyword', 'image_url');


INSERT INTO diagnosis (diagnosisKey, name, description, treatment, keyword, image_url) VALUES('D1', 'Torn ACL Knee Injury','A positive Lachman''s test has a fairly high indication of an ACL tear. As our MOI was a plant and twist injury, the patient is unable to walk unassisted, knee flexion is less than normal, a sound was heard (though inconclusive), and we got a positive Lachman''s test, most signs point to an ACL tear. Final confirmation should be done via imaging. 

Please send the patient to get this done asap. Make sure the patient knows to schedule a follow up with you in about a week to go over their imaging results. Until that time, have them follow RICE procedures (Rest Ice Compression Elevation).', 'Nearby Medical Imaging Clinics', 'medical imaging', 'https://human.biodigital.com/widget/?be=2dqG&ui-info=true&ui-zoom=true&ui-share=false&dk=a12bea4f3740380ca22d4e08ee0d27a8f5b22f48');




8. A positive Lachman's test has a fairly high indication of an ACL tear. As our MOI was a plant and twist injury, the patient is unable to walk unassisted, knee flexion is less than normal, a sound was heard (though inconclusive), and we got a positive Lachman's test, most signs point to an ACL tear. 

	Final confirmation should be done via imaging. Please send the patient to get this done asap. Make sure the patient knows to schedule a follow up with you in about a week to go over their imaging results. Until that time, have them follow RICE procedures (Rest Ice Compression Elevation)