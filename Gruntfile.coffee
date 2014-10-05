module.exports = (grunt)->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    less:
      files:
        src: 'css/*.less'
        dest: 'css/main.css'

    coffee:
      files:
        src: 'js/*.coffee'
        dest: 'js/global.js'

    jade:
      files:
        src: 'views/index.jade'
        dest: 'index.html'

    connect:
      server:
        options:
          port: 3000
          # keepalive: true

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
