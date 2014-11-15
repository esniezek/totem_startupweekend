module = angular.module('totem.home', [])

module.config ($stateProvider)->

  $stateProvider

    .state 'index',

      url: ''

      views:

        "login":

          templateUrl: '/js/modules/home/login.html'

          controller: "LoginController"

    .state 'home',

      url: '/home'

      views:

        "main":

          templateUrl: '/js/modules/home/home.html'

          controller: "HomeController"

    .state 'home.post',

      url: '/post'

      views:

        "main":

          templateUrl: '/js/modules/home/post.html'

          controller: "PostController"

module.controller "LoginController",
  [
    "$scope"
    "AppObject"

    ($scope, AppObject)->

      $scope.app = AppObject

  ]

module.controller "HomeController",
  [
    "$scope"
    "AppObject"

    ($scope, AppObject)->

      $scope.app = AppObject
  ]

module.controller "PostController",
  [
    "$scope"
    "AppObject"

    ($scope, AppObject)->

      $scope.app = AppObject
  ]