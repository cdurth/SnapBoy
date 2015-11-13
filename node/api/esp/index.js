var express = require('express');
var controller = require('./esp.controller');

var router = express.Router();

router.get('/', controller.getImage);
router.post('/:imageid', controller.imageProcessed);

module.exports = router;
