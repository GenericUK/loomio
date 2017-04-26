angular.module('loomioApp').directive 'signUpForm', ->
  scope: {preventClose: '='}
  templateUrl: 'generated/components/sign_up_form/sign_up_form.html'
  controller: ($scope, $location, $window, ModalService, SignInModal, Session, AppConfig, Records, FormService) ->
    $scope.registration = Records.registrations.build()

    $scope.submit = FormService.submit $scope, $scope.registration,
      flashSuccess:    'sign_up_form.signed_up'
      successCallback: (data) -> Session.login(data)

    $scope.signIn = ->
      ModalService.open SignInModal, preventClose: -> $scope.preventClose

    $scope.redirectTo = (href) ->
      $window.location = href

    $scope.providers = AppConfig.oauthProviders
