var Q = require('q');
var config = require('../../config');
var request = require('request');
var _ = require('lodash');
var util = require('../../util');

var Image = require('../../models/image');

exports.main = function (req, res) {
	var instance = new Image();
	instance.uri = req.body.uri;
	instance.save(function (err) {
		if (!err) {
			console.log(instance.id);
			util.uriToPng(req.body.uri,instance.id, function(res){
				console.log(res);
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

