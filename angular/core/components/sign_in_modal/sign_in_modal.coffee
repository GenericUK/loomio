angular.module('loomioApp').factory 'SignInModal', ->
  templateUrl: 'generated/components/sign_in_modal/sign_in_modal.html'
  controller: ($scope, preventClose, KeyEventService) ->
    $scope.preventClose = preventClose

    KeyEventService.registerKeyEvent $scope, 'pressedEsc', (elem, e) ->
      e.stopPropagation() if $scope.preventClose
