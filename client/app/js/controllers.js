var angularControllers = angular.module('angularControllers', ['angularServices']);

angularControllers.controller('DisplayListCtrl', ['$scope', '$location', 'Display',
    function ($scope, $location, Display) {
        $scope.currentPage = $location.search()['page'];

        $scope.pageChanged = function () {
            $location.search('page', $scope.currentPage);
        };
        $scope.maxSize = 5;
        $scope.displays = Display.query({page: $scope.currentPage}, function(data, getResponseHeaders) {
            var headers = getResponseHeaders();
            $scope.totalItems = headers['x-total-entries'];
        });
    }]);