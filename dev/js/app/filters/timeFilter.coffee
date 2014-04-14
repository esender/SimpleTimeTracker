'use srtict'

@TimeTracker.filter 'msToTime', ->
  (input) ->
    input = 0 if !input
    sec = Math.floor(input / 1000)
    hours = Math.floor(sec / 3600)
    minutes = Math.floor((sec - (hours * 3600)) / 60)
    seconds = sec - (hours * 3600) - (minutes * 60)

    hours = null if hours == 0
    minutes = null if minutes == 0

    minutes = '0' + minutes if minutes && minutes < 10 && hours
    seconds = '0' + seconds if !(sec < 60) && seconds < 10

    if hours
      time = hours + ':' + minutes + ' ч'
    else if minutes
      time = minutes + ':' + seconds + ' мин'
    else
      time = seconds + ' сек'

    time
