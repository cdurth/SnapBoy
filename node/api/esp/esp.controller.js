var Q = require('q');
var config = require('../../config');
var request = require('request');
var _ = require('lodash');

exports.getImage = function(req,res) {
	res.send('esp getImage GET');
};

exports.imageProcessed = function(req,res) {
	res.send('esp imageProcessed POST id:'+ req.params.imageid);	
};