@TimeTracker.controller 'TrackerCtrl',
  [
    '$scope',
    '$timeout',
    ($scope, $timeout) ->
      timer = null
      $scope.timers = []

      nextTimer = ->
        $scope.seconds = (new Date().getTime() - $scope.currentTimer.started_at.getTime())
        timer = $timeout nextTimer, 1000

      $scope.startNewTimer = () ->
        $scope.newTimer.started_at = new Date()
        $scope.currentTimer = $scope.newTimer
        $scope.newTimer = {}
        timer = $timeout nextTimer, 1000

      $scope.stopNewTimer = () ->
        $scope.currentTimer.ended_at = new Date()
        $scope.timers.push($scope.currentTimer)
        $scope.currentTimer = null
        $timeout.cancel timer

      $scope.getMs = (timer) ->
        timer.ended_at.getTime() - timer.started_at.getTime()



  ]