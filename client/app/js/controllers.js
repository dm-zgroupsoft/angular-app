angular.module('angularControllers', ['angularServices'])
    .controller('DisplaysController', ['$scope', '$location', '$routeParams', 'response', function ($scope, $location, $routeParams, response) {
        $scope.isSuccess = response.success;
        $scope.errors = response.errors;
        if(response.success) {
            $scope.displays = response.data;
            $scope.totalItems = response.meta.pagination.total_count;
            $scope.itemsPerPage = response.meta.pagination.per_page;

            $scope.pageChanged = function () {
                $location.search({offset: ($scope.currentPage - 1) * $scope.itemsPerPage, limit: $scope.itemsPerPage});
            };
            $scope.currentPage = 1 + Math.ceil(($routeParams.offset || 0) / $scope.itemsPerPage);
        }
    }]);