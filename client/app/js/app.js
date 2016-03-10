angular.module('angularApp', ['ngRoute', 'angularControllers', 'ui.bootstrap'])
    .config(['$routeProvider', function ($routeProvider) {
        $routeProvider
            .when('/displays', {
                templateUrl: 'partials/display-list.html',
                controller: 'DisplaysController',
                resolve: {
                    response: ['Display', '$q', '$route', function (Display, $q, $route) {
                        var deferred = $q.defer();
                        Display.query($route.current.params,
                            function (successData) {
                                deferred.resolve(successData);
                            }, function (errorData) {
                                deferred.resolve({success: false, errors: [errorData.statusText]});
                            });
                        return deferred.promise;
                    }]
                }
            })
            .otherwise({
                redirectTo: '/displays'
            });
    }]);
