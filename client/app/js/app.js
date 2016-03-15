angular.module('angularApp', ['ui.router', 'angularControllers', 'ui.bootstrap'])
    .config(['$stateProvider', '$urlRouterProvider', function ($stateProvider, $urlRouterProvider) {
        $stateProvider
            .state('displays', {
                url: '/displays?offset&limit',
                templateUrl: 'partials/display-list.html',
                controller: 'DisplaysController',
                resolve: {
                    response: ['Display', '$q', '$stateParams', function (Display, $q, $stateParams) {
                        var deferred = $q.defer();
                        Display.query($stateParams,
                            function (successData) {
                                deferred.resolve(successData);
                            }, function (errorData) {
                                deferred.resolve({success: false, errors: [errorData.statusText]});
                            });
                        return deferred.promise;
                    }]
                }
            });
        $urlRouterProvider.otherwise('/displays');
    }]);
