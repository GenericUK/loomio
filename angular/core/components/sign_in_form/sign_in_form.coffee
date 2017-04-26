angular.module('loomioApp').directive 'signInForm', ->
  scope: {preventClose: '='}
  templateUrl: 'generated/components/sign_in_form/sign_in_form.html'
  controller: ($scope, $window, ModalService, Records, FormService, SignUpModal) ->
    $scope.session = Records.sessions.build(type: 'password', rememberMe: true)

    $scope.submit = FormService.submit $scope, $scope.session,
      flashSuccess:    'sign_in_form.signed_in'
      successCallback: (data) -> $window.location.reload()

    $scope.signUp = ->
      ModalService.open SignUpModal, preventClose: -> $scope.preventClose

    $scope.forgotPassword = ->
      $window.location = '/users/password/new'
