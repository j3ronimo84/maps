class j3r.InfoWindows
	constructor: (@markerInfos) ->
		@markersInfoWindows = {}
		return

	getInfoWindow: (markerId) ->
		@markersInfoWindows[markerId] = @generateInfoWindow markerId, @markerInfos[markerId] if !@markersInfoWindows[markerId]?
		@markersInfoWindows[markerId]

	# TODO - use template 
	generateInfoWindow: (markerId) ->
		infowindow = new google.maps.InfoWindow content: @generateInfoWindowContent markerId

	generateInfoWindowContent: (markerId) ->
		contentString = '<div class="info-window-wrapper">
			<h3>' + @markerInfos[markerId]['title'] + '</h3>
			<span class="info-window-adress"><strong>umístění:</strong> 
			'+ j3r.helpers.getCategoryInfoToString(@markerInfos[markerId]['cat'], 'cat-a') + '</span>
			<div info-window-text->' + @markerInfos[markerId]['info'] + '</div>
			' + @generateInfoWindowGallery(markerId, @markerInfos[markerId]['gal']) if !@markerInfos[markerId]['gal']? + '
			</div>'		

	generateInfoWindowGallery: (folder, galleryInfo) ->
		output = '<div class="info-window-wrapper-gal ' + folder + '">'
		linkToFolder = j3r.conf['settings']['pathToInfoWindowPics'] + folder + '/'
		for pos, picLink of galleryInfo
			output += '<a href="' + linkToFolder + picLink.replace('_sm', '') + '"
			 class="colorboxGallery pic-gal cboxElement" rel="gal">
		    <img class="link-outline" src="' + linkToFolder + picLink + '" alt="">
			</a>'
		# TODO better listener
		output + '</div>'

j3r.InfoWindows.create = ->
	new j3r.InfoWindows j3r.conf['markers']
