@TimeTracker.controller 'TrackerCtrl',
  [
    '$scope',
    '$timeout',
    ($scope, $timeout) ->
      console.log('1')
      $scope.timers = [
        {
          title: 'Start Work With Simple Time Tracker'
          started_at: new Date
          description: 'Simple Description'
        }
        {
          title: 'Started Two'
          started_at: new Date
          description: ''
        }
      ]

      timer = ->
        $scope.seconds = Math.floor((new Date().getTime() - $scope.currentTimer.started_at.getTime()) / 1000)
        $timeout timer, 1000

      $scope.startNewTimer = () ->
        $scope.newTimer.started_at = new Date
        $scope.currentTimer = $scope.newTimer
        $scope.newTimer = {}
        $timeout(timer, 1000);



  ]