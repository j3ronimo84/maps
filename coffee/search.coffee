class j3r.Search
  @startSearchFrom = j3r.conf['settings']['startSearchFromMinCharCount']
  constructor: (@markersInfo, @searchList) ->
    @wrapper = $('#search-results')
    @actualList = {}
    @actualLetters = ''

  search: (key) =>
    # empty key or del to below startSearchAt => delete all
    if key is '' or ( key.length is (j3r.Search.startSearchFrom - 1) and @actualLetters.length is j3r.Search.startSearchFrom)
      @actualLetters = ''
      @actualList = {}
      @renderResults()
    # other situations 
    else  
      key = j3r.helpers.getTransformedText key, no
      # delete one from selections or adding
      if key < @actualLetters.length or key.length >= j3r.Search.startSearchFrom
        # continue searching
        # if (@actualLetters isnt '' and key.indexOf(@actualLetters) is 0 ) and key.length > @actualLetters.length
        if key.length > @actualLetters.length and !jQuery.isEmptyObject @actualList
          for keyAct, item of @actualList
            # delete if not in list
            delete @actualList[keyAct] if @searchList[keyAct].indexOf(key) is -1
        # start searching 
        else
          @actualList = {}
          for itemKey, searchIn of @searchList
            @actualList[itemKey] = @getItem(itemKey) if searchIn.indexOf(key) isnt -1
        @actualLetters = key    
        @renderResults()  
    return      

  renderResults: ->
    @wrapper.empty()
    for itemKey, item of @actualList
      @wrapper.append item
    # @wrapper.children('.search-result-item').click (ev) ->
    #   alert $(ev.target).attr 'data-key'
    return  

  getItem: (key) ->
    itemInfo = @markersInfo[key]
    itemHtml = '<a onclick="app.showInfoWindow(\'' + key + '\')"><div class="search-result-item"><strong>
      ' + itemInfo['title'] + '</strong>(' + j3r.helpers.getCategoryInfoToString(itemInfo['cat'], 'cat-a') + ')</div></a>'       
    

  generateListOfMarkers: (markers) ->
    for markerId, markerInfo of markers
      text = markerInfo['title'] + j3r.helpers.getCategoryInfoToString( markerInfo['cat'], 'cat-a', '') + markerInfo['info']
      text = j3r.helpers.getTransformedText text, no
      console.log "'" + markerId + "':'" + text + "'"
    return

j3r.Search.create = ->
  new j3r.Search j3r.conf['markers'], j3r.conf['searchList']

j3r.Search.callGenerateListOfMarkers = ->
  search = new j3r.Search {}
  search.generateListOfMarkers j3r.conf['markers'], j3r.conf['categories']['list']
  return 