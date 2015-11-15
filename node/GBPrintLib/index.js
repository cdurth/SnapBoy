/*
 * CLI Interface
 */
 
 // node index.js -c config.json
var convert = require('./lib/convert.js');

exports.process = function(config){
	convert(config);
};
