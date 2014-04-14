(function() {
  this.TimeTracker.service('TimerSrv', [
    '$indexedDB', function($indexedDB) {
      var generateId, storage, storageName;
      storageName = 'timers';
      storage = $indexedDB.objectStore(storageName);
      generateId = function() {
        return new Date().getTime();
      };
      return {
        create: function(timer) {
          timer._id = generateId();
          storage.insert(timer);
          return timer;
        },
        update: function(timer) {
          return storage.upsert(timer);
        },
        getAll: function() {
          return storage.getAll();
        }
      };
    }
  ]);

}).call(this);
