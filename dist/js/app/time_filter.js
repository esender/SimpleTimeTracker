(function() {
  'use srtict';
  this.TimeTracker.filter('msToTime', function() {
    return function(input) {
      var hours, minutes, sec, seconds, time;
      if (!input) {
        input = 0;
      }
      sec = Math.floor(input / 1000);
      hours = Math.floor(sec / 3600);
      minutes = Math.floor((sec - (hours * 3600)) / 60);
      seconds = sec - (hours * 3600) - (minutes * 60);
      if (hours === 0) {
        hours = null;
      }
      if (minutes === 0) {
        minutes = null;
      }
      if (minutes && minutes < 10 && hours) {
        minutes = '0' + minutes;
      }
      if (!(sec < 60) && seconds < 10) {
        seconds = '0' + seconds;
      }
      if (hours) {
        time = hours + ':' + minutes + ' h';
      } else if (minutes) {
        time = minutes + ':' + seconds + ' min';
      } else {
        time = seconds + ' sec';
      }
      return time;
    };
  });

}).call(this);
