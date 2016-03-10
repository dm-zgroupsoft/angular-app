angular.module('angularApp', ['ngResource', 'ngRoute', 'angularControllers', 'ui.bootstrap'])
    .config(['$routeProvider', function ($routeProvider) {
        $routeProvider
            .when('/displays', {
                templateUrl: 'partials/display-list.html',
                controller: 'DisplayListCtrl',
                resolve: {
                    responseData: ['Display', '$q', '$route', function (Display, $q, $route) {
                        var deferred = $q.defer();
                        Display.query({
                            offset: $route.current.params.offset,
                            limit: $route.current.params.limit
                        }, function (successData) {
                            deferred.resolve(successData);
                        }, function (errorData) {
                            deferred.reject();
                        });
                        return deferred.promise;
                    }]
                }
            })
            .otherwise({
                redirectTo: '/displays'
            });
    }]);
