/**
 * Created with JetBrains WebStorm.
 * User: Eddie
 * Date: 6/13/14
 * Time: 5:11 PM
 * To change this template use File | Settings | File Templates.
 */

'use strict';

angular.module('directives.skrollr', [])
  .directive('skrollr', function() {

    var directiveDefinitionObject = {

      link: function($scope, $el, $attrs) {
        skrollr.init();

        $scope.$watch(
          function(){ return $el[0].childNodes.length; },
          function(newValue, oldValue){
            skrollr.init().refresh();
          }
        )
      }
    };

    return directiveDefinitionObject;
  });
