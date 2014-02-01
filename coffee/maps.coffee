# j3r = j3r | {}
url = '../'

class j3r.Map
  constructor: (@position, @mapCanvas, @mapOptions, options = null) ->
    if options?
      for optionValue, optionKey of options
        @mapOptions[optionKey] = optionValue
    @map = new google.maps.Map @mapCanvas, @mapOptions
    return

  init: -> 
    google.maps.event.addDomListener window, 'load', @map
    return

  getMap: ->
    @map 

  addMarkers: (type = null) =>
    if type?
      @addMarkerByType type if @poi[type]?
    else
      @addMarkerByType type for type of @poi
    return 

  addMarkerByType: (type) =>
   for pos in [0..@poi[type].length+1]
      @addMarker type, pos
    return     

  addMarker: (type, pos) =>
    @markers[type] = [] if !@markers[type]?
    markerInfo = @poi[type][pos]
    if markerInfo?
      marker = new google.maps.Marker
        position: new google.maps.LatLng markerInfo['pos']
        map: @map,
        title: markerInfo['name']
      @markers[type].push marker
    return    

j3r.Map.create = ->
  position = [49.740290, 13.365370]
  mapCanvas = document.getElementById 'map-canvas'
  mapOptions = 
    center: new google.maps.LatLng position[0], position[1] 
    zoom: 11
    mapTypeId: google.maps.MapTypeId.ROADMAP
  new j3r.Map position, mapCanvas, mapOptions