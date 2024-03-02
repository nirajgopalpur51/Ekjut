import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import '../Const.dart';
import '../Controller/LocationController.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:flutter_google_places_hoc081098/google_maps_webservice_places.dart';
import 'package:google_api_headers/google_api_headers.dart';

import '../Model/MapData.dart';
import 'MApDetails.dart';
class Ambulance extends GetView<LocationController> {
  Ambulance({super.key});
  String googleApikey = "AIzaSyC1stPRMsTLwlxp9fP0vf0byrWjOUm7VbQ";
  LatLng startLocation = const LatLng(30.378180, 76.776695);
  RxString location = "Search Location".obs;
  late GoogleMapController mapcontroller ;
  Set<Marker> markers = {};
  final List<AmbulanceDriver> drivers = [
    AmbulanceDriver(name: 'John Doe', contact: '123-456-7890'),
    AmbulanceDriver(name: 'Jane Smith', contact: '987-654-3210'),
    // Add more drivers as needed
  ];
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    var width = Config.screenWidth;
    var height = Config.screenHeight;

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              "Ambulance",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 23,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(location.value=="Search Location"?
            controller.currentAddress.value:location.value,
              style: const TextStyle(
                fontSize: 10,
                fontFamily: "Poppins",
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () async {
              showLocationPopup(context);
            },
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 25),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: height !* 0.02),
        height: height,
        width: width,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: height * 0.55,
                width: double.infinity,
                clipBehavior: Clip.hardEdge,
                margin: const EdgeInsets.all(15).copyWith(top: 0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child:Image.asset("assets/Ambulance.jpg"),
              ),
              // SizedBox(height: 200,),
              Container(
                height: height * 0.3,
                width: double.infinity,
                clipBehavior: Clip.hardEdge,
                margin: const EdgeInsets.all(15).copyWith(top: 0),
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child:Column(
                  // mainAxisAlignment: MainAxisAlignmen,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text("   Your Location",style: TextStyle(fontSize: 12),),
                    Text("   Kukas , Jaipur"),
                    SizedBox(height: 40,),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 290,
                        child: Row(children: [
                          SizedBox(width: 125,child: ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.home,color: Colors.red,), label: Text("Home"))),
                          SizedBox(width: 10,),
                          ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.car_crash,color: Colors.red,), label: Text("Ambulance"))
                        ],),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.red,), label: Text("Hospitals")),
                    ),
                    Align(alignment: Alignment.bottomCenter, child: SizedBox(width: 290,child: ElevatedButton(onPressed: () {}, child: Text("Call An Ambulance")),))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showLocationPopup(BuildContext context) async {
    var place = await PlacesAutocomplete.show(
      context: context,
      apiKey: controller.apiKey.toString(),
      mode: Mode.overlay,
      types: [],
      strictbounds: false,
      components: [const Component(Component.country, 'in')],
      onError: (err) {
        if (kDebugMode) {
          print(err);
        }
      },
    );

    if (place != null) {
      controller.isLoading.value = true;
      controller.isLoadingLoc.value=false;
      controller.isLoadingLoc.refresh();
      controller.isLoading.refresh();
      location.value = place.description.toString();
      print(place.placeId);
      final plist = GoogleMapsPlaces(
        apiKey: googleApikey,
        apiHeaders: await const GoogleApiHeaders().getHeaders(),
      );
      String placeid = place.placeId ?? "0";
      final detail = await plist.getDetailsByPlaceId(placeid);

      if (detail != null) {
        final geometry = detail.result.geometry!;
        final lat = geometry.location.lat;
        final lng = geometry.location.lng;
        controller.fetchDataLatLan(lat, lng);
        var nearbyPlaces = await plist.searchNearbyWithRadius(
          Location(lat: lat, lng: lng),
          5000,
          type: "pet_hospital",
        );

        markers.clear();
        print("data   :   ${nearbyPlaces.results.first.name}");
        for (var place in nearbyPlaces.results) {
          markers.add(
            Marker(
              markerId: MarkerId(place.id!),
              position: LatLng(
                place.geometry!.location.lat,
                place.geometry!.location.lng,
              ),
              infoWindow: InfoWindow(title: place.name),
            ),
          );
        }

        if (markers.isNotEmpty) {
          mapcontroller.animateCamera(
            CameraUpdate.newLatLng(markers.first.position),
          );
        }
      }

      controller.isLoading.value = false;
      controller.isLoading.refresh();
      controller.isLoadingLoc.value=true;
      controller.isLoadingLoc.refresh();
    }
  }

  String getStatus(Results results) {
    if (results.openingHours?.openNow == true || results.businessStatus == "OPERATIONAL") {
      return "Open Now";
    } else if (results.businessStatus == "CLOSED_TEMPORARILY") {
      return "Closed Temporarily";
    } else if (results.businessStatus == "CLOSED_PERMANENTLY") {
      return "Closed Permanently";
    } else {
      return "Unknown";
    }
  }

  Set<Marker> _createMarkers(RxList<Results> places) {
    return places.map((place) {
      return Marker(
        markerId: MarkerId(place.placeId!),
        position: LatLng(
          place.geometry!.location!.lat!,
          place.geometry!.location!.lng!,
        ),
        infoWindow: InfoWindow(
          title: place.name,
          snippet: place.businessStatus,
        ),
      );
    }).toSet();
  }
}

class AmbulanceDriver {
  final String name;
  final String contact;

  AmbulanceDriver({required this.name, required this.contact});
}