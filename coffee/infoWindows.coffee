class j3r.InfoWindows
	constructor: (@markerInfos) ->
		@markersInfoWindows = {}
		return

	getInfoWindow: (markerId) ->
		@markersInfoWindows[markerId] = @generateInfoWindow @markerInfos[markerId] if !@markersInfoWindows[markerId]?
		@markersInfoWindows[markerId]

	generateInfoWindow: (markerInfo) ->
		contentString = '<h3>' + markerInfo['title'] + '</h3>
			<p>' + markerInfo['info'] + '</p>'
		infowindow = new google.maps.InfoWindow content: contentString

j3r.InfoWindows.create = ->
	new j3r.InfoWindows j3r.conf['markers']
