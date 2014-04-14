(function() {
  this.TimeTracker.controller('TrackerCtrl', [
    '$scope', '$timeout', 'TimerSrv', function($scope, $timeout, TimerSrv) {
      var nextTimer, timer;
      timer = null;
      TimerSrv.getAll().then(function(data) {
        return $scope.timersByDate = _.groupBy(data, function(timer) {
          return timer.started_at.getDate();
        });
      });
      nextTimer = function() {
        $scope.seconds = new Date().getTime() - $scope.newTimer.started_at.getTime();
        return timer = $timeout(nextTimer, 1000);
      };
      $scope.toggleTracking = function() {
        console.log('in tracking');
        console.log($scope.timers);
        if ($scope.newTimer.started_at) {
          $scope.newTimer.ended_at = new Date();
          $scope.timers.push($scope.newTimer);
          TimerSrv.update($scope.newTimer);
          $scope.newTimer = {};
          $timeout.cancel(timer);
          return $scope.seconds = 0;
        } else {
          $scope.newTimer.started_at = new Date();
          $scope.newTimer = TimerSrv.create($scope.newTimer);
          return timer = $timeout(nextTimer, 1000);
        }
      };
      return $scope.getMs = function(timer) {
        if (timer.ended_at) {
          return timer.ended_at.getTime() - timer.started_at.getTime();
        }
      };
    }
  ]);

}).call(this);
