import 'package:bento_challenge/utils/bento_colors.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationDropdown extends StatefulWidget {
  const LocationDropdown({super.key});

  @override
  LocationDropdownState createState() => LocationDropdownState();
}

class LocationDropdownState extends State<LocationDropdown> {
  String _location = 'Getting location...';

  @override
  void initState() {
    super.initState();
    Geolocator.requestPermission();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Serviço de localização está desativado.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Permissão de localização negada.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Permissão de localização permanentemente negada.');
    }

    Position position = await Geolocator.getCurrentPosition();

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      setState(() {
        _location = "${place.locality}, ${place.country}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Delivery',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Poppins',
            )),
        Row(
          children: [
            Text(
              _location,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontFamily: 'Poppins',
              ),
            ),
            const Icon(Icons.arrow_drop_down_rounded,
                color: BentoColors.darkenBlue),
          ],
        ),
      ],
    );
  }
}
