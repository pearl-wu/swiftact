var exec = require('cordova/exec');

exports.version = function(arg0, success, error){
	exec(success, error, "swiftact", "version",[arg0]);
}

exports.echo = function(arg0, success, error) {
    exec(success, error, "swiftact", "echo", [arg0]);
};

exports.echojs = function(arg0, success, error) {
	if (arg0 && typeof(arg0) === 'string' && arg0.length > 0) {
		success(arg0);
	} else {
		error('Empty message!');
	}
};
