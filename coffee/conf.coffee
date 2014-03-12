j3r.conf =
  'settings':
    'catPrefix': 'cat'
    'catFullPrefix': 'cat-'
    'subCatDelimiter': '_'
    'pathToInfoWindowPics': 'pics/markers_gal/'
    'startSearchFromMinCharCount': 3
    'mapStartPos': [50.132023,15.366912]
    'mapZoom': 8
    'mapZoomOnMarkerDetail': 14
    'el_markerInfoPlaceholder': '#marker-info-placeholder'
    'el_markerInfoPlaceholderColorbox': '#marker-info-placeholder a.colorboxGallery' 
    'el_searchInput': '#search-input'
    'el_mapCanvas': 'map-canvas'
    'el_infoWindowGalWrapper' : '.info-window-wrapper-gal'
    'el_selectorsWrapper': 'selectors-wrapper'
    'el_searchResults': '#search-results'
    'el_searchResultItem': 'search-result-item'
  'categories':
    'init':
      'cat-a':'cat-a'
      # 'cat-b':'cat-b'
    'list':
      'cat-a':
        'cat-a_a':'Obchod'
        'cat-a_b':'Outlet'
      'cat-a_a':
        'cat-a_a_a':'W Casual'
        'cat-a_a_b':'M Casual'
        'cat-a_a_c':'W EDC'
        'cat-a_a_d':'M EDC'
        'cat-a_a_e':'W Collection'
        'cat-a_a_f':'M Collection'
        'cat-a_a_g':'de. Corp'
        'cat-a_a_h':'Young'
        'cat-a_a_i':'Minies'
    'titles':
      'cat-a':'Typ prodejny'
      'cat-a_a':'Nabídka obchodu'
      # 'cat-a_b':'mesto'
      # 'cat-b':'typ mista'
  'markers':
    'paladium':
      cat:'cat-a_acat-a_a_acat-a_a_bcat-a_a_ccat-a_a_dcat-a_a_ecat-a_a_f'
      title:'Palladium Praha'
      pos:[50.089709,14.428457]
      info:'Telefon: 225 771 525'
      adress:'Praha, neco'
    'harfa' :  
      cat:'cat-a_acat-a_a_acat-a_a_bcat-a_a_ccat-a_a_dcat-a_a_ecat-a_a_fcat-a_a_gcat-a_a_hcat-a_a_i'
      title:'Harfa Praha',
      pos:[50.103942, 14.490513]
      info:'Telefon: 234 132 139'
      adress:'Praha, neco'
    'liberec':
      cat:'cat-a_acat-a_a_acat-a_a_bcat-a_a_ccat-a_a_dcat-a_a_f'
      title:'Liberec'
      pos:[50.767951, 15.059456]
      info:'Telefon: 485 101 667'
      adress:'Liberec pitomec'
    'fashionarena':
      cat:'cat-a_b'
      title:'Fashion Arena Praha'
      pos:[50.077634,14.53952]
      info:'Telefon 234 657 333'
      adress:'Praha, neco'
    # 'vaclav':
    #   cat:'cat-a_b_acat-b_b'
    #   title:'Vaclav'
    #   pos:[50.080195, 14.429101]
    #   info:'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
    #   gal:['1_sm.jpg','2_sm.jpg','3_sm.jpg']
  # generated via j3r.Search.callGenerateListOfMarkers() 
  # generate manually after each markers or categories change!
  'searchList':
    'paladium':'obchodwcasualmcasualwedcmedcwcollectionmcollectionpalladiumprahatelefon:225771525praha,neco'
    'harfa':'obchodwcasualmcasualwedcmedcwcollectionmcollectionde.corpyoungminiesharfaprahatelefon:234132139praha,neco'
    'liberec':'obchodwcasualmcasualwedcmedcmcollectionliberectelefon:485101667liberecpitomec'
    'fashionarena':'outletfashionarenaprahatelefon234657333praha,neco'  