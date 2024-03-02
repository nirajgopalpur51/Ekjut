import 'dart:convert' as convert;
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart' as loc;
import 'package:get/get.dart';
import 'package:location/location.dart';
import '../Model/MapData.dart';
class LocationController extends GetxController {
  final RxList<Results> mapData = <Results>[].obs;
  final loc.Location location = loc.Location();
  late bool _serviceEnabled;
  RxBool isLoading = true.obs;
  RxBool isLoadingLoc = true.obs;
  RxDouble lat =30.378180.obs;
  RxDouble log =76.776695.obs;
  RxString currentAddress = "".obs;

  final String apiKey = 'AIzaSyC1stPRMsTLwlxp9fP0vf0byrWjOUm7VbQ';
  @override
  void onInit() {
    super.onInit();
    print('Data Loading');
    fetchData();
  }

  void fetchData() async {
    loc.LocationData? currentLocation = await getCurrentLocation();
    lat.value=currentLocation!.latitude!;
    log.value=currentLocation!.longitude!;
    isLoadingLoc.value=false;
    update();
    if(!isLoadingLoc.value) {
      List<Results>? data = await fetchLocationData(lat.value,log.value);
      if (data != null) {
        mapData.assignAll(data);
        // print(data);
        isLoading.value = false;
        update();
      }
    }
  }

  void fetchDataLatLan(double lat,double lan) async {
    List<Results>? data = await fetchLocationData(lat,lan);
    if (data != null) {
      mapData.assignAll(data);
      // print(data);
    }
  }

  Future<List<Results>?> fetchLocationData(double lat,double lan) async {
    try {
      String url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
          'location=$lat,$lan&radius=5000&type=pet_hospital&key=$apiKey';
      final response = await http.get(
        Uri.parse('https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
            'location=$lat,$lan&radius=5000&type=hospital&key=$apiKey'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = convert.jsonDecode(response.body);
        // print("Data ==============================================================================================================>>>$url");
        MapData mapData = MapData.fromJson(jsonData);
        // print("Map Data : $mapData");
        return mapData.results;
      } else {
        print('Error loading location data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error loading location data: $e');
      return null;
    }
  }

  Future<loc.LocationData?> getCurrentLocation() async {
    try {
      PermissionStatus _permissionGranted;
      LocationData _locationData;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return null;  // You may want to handle this case based on your app logic
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return null;  // You may want to handle this case based on your app logic
        }
      }
      // Fetch the current location
      _locationData = await location.getLocation();
      currentAddress.value = await getAddressFromLocation(_locationData!.latitude!,_locationData!.longitude!);
      currentAddress.refresh();
      return _locationData;
    } catch (e) {
      print('Error getting current location: $e');
      rethrow;
    }
  }
  Future<String> getAddressFromLocation(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks.first;
      return "${place.subLocality}, ${place.locality}";
    } catch (e) {
      print('Error getting address: $e');
      Get.snackbar("Error", e.toString());
      return "Unknown Location ";
    }
  }
}