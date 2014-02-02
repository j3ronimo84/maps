class j3r.MarkersController
  @wrapper = 'selectors-wrapper'
  constructor: (@markersList, @markers, @categories, @selected) ->

  init: ->
    for mainCategoryId, selectedCategoryId of @selected
      @renderSelector mainCategoryId, selectedCategoryId
    return  

  setSelections: (mainCategory, selection) ->
    # empty selectors
    wrapper = $('#' + @getParentId selection)
    wrapper.children('.selectors-wrapper').empty() if wrapper.children('.selectors-wrapper').length > 0
    # render new selectors
    @renderSelector mainCategory, selection if @categories['list'][selection]? 
    # add/remove markers
    @selected[mainCategory] = selection
    @setMarkers()
    return

  renderSelector: (mainCategoryId, categoryId) ->
    selector = $('<select id="' + categoryId + '" class="chosen-select" 
      onChange="app.select($(\'#' + categoryId + ' option:selected\').attr(\'data-main-cat\'),$(\'#' + categoryId + ' option:selected\').attr(\'data-selected-cat\'))" 
      data-placeholder="' + @categories['titles'][categoryId] + '" style="width:200px;"><select>')
    selector.append '<option></option>'
    for optionId, optionName of @categories['list'][categoryId]
      selector.append '<option data-main-cat="' + mainCategoryId + '" data-selected-cat="' + optionId + '">' + optionName + '</option>'
    wrapper = $('#wrapper-' + categoryId)
    if wrapper.length is 0
      wrapper = $('<div class="selectors-wrapper" id="wrapper-' + categoryId + '"></div>')
      $('#' + @getParentId categoryId).append wrapper
    wrapper.append selector
    # initiate chosen
    wrapper.children('.chosen-select').chosen()
    return

  getParentId: (categoryId) ->
    mainCatEnd = categoryId.lastIndexOf '_'
    parrentId = if mainCatEnd isnt -1 then 'wrapper-' + categoryId.substr 0, mainCatEnd else 'selectors-wrapper'
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
