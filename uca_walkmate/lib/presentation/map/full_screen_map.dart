import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class FullScreenMap extends StatelessWidget {
  const FullScreenMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FlutterMap(
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
                onTap: () =>
                    launchUrl(Uri.parse('https://www.mapbox.com/about/maps/')),
              ),
              TextSourceAttribution(
                '© OpenStreetMap contributors',
                onTap: () =>
                    launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
              ),
              TextSourceAttribution(
                'Improve this map',
                onTap: () => launchUrl(
                    Uri.parse('https://www.mapbox.com/map-feedback/')),
              ),
            ],
          )
        ]));
  }
}
