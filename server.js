'use strict';

require('dotenv').config();

// Application dependencies
const express = require('express');
const pg = require('pg');
const superagent = require('superagent');

// Application setup
const app = express();
const client = new pg.Client(process.env.DATABASE_URL);
const PORT = process.env.PORT;
client.connect();
client.on('error', err => console.error(err));

// Serve static files
app.use(express.urlencoded({ extended: true }));
app.use(express.static('./public'));

// Set the view engine
app.set('view engine', 'ejs');

// Gets and posts
app.get('/', getIndex);
app.get('/questions/:key', getQuestions);
app.get('/diagnosis/:key', getDiagnosis);
app.get('*', getError);
app.post('/patients',addNewPatient);


// Helper functions

function getIndex(request, response){
  response.render('index');
}

function getError(request, response) {
  response.render('pages/error');
}

// Function that runs when a new patient is added to the database
function addNewPatient(request, response) {
  let { patientName, patientAge, patientGender, DOB, painLocation } = request.body;
  let SQL = `INSERT INTO patients
  (patientName, patientAge, patientGender, DOB, painLocation)
  VALUES ($1, $2, $3, $4, $5);`;
  let values = [patientName, patientAge, patientGender, DOB, painLocation];
  return client.query(SQL, values)
    .then(result => {
      response.render('pages/questions', {newPatient: result.rows[0]});
    })
    .catch((error) => console.error(error));
}

// Funtion that runs when the questions and answers page is requested
function getQuestions(request, response) {
  let key= request.params.key;
  console.log(key);
  if(key === 0) {
    response.render('pages/questions');
  } else if(key.includes('D')) {
    response.render('pages/diagnosis');
  } else {
    client.query(`SELECT * FROM knee WHERE questionKey = $1;`, [key])
      .then(result => {
        console.log('Here',result);
        response.render('pages/questions', {knee: result.rows[0]});
      }).catch (err => getError(err, response));
  }
}


// Function that runs when the diagnosis page is requested
function getDiagnosis(request, response) {
  let SQL =`SELECT id, name, image_url, description, keyword, treatment
  FROM diagnosis
  WHERE id = $1;`;
  let values = [1];
  client.query(SQL, values)
    .then(result => {
      response.render('pages/diagnosis', {token : process.env.API_KEY, diagnosis: result.rows[0]});
    });
}

/*
// Get new question and possible answers to go to the question.ejs page
function newQuestion() {
  response.render)
}

// Take the answer chosen and get the next question
function getQuestion() {

}
*/

app.listen(PORT, () => console.log('Listening on PORT', PORT));


