@TimeTracker.controller 'TrackerCtrl',
  [
    '$scope',
    '$timeout',
    ($scope, $timeout) ->
      timer = null
      $scope.timers = []

      nextTimer = ->
        $scope.seconds = Math.floor((new Date().getTime() - $scope.currentTimer.started_at.getTime()) / 1000)
        timer = $timeout nextTimer, 1000

      $scope.startNewTimer = () ->
        $scope.newTimer.started_at = new Date
        $scope.currentTimer = $scope.newTimer
        $scope.newTimer = {}
        timer = $timeout nextTimer, 1000

      $scope.stopNewTimer = () ->
        $scope.currentTimer.ended_at = new Date
        $scope.timers.push($scope.currentTimer)
        $scope.currentTimer = null
        $timeout.cancel timer



  ]