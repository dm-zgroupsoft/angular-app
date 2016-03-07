var angularControllers = angular.module('angularControllers', ['angularServices']);

angularControllers.controller('DisplayListCtrl', ['$scope', 'Display',
    function ($scope, Display) {
        $scope.displays = Display.query();
    }]);