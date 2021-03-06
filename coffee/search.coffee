class j3r.Search
  @startSearchFrom = j3r.conf['settings']['startSearchFromMinCharCount']
  constructor: (@markersInfo, @searchList) ->
    @wrapper = $(j3r.conf['settings']['el_searchResults'])
    @actualList = {}
    @actualLetters = ''

  search: (key) =>
    # empty key or del to below startSearchAt => delete all
    if key is '' or ( key.length is (j3r.Search.startSearchFrom - 1) and @actualLetters.length is j3r.Search.startSearchFrom)
      @actualLetters = ''
      @actualList = {}
      @renderResults()
    # other cases 
    else
      # key = j3r.helpers.getTransformedText key, no
      # delete one from selections or adding
      if key.length < @actualLetters.length or key.length >= j3r.Search.startSearchFrom
        # search by more words
        splKeys = key.split ' '
        splKeys.pop() if splKeys[splKeys.length-1] is ''
        # continue searching
        if key.length > @actualLetters.length and !jQuery.isEmptyObject @actualList
          for keyAct, item of @actualList
            # delete if not in list
            for splKey in splKeys
              if @searchList[keyAct].indexOf(splKey) is -1
                delete @actualList[keyAct]
                break
        # start searching 
        else
          @actualList = {}
          # each item of list
          for itemKey, searchIn of @searchList
            insert = yes
            for splKey in splKeys
              if searchIn.indexOf(splKey) is -1
                insert = no
                break
            @actualList[itemKey] = @getItem(itemKey) if insert
        @actualLetters = key    
        @renderResults()  
    return      

  renderResults: ->
    @wrapper.empty()
    if $.isEmptyObject @actualList then @wrapper.hide() else @wrapper.show()
    for itemKey, item of @actualList
      @wrapper.append item
    return  

  getItem: (key) ->
    itemInfo = @markersInfo[key]
    itemHtml = '<a onclick="app.jumpToMarker(\'' + key + '\')"><div class="' + j3r.conf['settings']['el_searchResultItem'] + '"><strong>
      ' + itemInfo['title'] + '</strong> (' + j3r.helpers.getCategoryInfo( key, 1) + ')</div></a>'       
    

  generateListOfMarkers: (markers) ->
    prohibitedKeys = {'cat':yes, 'pos':yes}
    for markerId, markerInfo of markers
      text = j3r.helpers.getAllCategoriesInfo(markerId).join('')
      for key, info of markerInfo
        text += info if !prohibitedKeys[key]?
      text = j3r.helpers.getTransformedText text, no
      console.log "'" + markerId + "':'" + text + "'"
    return

j3r.Search.create = ->
  new j3r.Search j3r.conf['markers'], j3r.conf['searchList']

j3r.Search.callGenerateListOfMarkers = ->
  search = new j3r.Search {}
  search.generateListOfMarkers j3r.conf['markers'], j3r.conf['categories']['list']
  return 