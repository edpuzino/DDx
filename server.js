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
app.get('/diagnosis', getDiagnosis);
app.get('*', getError);

app.listen(PORT, () => console.log('Listening on PORT', PORT));

// Helper functions
function getIndex(request, response){
  response.render('index');
}

function getDiagnosis(request, response) {
  response.render('pages/diagnosis');
}

function getError(request, response) {
  response.render('pages/error');
}