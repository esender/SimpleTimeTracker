@TimeTracker.service 'TimerSrv',
  [
    '$indexedDB',
    ($indexedDB) ->
      storageName = 'timers'
      storage = $indexedDB.objectStore(storageName)

      generateId = ->
        new Date().getTime()

      {
        create: (timer) ->
          timer._id = generateId()
          storage.insert(timer)
          timer

        update: (timer) ->
          storage.upsert(timer)

        getAll: ->
          storage.getAll()
      }
  ]