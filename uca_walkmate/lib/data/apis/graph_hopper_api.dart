import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:latlong2/latlong.dart';

class GraphHopperService {
  final String apiKey;

  GraphHopperService({required this.apiKey});

  Future<List<LatLng>> getRoute(LatLng start, LatLng end) async {
    final response = await http.get(
      Uri.parse('https://graphhopper.com/api/1/route?point=${start.latitude},${start.longitude}&point=${end.latitude},${end.longitude}&vehicle=foot&locale=es&points_encoded=false&key=$apiKey'),
      //ruta de la api para obtener la ruta a pie

    );

    if (response.statusCode == 200) {
      //obtencion de la lista de puntos del cuerpo de la respuesta
      final data = json.decode(response.body);
      final points = data['paths'][0]['points']['coordinates'];
      return points.map<LatLng>((point) => LatLng(point[1], point[0])).toList();
    } else {
      throw Exception('Failed to load route');
    }
  }
}
