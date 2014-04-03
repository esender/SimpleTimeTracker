@TimeTracker.controller 'TrackerCtrl',
  [
    '$scope',
    ($scope) ->
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

      $scope.startNewTimer = () ->
        $scope.newTimer.started_at = new Date
        $scope.timers.push $scope.newTimer
        $scope.newTimer = {}
  ]