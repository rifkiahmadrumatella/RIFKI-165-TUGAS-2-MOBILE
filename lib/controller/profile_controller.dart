import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class ProfileController extends GetxController {
  final RxString locationName = "Loading...".obs;

  @override
  void onInit() {
    super.onInit();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      locationName.value = "Location service disabled";
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        locationName.value = "Location permission denied";
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      locationName.value = "Location permanently denied";
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        String? city =
            placemarks[0].locality ?? placemarks[0].subAdministrativeArea;
        if (city != null && city.isNotEmpty) {
          locationName.value = city.toUpperCase();
        } else {
          locationName.value = "Location not found";
        }
      }
    } catch (e) {
      locationName.value = "Failed to get location";
    }
  }
}
