/**
 * Created with JetBrains WebStorm.
 * User: Eddie
 * Date: 8/21/14
 * Time: 7:50 AM
 * To change this template use File | Settings | File Templates.
 */

module.exports = function(grunt) {

  grunt.config.set('jade', {
    dev: {
      options: {
        bare: true,
        sourceMap: true,
        sourceRoot: './'
      },
      files: [{
        expand: true,
        cwd: 'assets/js/',
        src: ['**/*.jade'],
        dest: '.tmp/public/js/',
        ext: '.html'
      }, {
        expand: true,
        cwd: 'assets/js/',
        src: ['**/*.jade'],
        dest: '.tmp/public/js/',
        ext: '.html'
      }]
    }
  });

  grunt.loadNpmTasks('grunt-contrib-jade');
};
