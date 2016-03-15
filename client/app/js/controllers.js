angular.module('angularControllers', ['angularServices'])
    .controller('DisplaysController', ['$scope', '$location', '$stateParams', 'response', function ($scope, $location, $stateParams, response) {
        $scope.isSuccess = response.success;
        $scope.errors = response.errors;
        if(response.success) {
            $scope.displays = response.data;
            $scope.totalItems = response.meta.pagination.total_count;
            $scope.itemsPerPage = response.meta.pagination.per_page;

            $scope.pageChanged = function () {
                $location.search({offset: ($scope.currentPage - 1) * $scope.itemsPerPage, limit: $scope.itemsPerPage});
            };
            $scope.currentPage = 1 + Math.ceil(($stateParams.offset || 0) / $scope.itemsPerPage);
        }
    }]);