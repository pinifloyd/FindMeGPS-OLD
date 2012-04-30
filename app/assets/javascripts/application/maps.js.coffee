$(document).ready ->
  GoogleMap =
    map:             null
    mapContainer:    document.getElementById('google-map')
    searchContainer: document.getElementById('search')

    defaultOptions:
      zoom:      19
      center:    new google.maps.LatLng(34.134088898889, -118.32178889889)
      mapTypeId: google.maps.MapTypeId.SATELLITE

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

    initialize: ->
      GoogleMap.setMapWithDefaultOptions()
      GoogleMap.detectUserLocation()
      GoogleMap.autocompleteSearchPlaces()

  # TODO: replace
  # $(window).resize ->
  #   $('#google-map').css('height', $(this).height() - 100)
  #   $('div.table-devices').css('height', $(this).height() - 140)

  # $('.js-page-content').css({ height: $(window).height() - 100 - 91 - 40 })

  excessPx =  parseInt( $('body').css('padding-top') )
  excessPx += parseInt( $('body').css('padding-bottom') )
  excessPx += $('div.navbar').height()
  excessPx += $('div.js-header-content').height()

  $('div.js-page-content').css({ height: $(window).height() - excessPx })

  GoogleMap.initialize()
