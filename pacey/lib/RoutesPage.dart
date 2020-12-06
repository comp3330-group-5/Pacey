import 'dart:async';
import 'dart:collection';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class RoutesPage extends StatefulWidget {
  RoutesPage({Key key}) : super(key: key);

  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<RoutesPage> {
  Completer<GoogleMapController> _controller = Completer();
  Location _locationTracker = Location();
  List<Marker> myMarker = [];
  LatLng ini_postion = LatLng(37.42796133580664, -122.085749655962);
  static final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialPosition,
        markers: Set.from(myMarker),
        onTap: _handleTap,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);

          setState(() {
            myMarker.add(
              Marker(
                markerId: MarkerId("0"),
                position: ini_postion,
                infoWindow: InfoWindow(
                    title: "Starting Point", snippet: "An good place"),
              ),
            );
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_searching),
        onPressed: () {},
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
        position: ini_postion,
        infoWindow:
            InfoWindow(title: "Starting Point", snippet: "An good place"),
      ));
    });
  }

  void updateMarker(LocationData newLocalData /*,marker imagedata)*/) {
    LatLng latLng = LatLng(newLocalData.latitude, newLocalData.longitude);
    //this.setstate reset the the marker location
  }

  void getCurrentLocation() async {
    //get the marker
    //var location = await _locationTracker.getlocation();
    //updateMarker
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
