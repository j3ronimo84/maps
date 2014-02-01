j3r = {}

class j3r.App
  constructor: ->
    @map = j3r.Map.create()
    @markers = j3r.Markers.create @map.getMap()
    @markersController = j3r.MarkersController.create @markers
    return

  start: ->
    @map.init()
    # init all markers
    @markers.setMarkers j3r.conf.markers
    # render selectors
    @markersController.init()
    return

  select: (mainCat, selectedCat) ->
    @markersController.setSelections mainCat, selectedCat
    return  
 
j3r.helpers = 
  getCategoryPath: (selection) ->
    path = []
    start = 0
    pos = while selection.indexOf('_', start) isnt -1
      path.push selection.substring 0, pos
      start = pos
    return path  

  countOccurences: (string, count) ->
    line = clone string
    return line.length() - line.replace(count, "").length()

class j3r.Observer
  debugMode: false
  constructor: ->
    @subscribers = {}
    if window["anev"]?
      @debugMode = window["anev"].debugMode
  on: (type, fn, context) ->
    if typeof  fn isnt "function"
      if typeof context[fn] is "function"
        fn = context[fn]
      else
        throw new Error "None of variables #{fn}, #{context[fn]} are functions"
    if typeof @subscribers[type] is "undefined"
      @subscribers[type] = []
    @subscribers[type].push fn: fn, context: context || @

  fire: (type) ->
    args = [].slice.call arguments, 1
    if @debugMode then console.log "fire " + type, args, @
    if @subscribers[type]?
      for method, key  in @subscribers[type]
        do (key, method) ->
          method.fn.apply method.context, args

  remove: (type, fn, context) ->
    for method, key  in @subscribers[type] when method.fn is fn and method.context is context
      do (key, method) ->
        @subscribers[type].splice key, 1

  listen: (object, type, fn) ->
    if @debugMode then console.log "listening " + type, object