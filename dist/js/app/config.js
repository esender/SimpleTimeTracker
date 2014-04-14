(function() {
  'use strict';
  this.TimeTracker.config(function($indexedDBProvider) {
    return $indexedDBProvider.connection('timeTrackerDB').upgradeDatabase(1, function(event, db, tx) {
      var objStore;
      return objStore = db.createObjectStore('timers', {
        keyPath: '_id'
      });
    });
  });

}).call(this);
