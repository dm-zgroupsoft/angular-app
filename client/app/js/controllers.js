angular.module('angularControllers', ['angularServices'])

    .controller('DisplayListCtrl', ['$scope', '$location', 'responseData',
        function ($scope, $location, responseData) {
            $scope.displays = responseData.records;
            $scope.totalItems = responseData._metadata.total_count;
            $scope.itemsPerPage = responseData._metadata.limit;

            $scope.pageChanged = function () {
                $location.search('offset', ($scope.currentPage - 1) * $scope.itemsPerPage);
                $location.search('limit', $scope.itemsPerPage);
            };

            $scope.currentPage = 1 + Math.ceil(($location.search()['offset'] || 0) / $scope.itemsPerPage);
        }]);