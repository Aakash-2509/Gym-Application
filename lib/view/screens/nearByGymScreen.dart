import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  final String apiKey = 'YOUR_API_KEY'; // Replace with your actual API key
  List<Marker> _markers = [];
  double? currentLat;
  double? currentLng;
  String currentAddress = '';

  // Example list of locations
  final List<LatLng> locations = [
    const LatLng(18.56316366262959, 73.8020142081109),
    const LatLng(18.56369253559379, 73.8025399210572),
    const LatLng(18.56451635367595, 73.80179963139813),
    const LatLng(18.565180158414464, 73.80218040564364),
    const LatLng(18.56596977704468, 73.80400429573469),
  ];

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
    _addLocationMarkers(); // Add markers for the list of locations
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    GetLocation();
  }

  Future<void> GetLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      log("Location Denied");
      LocationPermission ask = await Geolocator.requestPermission();
      if (ask == LocationPermission.denied ||
          ask == LocationPermission.deniedForever) {
        log("Location still denied after request");
        return;
      }
    }

    try {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      log("Latitude of current=${currentPosition.latitude.toString()}");
      log("Longitude of current=${currentPosition.longitude.toString()}");

      List<Placemark> placemarks = await placemarkFromCoordinates(
          currentPosition.latitude, currentPosition.longitude);

      Placemark place = placemarks[0];

      setState(() {
        currentLat = currentPosition.latitude;
        currentLng = currentPosition.longitude;
        currentAddress =
            "${place.subLocality}, ${place.locality}, ${place.country}";
        // _addCurrentLocationMarker(currentLat!, currentLng!);
        mapController.animateCamera(
          CameraUpdate.newLatLng(LatLng(currentLat!, currentLng!)),
        );
      });

      log("$currentAddress..............");
    } catch (e) {
      log("Error getting location: $e");
    }
  }

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      log('Location permission granted');
      GetLocation();
    } else if (status.isDenied) {
      log('Location permission denied');
    } else if (status.isPermanentlyDenied) {
      log('Location permission permanently denied');
      await openAppSettings();
    }
  }

  // void _addCurrentLocationMarker(double lat, double lng) {
  //   setState(() {
  //     _markers.add(
  //       Marker(
  //         markerId: const MarkerId('current_location'),
  //         position: LatLng(lat, lng),
  //         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  //         infoWindow: const InfoWindow(
  //           title: 'Current Location',
  //           snippet: 'This is your current location',
  //         ),
  //       ),
  //     );
  //   });
  // }

  void _addLocationMarkers() {
    setState(() {
      for (var location in locations) {
        _markers.add(
          Marker(
            markerId: MarkerId(location.toString()),
            position: location,
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            infoWindow: InfoWindow(
              title: 'Location',
              snippet: 'Lat: ${location.latitude}, Lng: ${location.longitude}',
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps Screen'),
        backgroundColor: Colors.green[700],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Current Location: (${currentLat?.toStringAsFixed(6)}, ${currentLng?.toStringAsFixed(6)})',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: LatLng(18.562412037848983,
                    73.80613489081846), // Set to the first location in the list
                zoom: 16.0,
              ),
              markers: Set<Marker>.of(_markers),
              myLocationEnabled:
                  true, // Show the "my location" button and blue dot
              myLocationButtonEnabled:
                  true, // Show the button to center on "my location"
              circles: <Circle>{
                Circle(
                  circleId: const CircleId('current_location_circle'),
                  center: LatLng(currentLat ?? 0.0, currentLng ?? 0.0),
                  radius: 10, // Radius of the circle in meters
                  fillColor: Colors.blue.withOpacity(0.3),
                  strokeWidth: 0,
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
