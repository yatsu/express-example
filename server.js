'use strict';

const express = require('express');
const morgan = require('morgan');
const bodyParser = require('body-parser');

const PORT = 8080;
const HOST = '0.0.0.0';

const app = express();

app.use(morgan('dev'));

app.use(bodyParser.urlencoded({
  extended: true
}));
app.use(bodyParser.json());

app.all('*', (req, res) => {
  res.json({
    path: req.path,
    body: req.body
  });
  console.info(`path: ${req.path} params: ${JSON.stringify(req.body)}`);
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
