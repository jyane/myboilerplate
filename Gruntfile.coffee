module.exports = (grunt) ->
  grunt.initConfig
    esteWatch:
      options:
        dirs: ['assets/coffee/', 'assets/sass/**/']
        extentions: ['coffee', 'sass']
      coffee: -> ['coffee']
      sass: -> ['compass']

    compass:
      dist:
        options:
          config: 'config.rb'

    coffee:
      compile:
        files: [
          expand: true
          cwd: 'assets/coffee/'
          src: '*.coffee'
          dest: 'assets/js/'
          ext: '.js'
        ]

  pkg = grunt.file.readJSON('package.json')
  for taskName of pkg.devDependencies
    grunt.loadNpmTasks taskName if taskName.substring(0, 6) is 'grunt-'

  grunt.registerTask 'default', ['esteWatch']
