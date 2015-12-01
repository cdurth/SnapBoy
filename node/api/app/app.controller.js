var Q = require('q');
var config = require('../../config');
var request = require('request');
var _ = require('lodash');
var util = require('../../util');
var GBPrintLib = require('../../GBPrintLib');

var Image = require('../../models/image');

exports.main = function (req, res) {
	var instance = new Image();
	instance.uri = req.body.uri;
	instance.save(function (err) {
		if (!err) {
			console.log(instance.id);
			util.uriToPng(req.body.uri, instance.id, function (res) {
				console.log(res);
				GBPrintLib.process(processCfg(instance.id));
			});

			res.status(200);
			res.send(req.body);
		} else {
			console.log(err);
			res.status(400);
			res.send('BAD');
		}
	});
};

exports.test = function (req, res) {
	var tstConfig = {

		"input": "./GBPrintLib/output/images/image2.png",
		"output": "image",
		"skipBinary": false,

		"minify": false,

		"preview": true,
		"previewDir": "./GBPrintLib/output/preview"
	};

	GBPrintLib.process(tstConfig);
	res.send('ok');

};
function processCfg(id) {
	var cfg = {
		"id":id,
		"input": "./GBPrintLib/output/images/"+ id +".png",
		"output": id,
		"skipBinary": false,
		"enableDither": true,
		"minify": false,

		"preview": true,
		"previewDir": "./GBPrintLib/output/preview"
	};
	return cfg;
}

