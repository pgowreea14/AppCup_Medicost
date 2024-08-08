import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

class HeatmapPage extends StatefulWidget {
  const HeatmapPage({Key? key}) : super(key: key);

  @override
  _HeatmapPageState createState() => _HeatmapPageState();
}

class _HeatmapPageState extends State<HeatmapPage> {
  List<Map<String, dynamic>> heatmapData = [];

  @override
  void initState() {
    super.initState();
    _fetchHeatmapData();
  }

  Future<void> _fetchHeatmapData() async {
    final response = await http.get(Uri.parse(
        'https://g9ffbcf49633931-r4h3m3ix56bxw6ul.adb.af-johannesburg-1.oraclecloudapps.com/ords/admin/heatmap/'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<Map<String, dynamic>> fetchedData = (data['items'] as List)
          .map((item) => {
                'location': LatLng(
                  double.parse(item['lat']),
                  double.parse(item['lng']),
                ),
                'title': item['title'],
              })
          .toList();

      setState(() {
        heatmapData = fetchedData;
      });
    } else {
      throw Exception('Failed to load heatmap data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center:
              LatLng(-20.2314, 57.4896), // Center map on Port Louis, Mauritius
          zoom: 12.5, // Adjust zoom level as needed
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: heatmapData.map((data) {
              return Marker(
                point: data['location'],
                width: 75.0,
                height: 75.0,
                builder: (context) => Container(
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: Text(
                          '●',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Text(
                        data['title'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
