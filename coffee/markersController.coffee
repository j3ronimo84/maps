class j3r.MarkersController
  @emptyTitle = 'select...'
  @wrapper = 'menu-wrapper'
  constructor: (@markers, @categories, @selected) ->

  init: ->
    for mainCategoryId in @selected
      @renderSelector mainCategoryId
    return  

  setSelections: (selections) ->
    for selection in selections
      # empty selectors
      wrapper = $('#' + @getParentId selection)
      wrapper.html '' if wrapper.length > 0
      # render new selectors
      @renderSelector selection if @categories[selection]? 
      # add/remove markers
      @setMarkers selection
    return

  renderSelector: (categoryId) ->
    parrentId = @getParentId categoryId
    selector = $('<select id="' + categoryId + '" onChange="app.select($(\'#' + categoryId + '\').val())"><select>')
    selector.append '<option disabled selected>' + j3r.MarkersController.emptyTitle + '</option>'
    for optionId, optionName of @categories[categoryId]
      selector.append '<option value="' + optionId + '">' + optionName + '</option>'
    wrapper = $('#' + parrentId)
    if wrapper.length is 0
      wrapper = $('<div id="' + parrentId + '"></div>')
      $('#menu-wrapper').append wrapper
    wrapper.append selector
    return

  getParentId: (categoryId) ->
    mainCatEnd = categoryId.lastIndexOf '_'
    parrentId = if mainCatEnd isnt -1 then 'wrapper-' + categoryId.substr 0, mainCatEnd else j3r.MarkersController.wrapper
    parrentId

  setMarkers: (selection) ->
    newMarkers = {}
    for markerId, markerInfo of j3r.conf.markers
      newMarkers[markerId] = markerInfo if markerInfo['cat'].indexOf(selection) isnt -1
    @markers.setMarkers newMarkers
    return

j3r.MarkersController.create = (markers, categories) ->
  return new j3r.MarkersController markers, categories, ['cat-a']
