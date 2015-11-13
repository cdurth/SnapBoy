var express = require('express');
var controller = require('./app.controller');

var router = express.Router();

router.post('/', controller.main);

module.exports = router;
