class j3r.Markers
  constructor: (@map, @markersInfo, @infoWindows, @markersObjects = {}, @actualMarkers = {}) ->

  setMarkers: (newMarkers) ->
    # remove from current 
    for markerId, markerShow of @actualMarkers
      @removeMarker markerId if !newMarkers[markerId] and @actualMarkers
    # add new
    for markerId, markerShow of newMarkers
      @addMarker markerId, @markersInfo[markerId] if !@actualMarkers[markerId]? or !@actualMarkers[markerId]
    return  
        
  addMarker: (markerId, markerInfo) ->
    @markersObjects[markerId] = @getMarker markerId, markerInfo if !@markersObjects[markerId]?
    @markersObjects[markerId].setMap @map
    @actualMarkers[markerId] = yes
    return

  getMarker: (markerId, markerInfo) ->
    marker = new google.maps.Marker
      position: new google.maps.LatLng markerInfo['pos'][0], markerInfo['pos'][1]
      map: @map
      title: markerInfo['title']
    google.maps.event.addListener marker, 'click', =>
      @infoWindows.getInfoWindow(markerId).open @map,marker
      # timeout because its not in callback 
      setTimeout ->
          $(".info-window-wrapper-gal a.colorboxGallery").colorbox rel:"gal"
          return
        ,
          1000
      return
    marker  

  removeMarker: (markerId) ->
    @markersObjects[markerId].setMap null
    @actualMarkers[markerId] = no
    return

  addMarkerByPos: (pos) ->
    console.log pos
    marker = new google.maps.Marker
      position: pos
      map: @map

j3r.Markers.create = (map) ->
  new j3r.Markers map, j3r.conf['markers'], j3r.InfoWindows.create()
