/**
 * @source  https://github.com/davedarko/GBPrinter/blob/master/res/php/converter.php
 * @author  corey durthaler  https://github.com/cdurth
 * @desc    converts 2-bit color representation to hex for gameboy printer
 * @param   {String} string file patch
 * @returns {Object} hex value without `0x` prefix
 */

var fs = require('fs');
var readFile = require('./readFile');

function datToHex(file, configObj) {
  //open the file
  var fh = readFile.fopen(file, "r")
  if (fh === false) {
    console.log("Error, can't open ", file)
  }

  var bytes = 0;
  var arr = 1;

  var outputArr = [];
	
  //loop through file
  while (!readFile.eof(fh)) {
    //gets file line
    var line = readFile.fgets(fh);
    var cnt = 0;
    var low = 0;
    var high = 0;
			
    // loop through whole line
    for (var i = 0; i < line.length; i++) {
      if (line[i] !== "\n") {
        var nr = intval(line[i]);

        if (nr === 1) low = low + 1;
        if (nr === 2) high = high + 1;
        if (nr === 3) {
          low = low + 1;
          high = high + 1;
        }
        cnt++;

        if (cnt == 8) {

          var ai = bytes % 20;
          var a = intval((bytes / 20));

          var index = 160 * intval(a / 8) + ai * 8 + (a % 8);

          outputArr[index * 2] = high;
          outputArr[index * 2 + 1] = low;

          low = 0;
          high = 0;
          cnt = 0;
          bytes++;
        }
        else {
          high = high * 2;
          low = low * 2;
        }
      }
    }
  }
  var outputArrSorted = ksort(outputArr);
  var outputStr = '';
  outputStr += "const uint8_t row0[640] PROGMEM = {\r\n";
  var count = 0;
  var rollBack = false;
  for (var k = 0; k < Object.keys(outputArrSorted).length; k++) {
    if (k % 640 === 0 && k !== 0) {
      outputStr += "\r\n};\r\nconst uint8_t row" + (k / 640) + "[640] PROGMEM = {\r\n";
      rollBack = true;
    } else if(rollBack) {
      k = k-1;
      rollBack = false;
      outputStr += dhex(outputArrSorted[k]) + ", ";
    } else {
      outputStr += dhex(outputArrSorted[k]) + ", ";
    }
    count++;
  }
  outputStr += "\r\n};\r\n";
  fs.writeFile("./GBPrintLib/output/hex/"+ configObj.id +".txt", outputStr, function (err) {
    if (err) {
      return console.log(err);
    }
    console.log("hex file was saved!");
  });
};

function dechex(number) {
  if (number < 0) {
    number = 0xFFFFFFFF + number + 1;
  }
  if (isNaN(parseInt(number, 10))){
    console.log('NaN '+ number)
  }
  return parseInt(number, 10).toString(16);
};

function dhex(val) {
		var s = dechex(intval(val));
		if (s.length == 1) return "0x0" + s;
		else return "0x" + s;
}

function intval(number) {
  return number | 0;
};

function ksort(inputArr, sort_flags) {
  //  discuss at: http://phpjs.org/functions/ksort/
  // original by: GeekFG (http://geekfg.blogspot.com)
  // improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  // improved by: Brett Zamir (http://brett-zamir.me)
  //        note: The examples are correct, this is a new way
  //        note: This function deviates from PHP in returning a copy of the array instead
  //        note: of acting by reference and returning true; this was necessary because
  //        note: IE does not allow deleting and re-adding of properties without caching
  //        note: of property position; you can set the ini of "phpjs.strictForIn" to true to
  //        note: get the PHP behavior, but use this only if you are in an environment
  //        note: such as Firefox extensions where for-in iteration order is fixed and true
  //        note: property deletion is supported. Note that we intend to implement the PHP
  //        note: behavior by default if IE ever does allow it; only gives shallow copy since
  //        note: is by reference in PHP anyways
  //        note: Since JS objects' keys are always strings, and (the
  //        note: default) SORT_REGULAR flag distinguishes by key type,
  //        note: if the content is a numeric string, we treat the
  //        note: "original type" as numeric.
  //  depends on: i18n_loc_get_default
  //  depends on: strnatcmp
  //   example 1: data = {d: 'lemon', a: 'orange', b: 'banana', c: 'apple'};
  //   example 1: data = ksort(data);
  //   example 1: $result = data
  //   returns 1: {a: 'orange', b: 'banana', c: 'apple', d: 'lemon'}
  //   example 2: ini_set('phpjs.strictForIn', true);
  //   example 2: data = {2: 'van', 3: 'Zonneveld', 1: 'Kevin'};
  //   example 2: ksort(data);
  //   example 2: $result = data
  //   returns 2: {1: 'Kevin', 2: 'van', 3: 'Zonneveld'}

  var tmp_arr = {},
    keys = [],
    sorter, i, k, that = this,
    strictForIn = false,
    populateArr = {};

  switch (sort_flags) {
    case 'SORT_STRING':
      // compare items as strings
      sorter = function (a, b) {
        return that.strnatcmp(a, b);
      };
      break;
    case 'SORT_LOCALE_STRING':
      // compare items as strings, original by the current locale (set with  i18n_loc_set_default() as of PHP6)
      var loc = this.i18n_loc_get_default();
      sorter = this.php_js.i18nLocales[loc].sorting;
      break;
    case 'SORT_NUMERIC':
      // compare items numerically
      sorter = function (a, b) {
        return ((a + 0) - (b + 0));
      };
      break;
    // case 'SORT_REGULAR': // compare items normally (don't change types)
    default:
      sorter = function (a, b) {
        var aFloat = parseFloat(a),
          bFloat = parseFloat(b),
          aNumeric = aFloat + '' === a,
          bNumeric = bFloat + '' === b;
        if (aNumeric && bNumeric) {
          return aFloat > bFloat ? 1 : aFloat < bFloat ? -1 : 0;
        } else if (aNumeric && !bNumeric) {
          return 1;
        } else if (!aNumeric && bNumeric) {
          return -1;
        }
        return a > b ? 1 : a < b ? -1 : 0;
      };
      break;
  }

  // Make a list of key names
  for (k in inputArr) {
    if (inputArr.hasOwnProperty(k)) {
      keys.push(k);
    }
  }
  keys.sort(sorter);

  // BEGIN REDUNDANT
  this.php_js = this.php_js || {};
  this.php_js.ini = this.php_js.ini || {};
  // END REDUNDANT
  strictForIn = this.php_js.ini['phpjs.strictForIn'] && this.php_js.ini['phpjs.strictForIn'].local_value && this.php_js
  .ini['phpjs.strictForIn'].local_value !== 'off';
  populateArr = strictForIn ? inputArr : populateArr;

  // Rebuild array with sorted key names
  for (i = 0; i < keys.length; i++) {
    k = keys[i];
    tmp_arr[k] = inputArr[k];
    if (strictForIn) {
      delete inputArr[k];
    }
  }
  for (i in tmp_arr) {
    if (tmp_arr.hasOwnProperty(i)) {
      populateArr[i] = tmp_arr[i];
    }
  }

  return strictForIn || populateArr;
};

module.exports = datToHex;