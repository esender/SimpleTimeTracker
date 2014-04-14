# Обязательная обёртка
module.exports = (grunt) ->

	grunt.initConfig

    connect:
      server:
        options:
          base: 'dist'
          keepalive: true

    copy:
      main:
        files: [
          {expand: true, cwd: 'lib/angular/', src: ['angular.min.js'], dest: 'dist/js/'}
          {expand: true, cwd: 'lib/angularjs-indexedDB/src/', src: ['indexeddb.js'], dest: 'dist/js/'}
          {expand: true, cwd: 'lib/bootstrap/dist/', src: ['css/*.min.css', 'fonts/*'], dest: 'dist/css/bootstrap/'}
          {expand: true, cwd: 'lib/underscore/', src: ['underscore.js'], dest: 'dist/js/'}
        ]

    coffee:
      app:
        expand: true,
        flatten: true,
        cwd: 'dev/js/app',
        src: ['**/*.coffee'],
        dest: 'dist/js/app',
        ext: '.js'


    slim:
      dev:
        options:
          pretty: true
        files:
          'dist/index.html': 'dev/index.slim'

  grunt.loadNpmTasks('grunt-contrib-connect')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-slim')
  grunt.loadNpmTasks('grunt-contrib-coffee')

	grunt.registerTask "default", ["copy","slim:dev", "coffee"]
