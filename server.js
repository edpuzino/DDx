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
app.get('/about-us', getAboutUs);
app.get('/return-patients', getReturnPatients);
app.get('*', getError);
app.post('/patients',addNewPatient);


// Helper functions
function getIndex(request, response){
  response.render('index');
}

function getAboutUs(request, response) {
  response.render('aboutUs');
}

function getReturnPatients(request, response){
  response.render('return');
}

function getError(request, response) {
  response.render('pages/error');
}



function addNewPatient(request, response) {
  let { patientName, patientAge, patientGender, DOB, painLocation } = request.body;
  let SQL = `INSERT INTO patients
  (patientName, patientAge, patientGender, DOB, painLocation)
  VALUES ($1, $2, $3, $4, $5);`;
  let values = [patientName, patientAge, patientGender, DOB, painLocation];
  return client.query(SQL, values)
    .then(() => {
      console.log('posted patient\n');
      SQL = `SELECT * FROM knee WHERE questionKey = $1;`;
      values = [1];
      return client.query(SQL, values)
        .then(result => {
          console.log(result.rows[0]);
          response.render('pages/questions', {knee : result.rows[0]})
        })
        .catch(getError);
    })
    .catch(getError);
}

// Funtion that runs when the questions and answers page is requested or after each answer
function getQuestions(request, response) {
  let key= request.params.key;
  console.log(key);
  if(key.includes('D')) {
    client.query(`SELECT * FROM diagnosis WHERE diagnosisKey = $1;`, [key])
      .then(result => {
        response.render('pages/diagnosis', {token : process.env.API_KEY, diagnosis : result.rows[0]});
      }).catch (err => getError(err, response));  
  } else {
    client.query(`SELECT * FROM knee WHERE questionKey = $1;`, [key])
      .then(result => {
        response.render('pages/questions', {knee: result.rows[0]});
      }).catch (err => getError(err, response));
  }
}

// Function that runs when the diagnosis page is requested
function getDiagnosis(request, response) {
  let key = request.params.key;
  client.query(`SELECT * FROM diagnosis WHERE diagnosisKey = $1;`, [key])
    .then(result => {
      response.render('pages/diagnosis', {token : process.env.API_KEY, diagnosis: result.rows[0]});
    }).catch (err => getError(err, response));
}

app.listen(PORT, () => console.log('Listening on PORT', PORT));


