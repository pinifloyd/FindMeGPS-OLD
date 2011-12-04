$(document).ready ->
  GoogleMap =
    map: null
    mapContainer: document.getElementById('google-map')

    defaultOptions:
      zoom: 19
      center: new google.maps.LatLng(34.134088898889, -118.32178889889)
      mapTypeId: google.maps.MapTypeId.SATELLITE

    setMapWithDefaultOptions: ->
      GoogleMap.map = new google.maps.Map(
        GoogleMap.mapContainer,
        GoogleMap.defaultOptions
      )

    initialize: ->
      GoogleMap.setMapWithDefaultOptions()

  GoogleMap.initialize()
