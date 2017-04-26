angular.module('loomioApp').factory 'SignUpModal', ->
  templateUrl: 'generated/components/sign_up_modal/sign_up_modal.html'
  controller: ($scope, preventClose, KeyEventService) ->
    $scope.preventClose = preventClose

    KeyEventService.registerKeyEvent $scope, 'pressedEsc', (elem, e) ->
      e.stopPropagation() if $scope.preventClose
