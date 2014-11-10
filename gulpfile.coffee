gulp    = require 'gulp'
coffee  = require 'gulp-coffee'
compass = require 'gulp-compass'

config =
  coffeeDir: 'assets/coffee/**/*.coffee'
  cssDir:    'assets/css'
  jsDir:     'assets/js'
  sassDir:   'assets/sass/**/*.sass'

gulp.task 'coffee', ->
  gulp
    .src config.coffeeDir
    .pipe coffee()
    .pipe gulp.dest config.jsDir

gulp.task 'compass', ->
  gulp
    .src config.sassDir
    .pipe(compass(
        config_file: 'assets/config.rb'
        css: 'assets/css'
        sass: 'assets/sass'
    ))
    # .pipe gulp.dest config.cssDir

gulp.task 'watch', ->
  gulp.watch config.coffeeDir, ['coffee']
  gulp.watch config.sassDir,   ['compass']

gulp.task 'default', ['watch']
