import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:math' show cos, sqrt, asin;

class RunningMap extends StatefulWidget {
  @override
  _RunningMapState createState() => _RunningMapState();
}

class _RunningMapState extends State<RunningMap> {
  GoogleMapController _controller;
  Set<Marker> _markers = HashSet<Marker>();
  geo.Position _currentPosition;

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(22.283387, 114.136001),
    zoom: 18,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: initialLocation,
          //marker
          //circles
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
            setState(() {
              _markers.add(Marker(
                markerId: MarkerId("0"),
                position: LatLng(
                    _currentPosition.latitude, _currentPosition.longitude),
                infoWindow: InfoWindow(
                  title: "HKU",
                  snippet: "The greatest university",
                ),
              ));
            });
          },
          markers: _markers,
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.location_searching),
            onPressed: () {
              _getCurrentLocation();
              _controller
                  .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                target: LatLng(
                    _currentPosition.latitude, _currentPosition.longitude),
                zoom: 14,
              )));
            }));
  }

  _getCurrentLocation() async {
    geo.Position position = await geo.Geolocator.getCurrentPosition(
        desiredAccuracy: geo.LocationAccuracy.high);
    _currentPosition = position;

    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
      zoom: 14,
    )));
  }
}
