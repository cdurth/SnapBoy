var express = require('express');
var config = require('./config');

var app = express();

require('./config/express')(app);

require('./routes')(app);

app.listen(config.port, function () {
  console.log("Express server listening on " + config.port);
});