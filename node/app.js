var express = require('express');
var mongoose = require('mongoose');
var config = require('./config');

var app = express();

require('./config/express')(app);

require('./routes')(app);

mongoose.connect(config.database);

app.listen(config.port, function () {
  console.log("Express server listening on " + config.port);
});