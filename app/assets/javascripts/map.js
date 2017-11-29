 handler = Gmaps.build('Google');
 handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
 markers = handler.addMarkers(place);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    handler.getMap().setZoom(16);
});
