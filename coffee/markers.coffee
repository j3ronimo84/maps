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
   
  getInfoWindows: =>
    @infoWindows      

  addMarker: (markerId, markerInfo) ->
    @markersObjects[markerId] = @getMarker markerId, markerInfo if !@markersObjects[markerId]?
    @markersObjects[markerId].setMap @map
    @actualMarkers[markerId] = yes
    return

  getMarker: (markerId, markerInfo) ->
    # TODO refactor - give as function as to constructor or use setter
    markerIcon = if markerInfo['cat'].indexOf('cat-a_a') is 0 then 'pics/marker-a.png' else 'pics/marker-b.png'
    marker = new google.maps.Marker
      position: new google.maps.LatLng markerInfo['pos'][0], markerInfo['pos'][1]
      map: @map
      title: markerInfo['title']
      icon: markerIcon
    google.maps.event.addListener marker, 'click', =>
      @showMarkerInfo markerId, marker
      return
    marker

  removeMarker: (markerId) ->
    @markersObjects[markerId].setMap null
    @actualMarkers[markerId] = no
    return

  showMarkerInfo: (markerId, marker=null) =>
    marker = @markersObjects[markerId] if !marker? and @markersObjects[markerId]?
    if marker?
      @infoWindows.hideAllMarkersInfoWindows()
      @infoWindows.getInfoWindow(markerId).open @map,marker
      # timeout because its not in callback 
      setTimeout ->
          $(j3r.conf['settings']['el_markerInfoPlaceholderColorbox']).colorbox rel:"gal"
          return
        ,
          500
    return  

  addMarkerByPos: (pos) ->
    console.log pos
    marker = new google.maps.Marker
      position: pos
      map: @map

j3r.Markers.create = (map) ->
  new j3r.Markers map, j3r.conf['markers'], j3r.InfoWindows.create()
