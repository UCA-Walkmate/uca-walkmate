import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:uca_walkmate/config/constants/environment.dart';
import 'package:uca_walkmate/data/apis/graph_hopper_api.dart';
import 'package:url_launcher/url_launcher.dart';

class FullScreenMap extends StatefulWidget {
  static const String routeName = 'home';
  const FullScreenMap({super.key});

  @override
  State<FullScreenMap> createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  //llave de la api
  final GraphHopperService graphHopperService =
      GraphHopperService(apiKey: Environment.apiKey);

  //lista de puntos de la ruta para mapearlos
  List<LatLng> route = [];

  //obteniendo los puntos de la ruta llamando los servicios de la api
  getCoordinate() async {
    //punto de inicio y fin de la ruta
    LatLng start = const LatLng(-89.2213012319936, 13.692324732823067);
    LatLng end = const LatLng(-89.25114786256749, 13.669090706918311);

    //obteniendo los puntos de la ruta
    List<LatLng> puntos = await graphHopperService.getRoute(start, end);
    //actualizando el estado de la lista de puntos
    setState(() {
      if (puntos.isNotEmpty) {
        route = puntos;
      }
    });
  }

  // defininiendo los limites del mapa
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
              // polylineCulling: false,
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
