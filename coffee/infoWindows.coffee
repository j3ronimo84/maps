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
		categories = @markerInfos[markerId]
		contentString = '<div class="info-window-wrapper">
			<h3>' + @markerInfos[markerId]['title'] + '</h3>
			<div class="info-window-text main-type"><strong>Typ:&nbsp</strong> 
			'+ j3r.helpers.getCategoryInfo(markerId, 1) + '</div>';
		if j3r.helpers.getCategoryInfo(markerId, 2) isnt ''
			contentString += '<div class="info-window-text sub-type"><strong>Oddělení:&nbsp;</strong>' + j3r.helpers.getCategoryInfo(markerId, 2, ', ') + '</div>'
		contentString += '<div  class="info-window-text info">' + @markerInfos[markerId]['info'] + '</div>
			<div class="info-window-text adress"">Adresa:&nbsp;' + @markerInfos[markerId]['adress'] + '</div>
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
		output + '</div>'

j3r.InfoWindows.create = ->
	new j3r.InfoWindows j3r.conf['markers']

