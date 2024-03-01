import 'dart:async';

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:login_backend/Screens/appointment_screen.dart';
import 'package:login_backend/Screens/home_screen.dart';
import 'package:login_backend/Screens/map_screen.dart';
import 'package:login_backend/Screens/person_info.dart';
import 'package:login_backend/Screens/search_screen.dart';

class Navigation extends StatefulWidget {
  @override
  State<Navigation> createState() => NavigationState();
}

class NavigationState extends State<Navigation> {
  // Completer<GoogleMapController> _controller = Completer();
  //
  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  //
  // static final Marker _kGooglePlexMarker=Marker(
  //   markerId: MarkerId('kGooglePlex'),
  //   icon: BitmapDescriptor.defaultMarker
  //   ,
  //   position: LatLng(37.42796133580664, -122.085749655962),
  //   infoWindow: InfoWindow(title: 'Google Plex'),
  // );
  //
  //
  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  int index = 0;
  Widget bodyScreen = MapSample();

  currentScreen(int value) {
    index=value;
    if (index == 0) {
      bodyScreen = MapSample();
    }
    if (index == 1) {
      bodyScreen = SearchScreen();
    }
    if (index == 2) {
      bodyScreen = AppointmentScreen();
    }
    if (index == 3) {
      bodyScreen = PersonInfo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyScreen,
      // GoogleMap(
      //   markers: {_kGooglePlexMarker},
      //   mapType: MapType.normal,
      //   initialCameraPosition: _kGooglePlex,
      //   onMapCreated: (GoogleMapController controller) {
      //     _controller.complete(controller);
      //   },
      // ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
      bottomNavigationBar:DotNavigationBar(
          currentIndex: index,
          dotIndicatorColor: Color(0xff00B48B),
          unselectedItemColor: Colors.black,
          selectedItemColor: Color(0xff00B48B),
          backgroundColor: Colors.white,enableFloatingNavBar: false,
          onTap: (index1)
          {
                  setState(() {
                    index = index1;
                  });
                  currentScreen(index);
                },
          items: [
            DotNavigationBarItem(icon: Icon(Icons.home,), ),
            DotNavigationBarItem(icon: Icon(Icons.search,), ),
            DotNavigationBarItem(icon: Icon(Icons.history_edu_outlined,), ),
            DotNavigationBarItem(icon: Icon(Icons.person,), ),

          ])
    );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}