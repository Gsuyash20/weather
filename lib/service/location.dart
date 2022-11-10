import 'package:geolocator/geolocator.dart';

class Location {
    double latitude=0;
    double longitude=0;

  Future<dynamic> currentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitude =position.longitude;
      latitude  =position.latitude;
    } catch (exception) {
      print(exception);
    }
  }
}
