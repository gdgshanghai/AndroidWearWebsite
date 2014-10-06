var fs = require('fs');
var sys = require('sys');
var exec = require('child_process').exec;

var qiniu = require('qiniu');

var AK = '0XPyut__IqewGS275QmjU1ZiGQuSRxZUrcM4pkRj',
  SK = '1CBOxFb3j69m8EFv2OIm6kAuztu5_BgFNCISFKzL',
  VERSION = '1',
  BUCKET = 'devfest'
  PREFIX = '2014';

if (AK === '' || SK === '') {
  console.error('empty ACCESS_KEY or SECRET_KEY');
  process.exit();
}

qiniu.conf.ACCESS_KEY = AK;
qiniu.conf.SECRET_KEY = SK;

if (process.argv.length >= 3) {
  VERSION = process.argv[2];
}

console.log('version', VERSION);

var uptoken = function() {
  var putPolicy = new qiniu.rs.PutPolicy(BUCKET);
  return putPolicy.token();
};

var uploadFile = function(path, uptoken) {
  var extra = new qiniu.io.PutExtra();

  var key = path.replace(/^\.\//, PREFIX + '/' + VERSION + '/');

  qiniu.io.putFile(uptoken, key, path, extra, function(err, ret) {
    if (err) {
      console.error('upload', key, 'failed, error:', err);
    } else {
      console.log('upload', key, 'to bucket', BUCKET, 'success');
    }
  });
};

exec('grunt compile --ver=' + VERSION, function(err, stdout, stderr) {
  sys.print(stdout);
  sys.print(stderr);

  var token = uptoken();

  fs.readdir(__dirname + '/image', function(err, files) {
    for (var i = 0; i < files.length; i++) {
      var imgPath = './image/' + files[i];
      uploadFile(imgPath, token);
    }
  });

  uploadFile('./css/main.css', token);
  uploadFile('./js/global.js', token);
  uploadFile('./addon/swiper/idangerous.swiper.css', token);
  uploadFile('./addon/swiper/idangerous.swiper.min.js', token);

  uploadFile('./index.html', token);

  console.info('http://devfest.qiniudn.com/2014/' + VERSION + '/index.html');
});

