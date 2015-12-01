var mongoose = require('mongoose');
var Schema = mongoose.Schema;

// set up a mongoose model
module.exports = mongoose.model('image', new Schema({
	uri: String,
	pathToFile: String,
	totalLines: String,
	lines: [String],
	printed: { type: Boolean, default: false }
}));