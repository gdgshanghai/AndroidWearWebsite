module.exports = (grunt)->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    less:
      files:
        src: 'css/*.less'
        dest: 'css/main.css'

    jade:
      files:
        src: 'index.jade'
        dest: 'index.html'

    connect:
      server:
        options:
          port: 3000
          # keepalive: true

    watch:
      jade:
        files: 'index.jade'
        tasks: ['jade']
        options:
          livereload: true
      less:
        files: 'css/*.less'
        tasks: ['less']
        options:
          livereload: true

  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', [
    'connect:server'
    'watch'
  ]
