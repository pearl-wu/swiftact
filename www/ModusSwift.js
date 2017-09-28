cordova.define("cordova-plugins-echoswift.ModusSwift", function(require, exports, module) {
var exec = require('cordova/exec');
               
   exports.version = function(arg0, success, error) {
           exec(success, error, "ModusSwift", "version", [arg0]);
   };
               
   exports.top = function(arg0, success, error){
           exec(success, error, "ModusSwift", "toptype", [arg0]);
   };
               
   exports.fileview = function(arg0, success,error){
           exec(success,error,"ModusSwift","fileview",[arg0]);
   }
               
   exports.downloadfile = function(arg0, success,error){
           exec(success,error,"ModusSwift","downloadfile",[arg0]);
   }
               
   exports.isfile = function(arg0, success,error){
           exec(success,error,"ModusSwift","isfile",[arg0]);
   }
               
   exports.openfile = function(arg0,success,error){
           exec(success,error,"ModusSwift","openfile",[arg0]);
   }
               
/*exports.echojs = function(arg0, success, error) {
	if (arg0 && typeof(arg0) === 'string' && arg0.length > 0) {
 success(arg0);
	} else {
 error('Empty message!');
	}
 };*/
               
});
