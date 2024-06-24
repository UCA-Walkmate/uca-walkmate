import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:uca_walkmate/data/apis/graph_hopper_api.dart';
import 'package:uca_walkmate/presentation/widgets/custom_botton_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'custom_bottom_app_bar.dart'; // Asegúrate de importar el archivo correcto

class FullScreenMap extends StatefulWidget {
  const FullScreenMap({super.key});

  @override
  State<FullScreenMap> createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  //llave de la api
  final GraphHopperService graphHopperService =
      GraphHopperService(apiKey: 'ba1dcdf2-69f9-4138-9fcc-d57aa2476db0');

  //lista de puntos de la ruta para mapearlos
  List<LatLng> route = [];

  //obteniendo los puntos de la ruta llamando los servicios de la api
  getCoordinate() async {
    //punto de inicio y fin de la ruta
    LatLng start = const LatLng(13.679709, -89.236811);
    LatLng end = const LatLng(13.67983, -89.23553);

    //obteniendo los puntos de la ruta
    List<LatLng> puntos = await graphHopperService.getRoute(start, end);
    //actualizando el estado de la lista de puntos
    setState(() {
      if (puntos.isNotEmpty) {
        route = puntos;
      }
    });
  }

  int _selectedIndex = 0;

  void _onBottomBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Maneja la lógica adicional aquí si es necesario
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(13.680144, -89.236275),
              initialZoom: 15,
              minZoom: 10,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://api.mapbox.com/styles/v1/titocarpio/clxflk0ox00qd01qm0d8rf6hu/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidGl0b2NhcnBpbyIsImEiOiJjbHg5dDB3NjQycWcwMmtxMTB3YmJtMnpyIn0.DaW6faDhPKXABvltNU8vig',
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
          //boton flotante para obtener la ruta de la api TODO: se puede mejorar
          Positioned(
            bottom: 20,
            //posicionando el widget en el centro pero dependiendo del tamaño de la pantalla
            left: 30,
            right:  30,
            child: Center(
              child: CustomBottomAppBar(
                items: [
                  BottomBarItem(icon: Icons.location_on_outlined),
                  BottomBarItem(icon: Icons.book_outlined),
                  BottomBarItem(icon: Icons.calendar_today_rounded),
                ],
                selectedIndex: _selectedIndex,
                onTap: _onBottomBarItemTapped,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        
        backgroundColor: Colors.blueAccent,
        onPressed: () => getCoordinate(),
        child: const Icon(
          Icons.route,
          color: Colors.red,
        ),
      ),
    );
  }
}
