j3r = {}

class j3r.App
  constructor: ->
    @map = j3r.Map.create()
    @markers = j3r.Markers.create @map.getMap()
    @markersController = j3r.MarkersController.create @markers
    @search = j3r.Search.create()
    @markerInfo = $(j3r.conf['settings']['el_markerInfoPlaceholder'])
    return

  start: ->
    @map.init()
    # init all markers
    @markers.setMarkers j3r.conf.markers
    # render selectors
    @markersController.init()
    #search listen
    $(document).ready =>
      searchInput = $(j3r.conf['settings']['el_searchInput'])
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
    content = '<span onclick="$(\'' + j3r.conf['settings']['el_markerInfoPlaceholder'] + '\').hide()" class="marker-info-close"></span>'
    # TODO use getter
    content += @markersController.markers.infoWindows.generateInfoWindowContent markerId
    @markerInfo.empty()
    @markerInfo.append content
    setTimeout ->
        $(j3r.conf['settings']['el_markerInfoPlaceholderColorbox']).colorbox rel:"gal"
        return
      ,
        500
    @markerInfo.css 'left', ((($(window).width() - 960)/2)+(960-308))
    #reset search 
    $(j3r.conf['settings']['el_searchInput']).val ''
    @search.search ''    
    @markerInfo.show()
    return

j3r.helpers = 
  categoryInfo: {}
  getAllCategoriesInfo: (itemId) ->
    j3r.helpers.setCategoryInfo itemId if !j3r.helpers.categoryInfo[itemId]?
    output = []
    for level, levelValues of j3r.helpers['categoryInfo'][itemId]
      output = output.concat levelValues
    output  
  getCategoryInfo: (itemId, level=1, delimiter=' ') ->
    j3r.helpers.setCategoryInfo itemId if !j3r.helpers.categoryInfo[itemId]?
    output = ''
    output = j3r.helpers['categoryInfo'][itemId][level].join(delimiter) if j3r.helpers['categoryInfo'][itemId][level]?
    output
  setCategoryInfo: (itemId) ->
    selection = j3r['conf']['markers'][itemId]['cat']
    end = 0
    categories = {}
    while true
      end = selection.indexOf j3r.conf['settings']['catPrefix'], 1
      # only one category
      end = selection.length if end is - 1 and selection.length > 0 
      if end > -1
        category = selection.substring 0, end
        level = j3r.helpers.countOccurences category, '_'
        categories[level] = [] if !categories[level]?
        categories[level].push j3r.helpers.getCategoryName category, j3r['conf']['categories']['list']
        selection = selection.substring end
      else
        break
    j3r.helpers['categoryInfo'][itemId] = categories    
    return    
  getCategoryName: (cat, list) ->
    # got name, but not list of subcats
    return list[cat] if list[cat]? and typeof list[cat] isnt 'object'
    for key of list
      # is parent = cat has same begin and has only one '_' which defines last cat
      if (cat.indexOf(key) is 0) and (j3r.helpers.countOccurences(cat.substring(key.length), '_') is 1)
        title = j3r.helpers.getCategoryName cat, list[key]
        return title

  countOccurences: (str, find) ->
    regex = new RegExp(find, "g");
    str.length - str.replace(regex, "").length      

  getTransformedText: (text, useSpaces = yes) ->
    text = text.toLowerCase()
    text = text.replace(/\s/g, "") if !useSpaces
    toReplace = {'á':'a','ä':'a','č':'c','ď':'d','é':'e','ě':'e','í':'i','ĺ':'l','ľ':'l','ň':'n','ó':'o','ô':'o','ő':'o','ö':'o','ŕ':'r','š':'s','ť':'t','ú':'u','ů':'u','ű':'u','ü':'u','ý':'y','ř':'r','ž':'z'}
    for pos in [0...text.length]
      text[pos] = toReplace[text[pos]] if !toReplace[text[pos]]?
    text