class j3r.Markers
  constructor: (@map, @markers = {}) ->

  setMarkers: (newMarkers) ->
    # remove from current 
    for markerId, marker of @markers
      @removeMarker markerId if !newMarkers[markerId]
    # add new
    for markerId, marker of newMarkers
      @addMarker markerId, marker if !@markers[markerId]?
    return  
        
  addMarker: (markerId, markerInfo) ->
    marker = new google.maps.Marker
      position: new google.maps.LatLng markerInfo['pos'][0], markerInfo['pos'][1]
      map: @map
      title: markerInfo['title']
    @markers[markerId] = marker
    return

  removeMarker: (markerId) ->
    @markers[markerId].setMap null
    delete @markers[markerId]
    return

  addMarkerByPos: (pos) ->
    console.log pos
    marker = new google.maps.Marker
      position: pos
      map: @map

j3r.Markers.create = (map) ->
  markers = new j3r.Markers map
  return markers
    # @icons =
    #   buildings: url + 'pics/marker_house_png'
    #   shops: url + 'pics/marker_shop_png'