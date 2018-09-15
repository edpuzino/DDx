'use strict';

require('dotenv').config();

// Application dependencies
const express = require('express');
const pg = require('pg');


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
app.get('/questions/:painLocation/:key', getQuestions);
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
  (patientName, patientAge, patientGender, DOB, painLocation, diagnosis)
  VALUES ($1, $2, $3, $4, $5, $6);`;
  let values = [patientName, patientAge, patientGender, DOB, painLocation, 'Not Determined Yet'];
  let pain = painLocation;
  return client.query(SQL, values)
    .then((patients) => {
      console.log(patients);
      SQL = `SELECT * FROM ${pain} AS current WHERE questionKey = $1;`;
      values = [1];
      return client.query(SQL, values)
        .then(result => {
          let current = result.rows[0];
          current.painLocation = painLocation;
          console.log({current});
          response.render('pages/questions', {current : current});
        })
        .catch(getError);
    })
    .catch(getError);
}

// Funtion that runs when the questions and answers page is requested or after each answer
function getQuestions(request, response) {
  let key= request.params.key;
  let pain= request.params.painLocation;
  console.log(key, pain);
  if(key.includes('D')) {
    client.query(`SELECT * FROM diagnosis WHERE diagnosisKey = $1;`, [key])
      .then(result => {
        response.render('pages/diagnosis', {token : process.env.API_KEY, diagnosis : result.rows[0]});
        console.log(result);
        let ourDiagnosis = result.rows[0].name;
        client.query(`UPDATE patients SET diagnosis = $1 WHERE id = (SELECT MAX(id) FROM patients)`, [ourDiagnosis]);
      }).catch (err => getError(err, response));
  } else {
    client.query(`SELECT * FROM ${pain} WHERE questionKey = $1;`, [key])
      .then(result => {
        let current = result.rows[0];
        current.painLocation = pain;
        console.log({current});
        response.render('pages/questions', {current : current});
      }).catch (err => getError(err, response));
  }
}

$(document).ready(function(){
  $('#nav-icon1,#nav-icon2,#nav-icon3,#nav-icon4').click(function(){
    $(this).toggleClass('open');
  });
});

app.listen(PORT, () => console.log('Listening on PORT', PORT));


