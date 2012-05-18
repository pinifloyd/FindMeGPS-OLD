$(document).ready ->
  GoogleMap =
    map:             null
    mapContainer:    document.getElementById('google-map')
    searchContainer: document.getElementById('search')
    kmlLayer:        null

    defaultOptions:
      zoom:             19
      center:           new google.maps.LatLng(34.134088898889, -118.32178889889)
      mapTypeId:        google.maps.MapTypeId.SATELLITE
      disableDefaultUI: true
      mapTypeControl:   true
      zoomControl:      true
      scaleControl:     true

    setMapWithDefaultOptions: ->
      GoogleMap.map = new google.maps.Map(
        GoogleMap.mapContainer,
        GoogleMap.defaultOptions
      )

    detectUserLocationByService: (service) ->
      service.getCurrentPosition(
        (position) ->
          mapCenter = new google.maps.LatLng(
            position.latitude  || position.coords.latitude,
            position.longitude || position.coords.longitude
          )

          GoogleMap.map.setCenter(mapCenter)
        ->
          alert('Geolocation service failed or You denied access to it.')
      )

    detectUserLocation: ->
      if (navigator.geolocation)
        GoogleMap.detectUserLocationByService(
          navigator.geolocation
        )
      else
        alert('Your browser does not support geolocation.')

    autocompleteSearchPlaces: ->
      autocomplete = new google.maps.places.Autocomplete(
        GoogleMap.searchContainer, { types: ['geocode'] }
      )
      marker = new google.maps.Marker({ map: GoogleMap.map })

      google.maps.event.addListener(autocomplete, 'place_changed', ->
        place = autocomplete.getPlace()
        geometry = place.geometry
        zoom = GoogleMap.defaultOptions.zoom

        if (geometry.viewport)
          GoogleMap.map.fitBounds(geometry.viewport)
        else
          GoogleMap.map.setCenter(geometry.location)

        GoogleMap.map.setZoom(zoom)
        marker.setPosition(geometry.location)
      )

    bindGenerateKmlClick: ->
      $('a.js-generate-kml').click (e) ->
        e.preventDefault()

        checkboxes = $(':checkbox:checked[id=device_ids_]')

        GoogleMap.sendDataForGenerateKml(e.target.href, checkboxes)

    loadKmlIfCheckboxChecked: ->
      checkboxes = $(':checkbox:checked[id=device_ids_]')

      if (checkboxes.length == 0)
        return false

      url = $('a.js-generate-kml').attr('href')
      GoogleMap.sendDataForGenerateKml(url, checkboxes)

    setKmlLayerToMap: (showKmlOnMap) ->
      if (GoogleMap.kmlLayer)
        GoogleMap.kmlLayer.setMap(null)

      if (showKmlOnMap)
        pathToKmlLayer = 'http://dl.dropbox.com/u/21100318/FIndMeGPS/find_me_gps.kml?' + new Date().getTime()
        GoogleMap.kmlLayer = new google.maps.KmlLayer(pathToKmlLayer)
        GoogleMap.kmlLayer.setMap(GoogleMap.map)

    sendDataForGenerateKml: (url, data) ->
      $.ajax({
        url:  url,
        type: 'POST',
        data: data.serialize(),
        complete: (response) ->
          showKmlOnMap = $.parseJSON(response.responseText).show_kml_on_map
          GoogleMap.setKmlLayerToMap(showKmlOnMap)
      })

    initialize: ->
      GoogleMap.setMapWithDefaultOptions()
      GoogleMap.detectUserLocation()
      GoogleMap.autocompleteSearchPlaces()
      GoogleMap.bindGenerateKmlClick()
      GoogleMap.loadKmlIfCheckboxChecked()

  GoogleMap.initialize()
