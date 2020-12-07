import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class RoutesPage extends StatefulWidget {
  RoutesPage({Key key}) : super(key: key);

  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<RoutesPage> {
  GoogleMapController _controller;
  String googleAPIKey = "AIzaSyDPDpDWgetjL3tMcDVpEhSA47HtXBFdwdw";
  List<Marker> myMarker = [];
  //Geting the current location:
  geo.Position _currentPosition;
  //setting the draw route.
  //Polyline
  PolylinePoints polylinePoints;
  List<LatLng> polylineCoordinates = [];
  Map<PolylineId, Polyline> polylines = {};
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));

  Future<void> retrieveForm() async {
    final geo.Position currentPostition =
        await geo.Geolocator.getCurrentPosition(
            desiredAccuracy: geo.LocationAccuracy.high);

    setState(() {
      _currentPosition = currentPostition;
      _initialLocation = CameraPosition(
          target:
              LatLng(_currentPosition.latitude, _currentPosition.longitude));
    });
  }

  @override
  void initState() {
    super.initState();
    retrieveForm();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialLocation,
        markers: Set.from(myMarker),
        onTap: _handleTap,
        polylines: Set<Polyline>.of(polylines.values),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;

          setState(() {
            myMarker = [];
            myMarker.add(
              Marker(
                markerId: MarkerId("0"),
                position: LatLng(_currentPosition.latitude + 0.005,
                    _currentPosition.longitude),
                infoWindow: InfoWindow(
                    title: "Starting Point", snippet: "An good place"),
              ),
            );
            myMarker.add(
              Marker(
                markerId: MarkerId("0"),
                position: LatLng(
                    _currentPosition.latitude, _currentPosition.longitude),
              ),
            );
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_searching),
        onPressed: () {
          _getCurrentLocation();
        },
      ),
    );
  }

  _handleTap(LatLng tappedPoint) {
    print(tappedPoint);
    setState(() {
      myMarker = []; //this make the only one marker on the map
      myMarker.add(
        Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
          infoWindow: InfoWindow(
              title: "Ending Point", snippet: "Here is your end point"),
        ),
      );
      myMarker.add(Marker(
        markerId: MarkerId("0"),
        position: LatLng(_currentPosition.latitude, _currentPosition.longitude),
        infoWindow:
            InfoWindow(title: "Starting Point", snippet: "An good place"),
      ));
      _createPolylines(_currentPosition, tappedPoint);
    });
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

  _createPolylines(geo.Position start, LatLng destination) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPIKey,
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.transit,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
      width: 5,
    );
    polylines[id] = polyline;
  }
}
