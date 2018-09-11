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
app.get('/questions', getQuestions);
app.get('/diagnosis', getDiagnosis);
app.get('*', getError);
app.post('/patients',addNewPatient);


// Helper functions
function getError(request, response) {
  response.render('pages/error');
}

function addNewPatient(request, response) {
  let { name, age, gender, DOB } = request.body;
  let SQL = `INSERT INTO patients
  (name, age, gender, DOB)
  VALUES ($1, $2, $3, $4);`;
  let values = [name, age, gender, DOB];
  return client.query(SQL, values)
    .then(() => {
      SQL = 'SELECT * FROM patients WHERE name=$1, age=$2;';
      values = [request.body.name];
      return client.query(SQL, values)
        .then(result => response.render('index', { patients: result.rows[0], message: 'sql' })); 

    })
    .catch((error) => console.error(error));
}


function getIndex(request, response){
  response.render('index');
}

let i = 0;

// Funtion that runs when the questions and answers page is requested
function getQuestions(request, response) {
  console.log('Hello');
  client.query(`SELECT * FROM knee;`)
    .then(
      result => response.render('pages/questions', {knee: result.rows[i]}))
    .catch (err => getError(err, response));
}

// Function that runs when the diagnosis page is requested
function getDiagnosis(request, response) {
  let SQL =`SELECT id, name, image_url, description, keyword, treatment
  FROM diagnosis
  WHERE id = $1;`
  let values = [1];
  client.query(SQL, values)
    .then(result => {
      response.render('pages/diagnosis', {token : process.env.API_KEY, diagnosis: result.rows[0]});
    });
}

function getError(request, response) {
  response.render('pages/error');
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

