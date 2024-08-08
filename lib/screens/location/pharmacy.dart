import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class NearbyPharmaciesPage extends StatefulWidget {
  @override
  _NearbyPharmaciesPageState createState() => _NearbyPharmaciesPageState();
}

class _NearbyPharmaciesPageState extends State<NearbyPharmaciesPage> {
  List<dynamic> _pharmacies = [];
  bool _isLoading = true;
  LatLng _currentPosition = LatLng(0, 0);
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _loadPharmacies();
  }

  Future<void> _loadPharmacies() async {
    try {
      final Position position = await _getCurrentLocation();
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
      });
      final List<dynamic> pharmacies =
          await _fetchNearbyPharmacies(position.latitude, position.longitude);
      setState(() {
        _pharmacies = pharmacies;
        _isLoading = false;
        _markers = _createMarkers(pharmacies);
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Handle the error here
      print(e);
    }
  }

  Future<Position> _getCurrentLocation() async {
    await Geolocator.requestPermission();
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<List<dynamic>> _fetchNearbyPharmacies(
      double latitude, double longitude) async {
    final String apiKey = 'AIzaSyDx4GSzYrRyjO-wrDwt4qxxCSBrpSKNZJ4';
    final String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=5000&type=pharmacy&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load pharmacies');
    }
  }

  Set<Marker> _createMarkers(List<dynamic> pharmacies) {
    return pharmacies.map((pharmacy) {
      final lat = pharmacy['geometry']['location']['lat'];
      final lng = pharmacy['geometry']['location']['lng'];
      return Marker(
        markerId: MarkerId(pharmacy['place_id']),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(
          title: pharmacy['name'],
          snippet: pharmacy['vicinity'],
        ),
      );
    }).toSet();
  }

  Future<void> _openMapDirections(double lat, double lng) async {
    final url =
        'https://www.google.com/maps/dir/?api=1&origin=${_currentPosition.latitude},${_currentPosition.longitude}&destination=$lat,$lng&travelmode=driving';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not open the map.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pharmacies Locator'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Map section
                Expanded(
                  flex: 1,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _currentPosition,
                      zoom: 14,
                    ),
                    markers: _markers,
                    mapType: MapType.satellite, // Change to satellite view
                  ),
                ),
                // Pharmacy list section
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: _pharmacies.length,
                    itemBuilder: (context, index) {
                      final pharmacy = _pharmacies[index];
                      final lat = pharmacy['geometry']['location']['lat'];
                      final lng = pharmacy['geometry']['location']['lng'];
                      return ListTile(
                        title: Text(pharmacy['name']),
                        subtitle: Text(pharmacy['vicinity']),
                        onTap: () {
                          _openMapDirections(lat, lng);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
