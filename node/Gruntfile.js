module.exports = function (grunt) {
  require('jit-grunt')(grunt);

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    develop: {
      server: {
        file: 'app.js'
      }
    },

    watch: {
      options: {
        nospawn: true
      },
      js: {
        files: ['**/*.js', '!**/node_modules/**'],
        tasks: ['develop']
      }
    }
  });

  grunt.registerTask('default', [
    'develop',
    'watch'
  ]);
};