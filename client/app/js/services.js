var angularServices = angular.module('angularServices', ['ngResource']);

angularServices.factory('Display', ['$resource',
    function ($resource) {
        var baseUrl = 'http://localhost\\:3000/';
        return $resource(baseUrl + 'displays', {}, {
            query: {method: 'GET', isArray: true}
        });
    }]);