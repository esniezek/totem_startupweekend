module = angular.module('totem.post', [])

module.config ($stateProvider)->

  $stateProvider

    .state 'post',

      url: '/post'

      views:

        "login":

          templateUrl: '/js/modules/post/post.html'

          controller: "PostController"

module.controller "PostController",
  [
    "$scope"
    "AppObject"

    ($scope, AppObject)->

      $scope.app = AppObject

      $scope.imageFile

      $scope.setFile = ()->

        file = $("#take-picture")[0].files[0]

        $scope.app.imageFile = file
  ]