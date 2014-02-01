class j3r.MarkersController
  @wrapper = 'menu-wrapper'
  constructor: (@markersList, @markers, @categories, @selected) ->

  init: ->
    for mainCategoryId, selectedCategoryId of @selected
      @renderSelector mainCategoryId, selectedCategoryId
    return  

  setSelections: (mainCategory, selection) ->
    # empty selectors
    wrapper = $('#' + @getParentId selection)
    wrapper.html '' if wrapper.length > 0
    # render new selectors
    @renderSelector mainCategory, selection if @categories['list'][selection]? 
    # add/remove markers
    @selected[mainCategory] = selection
    @setMarkers()
    return

  renderSelector: (mainCategoryId, categoryId) ->
    parrentId = @getParentId categoryId
    selector = $('<select id="' + categoryId + '" onChange="app.select($(\'#' + categoryId + ' option:selected\').attr(\'data-main-cat\'),$(\'#' + categoryId + ' option:selected\').attr(\'data-selected-cat\'))"><select>')
    selector.append '<option disabled selected>' + @categories['titles'][categoryId] + '</option>'
    for optionId, optionName of @categories['list'][categoryId]
      selector.append '<option data-main-cat="' + mainCategoryId + '" data-selected-cat="' + optionId + '">' + optionName + '</option>'
    wrapper = $('#' + parrentId)
    if wrapper.length is 0
      wrapper = $('<div id="' + parrentId + '"></div>')
      $('#selectors-wrapper').append wrapper
    wrapper.append selector
    return

  getParentId: (categoryId) ->
    mainCatEnd = categoryId.lastIndexOf '_'
    parrentId = if mainCatEnd isnt -1 then 'wrapper-' + categoryId.substr 0, mainCatEnd else j3r.MarkersController.wrapper
    parrentId

  setMarkers: () ->
    newMarkers = {}
    # TODO optimalizovat
    for markerId, markerInfo of @markersList
      newMarkers[markerId] = yes
      for mainCategoryId, categoryId  of @selected
        if markerInfo['cat'].indexOf(categoryId) is -1
          delete newMarkers[markerId]
          break
    @markers.setMarkers newMarkers
    return

j3r.MarkersController.create = (markers) ->
  return new j3r.MarkersController j3r.conf.markers, markers,
    {'list':j3r.conf['categories']['list'], 'titles':j3r.conf['categories']['titles']},
    j3r.conf['categories']['init']
