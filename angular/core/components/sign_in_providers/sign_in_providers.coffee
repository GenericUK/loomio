angular.module('loomioApp').directive 'signInProviders', ->
  templateUrl: 'generated/components/sign_in_providers/sign_in_providers.html'
  controller: ($scope, $window, AppConfig) ->
    $scope.providers = AppConfig.oauthProviders
    $scope.open = (provider) -> $window.location = provider.href
