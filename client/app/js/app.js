angular.module('angularApp', ['ngResource', 'ui.router', 'angularControllers', 'ui.bootstrap'])
    .config(['$stateProvider', '$urlRouterProvider', function ($stateProvider, $urlRouterProvider) {
        $stateProvider
            .state('displays', {
                url: '/displays?offset&limit',
                templateUrl: 'partials/display-list.html',
                controller: 'DisplayListCtrl',
                resolve: {
                    responseData: ['Display', '$stateParams', function (Display, $stateParams) {
                        return Display.query({
                            offset: $stateParams.offset,
                            limit: $stateParams.limit
                        }).$promise;
                    }]
                }
            });
        $urlRouterProvider.otherwise('/displays');
    }]);
