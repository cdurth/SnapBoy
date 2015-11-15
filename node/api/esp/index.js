var express = require('express');
var controller = require('./esp.controller');

var router = express.Router();

router.get('/queue', controller.queue);
router.get('/print/:imgId', controller.printImgId);
router.get('/print/:imgId/:imgLine', controller.pringImgIdLine);
router.post('/print/:imgId', controller.imageProcessed);
router.get('/test', controller.test);

module.exports = router;
