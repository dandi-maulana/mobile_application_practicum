import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Set<Marker> _markers = {};
  final LatLng _initialPosition = LatLng(3.590295, 98.6786);
  List<Location> _locations = [];

  @override
  void initState() {
    super.initState();
    _fetchLocations();
  }

  Future<void> _fetchLocations() async {
    final response = await http.get(
      Uri.parse('http://192.168.1.19/API/get_locations.php'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> locationJson = json.decode(response.body);
      setState(() {
        _locations =
            locationJson.map((json) => Location.fromJson(json)).toList();
        _addMarkers();
      });
    } else {
      throw Exception('Failed to load locations');
    }
  }

  void _addMarkers() {
    _locations.forEach((location) {
      _markers.add(
        Marker(
          markerId: MarkerId(location.id),
          position: LatLng(
            double.parse(location.latitude),
            double.parse(location.longitude),
          ),
          infoWindow: InfoWindow(
            title: location.name,
            snippet: 'Lat: ${location.latitude}, Lon: ${location.longitude}',
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Google Maps')),
        body: GoogleMap(
          onMapCreated: (controller) {},
          initialCameraPosition: CameraPosition(
            target: _initialPosition,
            zoom: 16.0,
          ),
          markers: _markers,
        ),
      ),
    );
  }
}

class Location {
  final String id;
  final String name;
  final String latitude;
  final String longitude;

  Location({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      name: json['name'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
