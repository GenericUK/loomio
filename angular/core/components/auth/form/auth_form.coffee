angular.module('loomioApp').directive 'authForm', (AppConfig, Records) ->
  scope: {preventClose: '='}
  templateUrl: 'generated/components/auth/form/auth_form.html'
  controller: ($scope) ->
    $scope.user = Records.users.build
      provider:    AppConfig.pendingIdentity.identity_type
      name:        AppConfig.pendingIdentity.name
      email:       AppConfig.pendingIdentity.email
      emailStatus: AppConfig.pendingIdentity.email_status

    $scope.loginComplete = ->
      $scope.user.sentLoginLink or $scope.user.sentPasswordLink

    $scope.$on 'processing',     -> $scope.isDisabled = true
    $scope.$on 'doneProcessing', -> $scope.isDisabled = false