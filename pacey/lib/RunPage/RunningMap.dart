import 'dart:async';
import 'dart:collection';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RunningMap extends StatefulWidget {
  @override
  _RunningMapState createState() => _RunningMapState();
}

class _RunningMapState extends State<RunningMap> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = HashSet<Marker>();
  Location _locationTracker = Location();
  StreamSubscription _locationSubscription;

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
          _controller.complete(controller);
          setState(() {
            _markers.add(Marker(
              markerId: MarkerId("0"),
              position: LatLng(22.283387, 114.136001),
              infoWindow: InfoWindow(
                title: "HKU",
                snippet: "The greatest university",
              ),
            ));
          });
        },
        markers: _markers,
      ),
<<<<<<< Updated upstream
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
=======
      floatingActionButton: FloatingActionButton(
        onPressed: _goToTheLake,
        child: Icon(Icons.location_searching),
      ),
>>>>>>> Stashed changes
    );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
