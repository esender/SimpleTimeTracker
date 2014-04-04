(function() {
  this.TimeTracker.controller('TrackerCtrl', [
    '$scope', '$timeout', function($scope, $timeout) {
      var nextTimer, timer;
      timer = null;
      $scope.timers = [];
      nextTimer = function() {
        $scope.seconds = Math.floor((new Date().getTime() - $scope.currentTimer.started_at.getTime()) / 1000);
        return timer = $timeout(nextTimer, 1000);
      };
      $scope.startNewTimer = function() {
        $scope.newTimer.started_at = new Date;
        $scope.currentTimer = $scope.newTimer;
        $scope.newTimer = {};
        return timer = $timeout(nextTimer, 1000);
      };
      return $scope.stopNewTimer = function() {
        $scope.currentTimer.ended_at = new Date;
        $scope.timers.push($scope.currentTimer);
        $scope.currentTimer = null;
        return $timeout.cancel(timer);
      };
    }
  ]);

}).call(this);
