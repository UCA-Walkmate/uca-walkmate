import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:uca_walkmate/config/constants/environment.dart';
import 'package:uca_walkmate/data/apis/graph_hopper_api.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

//enum para mostrar el cuadro de dialogo
enum DialogAction { yes, abort }

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
  final DialogAction action = DialogAction.yes;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  // Función de trazado de ruta entre la ubicación actual y un destino de la UCA
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

        //verifica si la lista de puntos esta vacia y si lo esta no muestra un snackbar
        if (puntos.isEmpty) {
          
          openDialog(DialogAction.abort);
          print('Llego vacio');
          return;
        }

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
        // Cuadro de diálogo
        openDialog(DialogAction.yes);
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
      }
    } else {
      // Detener el temporizador y limpiar la ruta si el servicio de ubicación está deshabilitado
      timer?.cancel();
      timer = null;
      setState(() {
        route = [];
      });
      // Cuadro de diálogo
      openDialog(DialogAction.yes);
      // Position position = await Geolocator.getCurrentPosition(
      //     desiredAccuracy: LocationAccuracy.high);
    }
  }

  // Función que muestra el cuadro de diálogo
  void openDialog(DialogAction action) {
    if (action == DialogAction.yes) {
      showDialog(
        context: context,
        barrierDismissible:
            false, // Haciendo que no se pueda cerrar el diálogo al tocar fuera de él
        builder: (context) => AlertDialog(
          title: Column(
            children: [
              Image.asset(
                'assets/images/ubicacion.png',
                height: 100,
                width: 100,
              ),
              const Text(
                'Ubicación Deshabilitada',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          content: const Text(
              'Para continuar es necesario habilitar la ubicación en tu dispositivo'),
          actions: [
            FilledButton(
                onPressed: () {
                  Geolocator
                      .openLocationSettings(); // Abrir configuración de ubicación
                  Navigator.of(context).pop();
                },
                child: const Text('Aceptar'))
          ],
        ),
      );
    } else {
      showDialog(
      context: context,
      barrierDismissible:
          false, // Haciendo que no se pueda cerrar el diálogo al tocar fuera de él
      builder: (context) => AlertDialog(
        title: Column(
          children: [
            Image.asset(
              'assets/images/error.png',
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 10,),
            const Text(
              'UPPS! Algo salió mal',
              style: TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
        content: const Text(
            'No se pudo trazar la ruta, por favor intenta de nuevo más tarde'),
        actions: [
          FilledButton(
              onPressed: () {
                // Geolocator
                //     .openLocationSettings(); // Abrir configuración de ubicación
                Navigator.of(context).pop();
              },
              child: const Text(
              'Aceptar',
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),))
        ],
      ),
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
