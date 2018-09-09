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
app.get('*', getError);
app.post('/patients',addNewPatient);

app.listen(PORT, () => console.log('Listening on PORT', PORT));

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
      SQL = 'SELECT * FROM patients WHERE name=$1, age=$2, gender=$3, DOB=$4;';
      values = [request.body.name];
      return client.query(SQL, values)
        .then(result => response.render('index', { patients: result.rows[0], message: 'sql' }));
 
    })
    .catch((error)=> console.error(error));
}


function getIndex(request, response){
  response.render('index');
}




