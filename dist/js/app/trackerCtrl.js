(function() {
  this.TimeTracker.controller('TrackerCtrl', [
    '$scope', '$timeout', function($scope, $timeout) {
      var timer;
      console.log('1');
      $scope.timers = [
        {
          title: 'Start Work With Simple Time Tracker',
          started_at: new Date,
          description: 'Simple Description'
        }, {
          title: 'Started Two',
          started_at: new Date,
          description: ''
        }
      ];
      timer = function() {
        $scope.seconds = Math.floor((new Date().getTime() - $scope.currentTimer.started_at.getTime()) / 1000);
        return $timeout(timer, 1000);
      };
      return $scope.startNewTimer = function() {
        $scope.newTimer.started_at = new Date;
        $scope.currentTimer = $scope.newTimer;
        $scope.newTimer = {};
        return $timeout(timer, 1000);
      };
    }
  ]);

}).call(this);
