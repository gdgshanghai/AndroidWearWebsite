var sys = require('sys');
var exec = require('child_process').exec;

exec('grunt compile --ver=6', function(err, stdout, stderr) {
	sys.print(stdout);
	sys.print(stderr);
});
