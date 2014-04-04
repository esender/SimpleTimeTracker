(function() {
  this.TimeTracker.controller('TrackerCtrl', [
    '$scope', '$timeout', function($scope, $timeout) {
      var nextTimer, timer;
      timer = null;
      $scope.timers = [];
      nextTimer = function() {
        $scope.seconds = new Date().getTime() - $scope.currentTimer.started_at.getTime();
        return timer = $timeout(nextTimer, 1000);
      };
      $scope.startNewTimer = function() {
        $scope.newTimer.started_at = new Date();
        $scope.currentTimer = $scope.newTimer;
        $scope.newTimer = {};
        return timer = $timeout(nextTimer, 1000);
      };
      $scope.stopNewTimer = function() {
        $scope.currentTimer.ended_at = new Date();
        $scope.timers.push($scope.currentTimer);
        $scope.currentTimer = null;
        return $timeout.cancel(timer);
      };
      return $scope.getMs = function(timer) {
        return timer.ended_at.getTime() - timer.started_at.getTime();
      };
    }
  ]);

}).call(this);
