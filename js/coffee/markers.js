// Generated by CoffeeScript 1.6.3
j3r.Markers = (function() {
  function Markers(map, markers) {
    this.map = map;
    this.markers = markers != null ? markers : {};
  }

  Markers.prototype.setMarkers = function(newMarkers) {
    var marker, markerId, _ref;
    _ref = this.markers;
    for (markerId in _ref) {
      marker = _ref[markerId];
      if (!newMarkers[markerId]) {
        this.removeMarker(markerId);
      }
    }
    for (markerId in newMarkers) {
      marker = newMarkers[markerId];
      if (this.markers[markerId] == null) {
        this.addMarker(markerId, marker);
      }
    }
  };

  Markers.prototype.addMarker = function(markerId, markerInfo) {
    var marker;
    marker = new google.maps.Marker({
      position: new google.maps.LatLng(markerInfo['pos'][0], markerInfo['pos'][1]),
      map: this.map,
      title: markerInfo['title']
    });
    this.markers[markerId] = marker;
  };

  Markers.prototype.removeMarker = function(markerId) {
    this.markers[markerId].setMap(null);
    delete this.markers[markerId];
  };

  Markers.prototype.addMarkerByPos = function(pos) {
    var marker;
    console.log(pos);
    return marker = new google.maps.Marker({
      position: pos,
      map: this.map
    });
  };

  return Markers;

})();

j3r.Markers.create = function(map) {
  var markers;
  markers = new j3r.Markers(map);
  return markers;
};