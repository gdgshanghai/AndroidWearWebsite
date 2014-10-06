module.exports = (grunt)->

  CSS_ASSERT_PATH = '"../"';
  JS_ASSERT_PATH = ''

  VERSION = grunt.option 'ver'
  if VERSION
    QINIU_CDN = 'http://devfest.qiniudn.com/2014/' + VERSION + '/'
    CSS_ASSERT_PATH = "\"#{QINIU_CDN}\""
    JS_ASSERT_PATH = QINIU_CDN

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    less:
      options:
        modifyVars:
          asset: CSS_ASSERT_PATH
      files:
        src: 'css/*.less'
        dest: 'css/main.css'

    coffee:
      files:
        src: 'js/*.coffee'
        dest: 'js/global.js'

    jade:
      options:
        data:
          ASSETPATH: JS_ASSERT_PATH
      files:
        src: 'views/index.jade'
        dest: 'index.html'

    connect:
      server:
        options:
          port: 3000

    watch:
      less:
        files: 'css/*.less'
        tasks: ['less']
        options:
          livereload: true
      coffee:
        files: 'js/*.coffee'
        tasks: ['coffee']
        options:
          livereload: true
      jade:
        files: 'views/*.jade'
        tasks: ['jade']
        options:
          livereload: true

  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', [
    'connect:server'
    'watch'
  ]

  grunt.registerTask 'compile', [
    'less'
    'coffee'
    'jade'
  ]
