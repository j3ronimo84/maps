j3r = {}

class j3r.App
  constructor: ->
    @map = j3r.Map.create()
    @markers = j3r.Markers.create @map.getMap()
    @markersController = j3r.MarkersController.create @markers
    @search = j3r.Search.create()
    @markerInfo = $('#marker-info-placeholder')
    return

  start: ->
    @map.init()
    # init all markers
    @markers.setMarkers j3r.conf.markers
    # render selectors
    @markersController.init()
    #search listen
    $(document).ready =>
      searchInput = $('#search-input')
      searchInput.keyup =>
        @search.search searchInput.val()
        return
      return  
    return

  select: (mainCat, selectedCat) ->
    @markersController.setSelections mainCat, selectedCat
    return  

  showInfoWindow: (markerId) ->
    # TODO refactor? give to another file/class
    content = '<span onclick="$(\'#marker-info-placeholder\').hide()" class="marker-info-close"></span>'
    # TODO use getter
    content += @markersController.markers.infoWindows.generateInfoWindowContent markerId
    @markerInfo.empty()
    @markerInfo.append content
    setTimeout ->
        $("#marker-info-placeholder a.colorboxGallery").colorbox rel:"gal"
        return
      ,
        1000
    @markerInfo.show()
    return

j3r.helpers = 
  getCategoryInfoToString: (selection, category, delimiter = ' - ') ->
    # divide into categories
    catPosStart = []
    beginPos = 0
    while selection.indexOf(j3r.conf['settings']['catPrefix'], beginPos) isnt -1
      catPos = selection.indexOf j3r.conf['settings']['catPrefix'], beginPos
      beginPos = catPos + j3r.conf['settings']['catPrefix'].length
      catPosStart.push catPos 
    # find wanted category 
    for key, startAt of catPosStart
      nextKey = parseInt(key) + 1
      end = if catPosStart[nextKey]? then catPosStart[nextKey] else selection.length
      cat = selection.substring startAt, end
      if cat.indexOf category is 0
        selection = cat
        break
    # subcategories 
    path = []
    start = 0
    while selection.indexOf(j3r.conf['settings']['subCatDelimiter'], start) isnt -1
      pos = selection.indexOf j3r.conf['settings']['subCatDelimiter'], start
      start = pos + 1
      # end of subcat
      nextPos = if selection.indexOf(j3r.conf['settings']['subCatDelimiter'], start) isnt -1 then selection.indexOf j3r.conf['settings']['subCatDelimiter'], start else selection.length
      path.push selection.substring 0, nextPos
    # merge output 
    output = ''
    parrentCat = category
    for subCat in path
      output += delimiter if output.length isnt 0
      output += j3r.conf['categories']['list'][parrentCat][subCat]
      parrentCat = subCat
    output

  getTransformedText: (text, useSpaces = yes) ->
    text = text.toLowerCase()
    text = text.replace(/\s/g, "") if !useSpaces
    toReplace = {'á':'a','ä':'a','č':'c','ď':'d','é':'e','ě':'e','í':'i','ĺ':'l','ľ':'l','ň':'n','ó':'o','ô':'o','ő':'o','ö':'o','ŕ':'r','š':'s','ť':'t','ú':'u','ů':'u','ű':'u','ü':'u','ý':'y','ř':'r','ž':'z'}
    for pos in [0...text.length]
      text[pos] = toReplace[text[pos]] if !toReplace[text[pos]]?
    text

  # countOccurences: (string, count) ->
  #   line = clone string
  #   return line.length() - line.replace(count, "").length()


# class j3r.Observer
#   debugMode: false
#   constructor: ->
#     @subscribers = {}
#     if window["anev"]?
#       @debugMode = window["anev"].debugMode
#   on: (type, fn, context) ->
#     if typeof  fn isnt "function"
#       if typeof context[fn] is "function"
#         fn = context[fn]
#       else
#         throw new Error "None of variables #{fn}, #{context[fn]} are functions"
#     if typeof @subscribers[type] is "undefined"
#       @subscribers[type] = []
#     @subscribers[type].push fn: fn, context: context || @

#   fire: (type) ->
#     args = [].slice.call arguments, 1
#     if @debugMode then console.log "fire " + type, args, @
#     if @subscribers[type]?
#       for method, key  in @subscribers[type]
#         do (key, method) ->
#           method.fn.apply method.context, args

#   remove: (type, fn, context) ->
#     for method, key  in @subscribers[type] when method.fn is fn and method.context is context
#       do (key, method) ->
#         @subscribers[type].splice key, 1

#   listen: (object, type, fn) ->
#     if @debugMode then console.log "listening " + type, object