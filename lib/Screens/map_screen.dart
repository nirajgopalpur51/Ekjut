import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:login_backend/Screens/home_screen.dart';
import 'package:login_backend/Screens/person_info.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

import 'Ambulance.dart';
import 'LogIn.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapSample> {
  BitmapDescriptor markerIcon1 = BitmapDescriptor.defaultMarker;
  String _startAddress = '';
  final startAddressController = TextEditingController();
  late Position _currentPosition;
  String _currentAddress = '';
  Set<Marker> markers = {};
  TextEditingController _date = TextEditingController();
  late GoogleMapController mapController;
  var currlocation;
  var clients = [];
  final CameraPosition _initialLocation =
      const CameraPosition(target: LatLng(28.7041, 77.1025));
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng source = LatLng(28.7041, 77.1025);
  static const LatLng dest = LatLng(30.167319, 77.311288);
  // BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
  //   zoom: 14.4746,
  // );

  _getCurrentLocation() async {
    bool serviceenabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceenabled) {
      return Future.error("Disabled");
    }
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error("denied");
    } else {
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((Position position) async {
        setState(() {
          // _currentPosition = position;
          // print('CURRENT POS: $_currentPosition');
          mapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(30.253069, 77.049752),
                zoom: 15.0,
              ),
            ),
          );
        });
        markers.add(
          Marker(
              infoWindow: const InfoWindow(title: "MMDU Hospital"),
              markerId: const MarkerId('2'),
              position: LatLng(30.253069, 77.049752),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              icon: BitmapDescriptor.defaultMarker),
        );
        // await _getAddress();
        addCurrentLocationMark();
      }).catchError((e) {
        if (kDebugMode) {
          print(e);
        }
      });
    }
  }

  Future<dynamic> addCurrentLocationMark() async {
    setState(() {
      // markers.add(
      //   Marker(
      //       infoWindow: const InfoWindow(title: "MMDU Hospital"),
      //       markerId: const MarkerId('startPosition'),
      //       position:
      //           LatLng(_currentPosition.latitude, _currentPosition.longitude),
      //       onTap: () {
      //         Navigator.push(context,
      //             MaterialPageRoute(builder: (context) => HomeScreen()));
      //       },
      //       icon: BitmapDescriptor.defaultMarker),
      // );
      markers.add(
        Marker(
            infoWindow: const InfoWindow(title: "MMDU Hospital"),
            markerId: const MarkerId('2'),
            position: LatLng(30.253069, 77.049752),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            icon: BitmapDescriptor.defaultMarker),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _getCurrentLocation();
    // getallVendors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ekjut"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.green),
                    accountName: Text("Niraj"),
                    accountEmail: Text("niraj@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage:AssetImage("assets/user.jpg"),
                      backgroundColor: Colors.green,
                    ),
                    onDetailsPressed: () {

                      Get.to(PersonInfo());
                    },
                  ),
                  ListTile(
                    title: const Text(' Home'),
                    leading: const Icon(Icons.home),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  ListTile(
                    title: const Text(' Service'),
                    leading: const Icon(Icons.person),
                    onTap: () {
                      Get.back();
                      // Get.toNamed(Routes.LOCATION);
                    },
                  ),
                  ListTile(
                    title: const Text('Adoption Forum'),
                    leading: const Icon(Icons.favorite_border, size: 30),
                    onTap: () {
                      // Get.toNamed(Routes.ADOPTION);
                    },
                  ),
                  ListTile(
                    title: const Text('Ambulance'),
                    leading: const Icon(Icons.emergency_share_sharp, size: 30),
                    onTap: () {
                      Get.to(Ambulance());
                    },
                  ),
                ],
              ),

            ),

            ListTile(
              title: const Text('LogOut'),
              leading: const Icon(Icons.logout),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Get.to(LoginPage());
              },
            ),
          ],
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialLocation,
        markers: Set<Marker>.from(markers),
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
      ),
    );
  }
}
