j3r.conf =
  'settings':
    'catPrefix': 'cat'
    'catFullPrefix': 'cat-'
    'subCatDelimiter': '_'
    'pathToInfoWindowPics': 'pics/markers_gal/'
    'startSearchFromMinCharCount': 3
    'mapStartPos': [50.022023, 15.830912]
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
    'vankovka':
      cat:'cat-a_a'
      title:'ESPRIT Galerie Vaňkovka'
      pos:[49.187784, 16.614640]
      info:'Telefon: 543 255 959'
      adress:'Ve Vaňkovce 1, Brno, 60200'
    'chodov':
      cat:'cat-a_a'
      title:'ESPRIT Centrum Chodov'
      pos:[50.032066, 14.490989]
      info:'Telefon: 272 075 251'
      adress:'Roztylská 2321/19, Praha, 14800'
    'letnany':
      cat:'cat-a_a'
      title:'ESPRIT OC Letňany'
      pos:[50.135051, 14.501267]
      info:'Telefon: 286 581 139'
      adress:'Veselská 663, Praha, 19900'
    'flora':
      cat:'cat-a_a'
      title:'ESPRIT Palác Flóra'
      pos:[50.078258, 14.461295]
      info:'Telefon: 271 770 220'
      adress:'Vinohradská 151/2828, Praha, 13000'
    'palladium':
      cat:'cat-a_acat-a_a_acat-a_a_bcat-a_a_ccat-a_a_dcat-a_a_ecat-a_a_f'
      title:'ESPRIT Palladium Praha'
      pos:[50.089002, 14.429167]
      info:'Telefon: 222 319 090'
      adress:'Náměstí Republiky 1,	Praha, 11000'
    'pankrac':
      cat:'cat-a_a'
      title:'ESPRIT Arkády Pankrác'
      pos:[50.051155, 14.439096]
      info:'Telefon: 261 210 332'
      adress:'Na Pankráci 86, Praha, 14000'
    'olympiabrno':
      cat:'cat-a_a'
      title:'ESPRIT Olympia Brno'
      pos:[49.138128, 16.633018]
      info:'Telefon: 547 214 549'
      adress:'U Dálnice 777, Brno, 66442'
    'forumliberec':
      cat:'cat-a_a'
      title:'ESPRIT Forum Liberec'
      pos:[50.765611, 15.056264]
      info:'Telefon: 485 101 667'
      adress:'Soukenné náměstí 2a/669, Liberec, 46080'
    'harfa' :  
      cat:'cat-a_acat-a_a_acat-a_a_bcat-a_a_ccat-a_a_dcat-a_a_ecat-a_a_fcat-a_a_gcat-a_a_hcat-a_a_i'
      title:'ESPRIT Galerie Harfa',
      pos:[50.104300, 14.490900]
      info:'Telefon: 234 132 139'
      adress:'Českomoravská 2420/15a, Praha, 19000'
    'avionostrava':
      cat:'cat-a_a'
      title:'ESPRIT Avion Shopping Park Ostrava'
      pos:[49.802020, 18.227965]
      info:'Telefon: 596 753 830'
      adress:'Rudná 114, Ostrava, 70030'
    'olympiaplzen':
      cat:'cat-a_a'
      title:'ESPRIT Olympia Plzeň'
      pos:[49.701051, 13.425838]
      info:'Telefon: 377 459 020'
      adress:'Písecká 972/1, Plzeň, 32600'
    'fashionarena':
      cat:'cat-a_b'
      title:'ESPRIT Outlet Fashion Arena Praha'
      pos:[50.104300, 14.490900]
      info:'Telefon 234 657 333'
      adress:'Prumyslová ul., Praha, 10800'
    'karolinaostrava':
      cat:'cat-a_a'
      title:'ESPRIT Karolína Ostrava'
      pos:[49.831073, 18.286006]
      info:'Telefon: 596 113 000'
      adress:'Jantarová 3344/4, Ostrava, 70030'
    'cernymost':
      cat:'cat-a_a'
      title:'ESPRIT Černý Most'
      pos:[50.106125, 14.586441]
      info:'Telefon: 281 912 465'
      adress:'Chlumecká 712/8, Praha, 19819'
    # 'vaclav':
    #   cat:'cat-a_b_acat-b_b'
    #   title:'Vaclav'
    #   pos:[50.080195, 14.429101]
    #   info:'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
    #   gal:['1_sm.jpg','2_sm.jpg','3_sm.jpg']
  # generated via j3r.Search.callGenerateListOfMarkers() 
  # generate manually after each markers or categories change!
  'searchList':
    'vankovka':'obchodespritgalerievaňkovkatelefon:543255959vevaňkovce1,brno,60200'
    'chodov':'obchodespritcentrumchodovtelefon:272075251roztylská2321/19,praha,14800'
    'letnany':'obchodespritocletňanytelefon:286581139veselská663,praha,19900'
    'flora':'obchodespritpalácflóratelefon:271770220vinohradská151/2828,praha,13000'
    'palladium':'obchodwcasualmcasualwedcmedcwcollectionmcollectionespritpalladiumprahatelefon:222319090náměstírepubliky1,praha,11000'
    'pankrac':'obchodespritarkádypankráctelefon:261210332napankráci86,praha,14000'
    'olympiabrno':'obchodespritolympiabrnotelefon:547214549událnice777,brno,66442'
    'forumliberec':'obchodespritforumliberectelefon:485101667soukennénáměstí2a/669,liberec,46080'
    'harfa':'obchodwcasualmcasualwedcmedcwcollectionmcollectionde.corpyoungminiesespritgalerieharfatelefon:234132139českomoravská2420/15a,praha,19000'
    'avionostrava':'obchodespritavionshoppingparkostravatelefon:596753830rudná114,ostrava,70030'
    'olympiaplzen':'obchodespritolympiaplzeňtelefon:377459020písecká972/1,plzeň,32600'
    'fashionarena':'outletespritoutletfashionarenaprahatelefon234657333prumyslovául.,praha,10800'
    'karolinaostrava':'obchodespritkarolínaostravatelefon:596113000jantarová3344/4,ostrava,70030'
    'cernymost':'obchodespritčernýmosttelefon:281912465chlumecká712/8,praha,19819'      