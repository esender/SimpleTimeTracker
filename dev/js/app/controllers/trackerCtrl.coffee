@TimeTracker.controller 'TrackerCtrl',
  [
    '$scope',
    '$timeout',
    'TimerSrv'
    ($scope, $timeout, TimerSrv) ->
      timer = null

      TimerSrv.getAll().then (data) ->
        $scope.timersByDate = _.groupBy data, (timer) ->
          timer.started_at.getDate()

      nextTimer = ->
        $scope.seconds = (new Date().getTime() - $scope.newTimer.started_at.getTime())
        timer = $timeout nextTimer, 1000

      $scope.toggleTracking = ->
        console.log('in tracking')
        console.log($scope.timers)

        if $scope.newTimer.started_at
          $scope.newTimer.ended_at = new Date()
          $scope.timers.push($scope.newTimer)
          TimerSrv.update($scope.newTimer)
          $scope.newTimer = {}
          $timeout.cancel timer
          $scope.seconds = 0
        else
          $scope.newTimer.started_at = new Date()
          $scope.newTimer = TimerSrv.create($scope.newTimer)

          timer = $timeout nextTimer, 1000

      $scope.getMs = (timer) ->
        if timer.ended_at
          timer.ended_at.getTime() - timer.started_at.getTime()



  ]