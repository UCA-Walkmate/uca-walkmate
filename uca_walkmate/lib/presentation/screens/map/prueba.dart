import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:uca_walkmate/config/constants/environment.dart';
import 'package:uca_walkmate/data/apis/graph_hopper_api.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Prueba extends StatefulWidget {
  static const String routeName = 'home';
  const Prueba({super.key});

  @override
  State<Prueba> createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
  final GraphHopperService graphHopperService =
      GraphHopperService(apiKey: Environment.apiKey);

  List<LatLng> route = [];
  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> getCoordinate() async {
    // Verificar si el servicio de ubicación está habilitado
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (isLocationServiceEnabled) {
      if (await Permission.location.request().isGranted) {
        // Obtener la posición actual
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        LatLng start = LatLng(position.latitude, position.longitude);
        LatLng end = const LatLng(13.681108, -89.236334);

        List<LatLng> puntos = await graphHopperService.getRoute(start, end);
        setState(() {
          if (puntos.isNotEmpty) {
            route = puntos;
          }
        });

        // Inicializar el temporizador si no está ya inicializado
        if (timer == null) {
          timer = Timer.periodic(Duration(seconds: 2), (Timer t) => getCoordinate());
        }
      } else {
        // Manejar permiso denegado
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Location permission is required')),
        );
      }
    } else {
      // Detener el temporizador y limpiar la ruta si el servicio de ubicación está deshabilitado
      timer?.cancel();
      timer = null;
      setState(() {
        route = [];
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location service is disabled')),
      );
    }
  }

  final boundsss = LatLngBounds(
      const LatLng(13.691159, -89.222943), const LatLng(13.668918, -89.251077));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
              initialCenter: const LatLng(13.680144, -89.236275),
              initialZoom: 15,
              minZoom: 10,
              cameraConstraint: CameraConstraint.contain(bounds: boundsss)),
          children: [
            TileLayer(
              urlTemplate: Environment.mapBox,
              userAgentPackageName: 'com.example.mapa_uca',
              retinaMode: true,
            ),
            RichAttributionWidget(
              attributions: [
                TextSourceAttribution(
                  '© Mapbox',
                  onTap: () => launchUrl(
                      Uri.parse('https://www.mapbox.com/about/maps/')),
                ),
                TextSourceAttribution(
                  '© OpenStreetMap contributors',
                  onTap: () => launchUrl(
                      Uri.parse('https://openstreetmap.org/copyright')),
                ),
                TextSourceAttribution(
                  'Improve this map',
                  onTap: () => launchUrl(
                      Uri.parse('https://www.mapbox.com/map-feedback/')),
                ),
              ],
            ),
            PolylineLayer(
              polylines: [
                Polyline(
                  points: route,
                  color: Colors.blue,
                  strokeWidth: 4,
                ),
              ],
            ),
          ],
        ),
        FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          onPressed: () => getCoordinate(),
          child: const Icon(
            Icons.route,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
