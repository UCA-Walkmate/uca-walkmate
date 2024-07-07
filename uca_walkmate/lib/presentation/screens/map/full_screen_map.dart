import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:uca_walkmate/config/constants/environment.dart';
import 'package:uca_walkmate/data/apis/graph_hopper_api.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class FullScreenMap extends StatefulWidget {
  static const String routeName = 'home';
  const FullScreenMap({super.key});

  @override
  State<FullScreenMap> createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  final GraphHopperService graphHopperService =
      GraphHopperService(apiKey: Environment.apiKey);

  List<LatLng> route = [];
  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  //Funcion de trazado de ruta  entre la ubicacion actual y un destino de la UCA
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
          timer = Timer.periodic(
              const Duration(seconds: 2), (Timer t) => getCoordinate());
        }
      } else {
        // Manejar permiso denegado
        //cuadro de dialogo
        openDialog();
      }
    } else {
      // Detener el temporizador y limpiar la ruta si el servicio de ubicación está deshabilitado
      timer?.cancel();
      timer = null;
      setState(() {
        route = [];
      });
      //cuadro de dialogo
      openDialog();
    }
  }

  //funcion que muestra el cuadro de dialogo
  void openDialog() {
    showDialog(
        context: context,
        //haciendo que no se pueda cerrar el dialogo al tocar fuera de el
        barrierDismissible: false,
        builder: (context) => AlertDialog(
                // icon: const Icon(Icons.warning, color: Colors.red),
                title: Column(
                  children: [
                    Image.asset('assets/images/ubicacion.png', height: 100, width: 100,),
                    const Text('Ubicacion Deshabilitada', style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),)
                  ],
                ),
                content: const Text(
                    'Para continuar es necesario habilitar la ubicacion en tu dispositivo'),
                actions: [
                  FilledButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Aceptar'))
                ]));
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
