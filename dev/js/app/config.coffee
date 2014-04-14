'use strict'

@TimeTracker
.config ($indexedDBProvider) ->
  $indexedDBProvider.connection('timeTrackerDB')
  .upgradeDatabase 1, (event, db, tx) ->
    objStore = db.createObjectStore('timers', {keyPath: '_id'});
#    objStore.createIndex('started_at_idx', 'started_at', {unique: true});
