var angularApp = angular.module('angularApp', ['ngResource', 'ngRoute', 'angularControllers']);

angularApp.config(['$routeProvider',
    function ($routeProvider) {
        $routeProvider.when('/displays', {
            templateUrl: 'partials/display-list.html',
            controller: 'DisplayListCtrl'
        }).otherwise({
            redirectTo: '/displays'
        });
    }]);