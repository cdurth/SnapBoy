var Q = require('q');
var config = require('../../config');
var request = require('request');
var _ = require('lodash');

exports.main = function(req,res) {
	res.send('app main POST');
};