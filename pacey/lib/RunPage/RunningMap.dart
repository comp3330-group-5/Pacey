import 'dart:async';
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
  String googleAPIKey = "AIzaSyDPDpDWgetjL3tMcDVpEhSA47HtXBFdwdw";
  List<Marker> myMarker = [];
  double totalDistance = 0.0;
  //Geting the current location:
  geo.Position _currentPosition;
  LatLng _dest_Position;
  //setting the draw route.
  //Polyline
  PolylinePoints polylinePoints = PolylinePoints();
  Set<Polyline> _polylines = {};
  List<LatLng> polylineCoordinates = [];

  static final CameraPosition _initialLocation = CameraPosition(
    target: LatLng(22.2688, 114.1299),
    zoom: 14,
  );
  //distance:
  double distanceInMeters;

  Future<void> retrieveForm() async {
    final geo.Position currentPostition =
        await geo.Geolocator.getCurrentPosition(
            desiredAccuracy: geo.LocationAccuracy.high);
    final LatLng destPosition =
        LatLng(currentPostition.latitude + 0.005, currentPostition.longitude);

    setState(() {
      _currentPosition = currentPostition;
      this._dest_Position = destPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _initialLocation,
          markers: Set.from(myMarker),
          onTap: _handleTap,
          polylines: _polylines,
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
            _controller
                .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target:
                  LatLng(_currentPosition.latitude, _currentPosition.longitude),
              zoom: 14,
            )));
            setMapPins();
            setPolylines();
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_searching),
        onPressed: () {
          _getCurrentLocation();
          setMapPins();
          setPolylines();
          _controller
              .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target:
                LatLng(_currentPosition.latitude, _currentPosition.longitude),
            zoom: 14,
          )));
          setMapPins();
          setPolylines();
          //polylines.remove('poly');
        },
      ),
    );
  }

  _handleTap(LatLng tappedPoint) {
    print("The typed point is:");
    print(tappedPoint);

    setState(() {
      _setdistance(
          LatLng(_currentPosition.latitude, _currentPosition.longitude),
          tappedPoint);
      _dest_Position = tappedPoint;
      // source pin
      myMarker = []; //this make the only one marker on the map
      myMarker.add(
        Marker(
          markerId: MarkerId("1"),
          position: LatLng(tappedPoint.latitude, tappedPoint.longitude),
          infoWindow: InfoWindow(
              title: "You have to run",
              snippet: this.distanceInMeters.toStringAsFixed(2) + " m"),
        ),
      );
      myMarker.add(Marker(
        markerId: MarkerId("0"),
        position: LatLng(_currentPosition.latitude, _currentPosition.longitude),
        infoWindow: InfoWindow(
            title: "You have to run",
            snippet: this.distanceInMeters.toStringAsFixed(2) + " m"),
      ));
    });

    polylineCoordinates = [];
    _polylines = {};
    setPolylines();
  }

  _getCurrentLocation() async {
    geo.Position position = await geo.Geolocator.getCurrentPosition(
        desiredAccuracy: geo.LocationAccuracy.high);
    _currentPosition = position;
    print('CURRENT POS: $_currentPosition');

    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
      zoom: 14,
    )));
  }

  //polyLine related function:

  _setdistance(LatLng start, LatLng end) async {
    double displacement = geo.Geolocator.distanceBetween(
      start.latitude,
      start.longitude,
      end.latitude,
      end.longitude,
    );
    setState(() {
      distanceInMeters = displacement;
    });
  }

  void setMapPins() {
    setState(() {
      // source pin
      myMarker = []; //this make the only one marker on the map
      myMarker.add(
        Marker(
          markerId: MarkerId("0"),
          position:
              LatLng(_currentPosition.latitude, _currentPosition.longitude),
          infoWindow: InfoWindow(
              title: "You have to run",
              snippet: "The distance is " + this.distanceInMeters.toString()),
        ),
      );
      myMarker.add(Marker(
        markerId: MarkerId("1"),
        position: LatLng(
            _currentPosition.latitude + 0.005, _currentPosition.longitude),
        infoWindow: InfoWindow(
            title: "You have to run",
            snippet: "The distance is " + this.distanceInMeters.toString()),
      ));
    });
  }

  setPolylines() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPIKey,
        PointLatLng(_currentPosition.latitude, _currentPosition.longitude),
        PointLatLng(_dest_Position.latitude, _dest_Position.longitude));

    if (result.points.isNotEmpty) {
      // loop through all PointLatLng points and convert them
      // to a list of LatLng, required by the Polyline
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    setState(() {
      // create a Polyline instance
      // with an id, an RGB color and the list of LatLng pairs
      Polyline polyline = Polyline(
          polylineId: PolylineId("poly"),
          color: Color.fromARGB(255, 40, 122, 198),
          points: polylineCoordinates);

      // add the constructed polyline as a set of points
      // to the polyline set, which will eventually
      // end up showing up on the map
      _polylines.add(polyline);
    });
  }
}
