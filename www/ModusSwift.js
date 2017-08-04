var exec = require('cordova/exec');

exports.version = function(arg0, success, error) {
    exec(success, error, "ModusSwift", "version", [arg0]);
};
exports.top = function(arg0, success, error){
    exec(success, error, "ModusSwift", "toptype", [arg0]);
};
/*exports.echojs = function(arg0, success, error) {
	if (arg0 && typeof(arg0) === 'string' && arg0.length > 0) {
		success(arg0);
	} else {
		error('Empty message!');
	}
};*/
