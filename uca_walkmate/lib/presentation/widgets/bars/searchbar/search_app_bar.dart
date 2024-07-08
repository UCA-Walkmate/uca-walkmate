// Copyright 2024 UCA Walkmate
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:uca_walkmate/config/constants/environment.dart';
import 'package:uca_walkmate/infrastructure/mappers/location_mapper.dart';
import 'package:uca_walkmate/presentation/providers/auth_provider.dart';
import 'package:uca_walkmate/presentation/widgets/modals/location_modal.dart';

class SearchAppBar extends ConsumerStatefulWidget {
  final Future<void> Function(LatLng) getCoordinate;
  final Function() cleanRoute;

  const SearchAppBar({
    super.key, 
    required this.getCoordinate, 
    required this.cleanRoute
  });

  @override
  ConsumerState<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends ConsumerState<SearchAppBar> {
  final _openDropDownProgKey = GlobalKey<DropdownSearchState<String>>();
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;
  String selectedItem = '';
  String search = '';

  void _setValue() {
    setState(() {
      _controller.text = selectedItem; // Establece el valor del TextFormField
    });
  }

  Future<List<String>> getData() async {
    var response = await Dio().get('${Environment.apiUrl}/locations/search',
        queryParameters: {'fragment': search});

    return (response.data as List)
        .map((location) => location['name'] as String)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: colors.onPrimary,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Stack(
        children: [
          DropdownSearch<String>(
            key: _openDropDownProgKey,
            selectedItem: selectedItem,
            onChanged: (String? value) async {
              setState(() {
                selectedItem = value ?? '';
              });

              _setValue();

              final response = await Dio()
                  .get('${Environment.apiUrl}/locations/name/$selectedItem');

              final selectedLocation = LocationMapper.locationJsonToLocation(response.data);

              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) => LocationModal(
                  getCoordinate: widget.getCoordinate,
                  cleanRoute: widget.cleanRoute,
                  location: selectedLocation.name,
                  category: selectedLocation.category,
                  geom: selectedLocation.geom,
                ),
              );
            },
            dropdownButtonProps: const DropdownButtonProps(
              isVisible: false,
            ),
            dropdownBuilder: (context, selectedItem) {
              return Container(
                height: 32,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                child: TextFormField(
                  controller: _controller,
                  style:
                      const TextStyle(color: Color(0XFFFFFFFF), fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'Buscar...',
                    hintStyle: TextStyle(
                        color: const Color(0XFFFDFFE2).withOpacity(0.5),
                        fontSize: 16),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    if (_debounce?.isActive ?? false) _debounce!.cancel();

                    _debounce =
                        Timer(const Duration(milliseconds: 850), () async {
                      setState(() {
                        search = value;
                      });

                      _openDropDownProgKey.currentState?.openDropDownSearch();
                    });
                  },
                ),
              );
            },
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                hintText: 'Buscar...',
                hintStyle: TextStyle(
                    color: const Color(0XFFFDFFE2).withOpacity(0.5),
                    fontSize: 16),
                border: InputBorder.none,
                icon: const Icon(Icons.search, color: Color(0XFFFDFFE2)),
              ),
            ),
            asyncItems: (filter) => getData(),
          ),
          Positioned(
            right: 0,
            child: PopupMenuButton<int>(
              icon: const Icon(Icons.person, color: Color(0XFFFDFFE2)),
              onSelected: (value) {
                if (value == 1) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Confirmación'),
                        content: const Text(
                            '¿Estás seguro que deseas cerrar sesión?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: const Text('Cerrar sesión'),
                          ),
                        ],
                      );
                    },
                  ).then((result) {
                    if (result == true) {
                      ref.read(authProvider.notifier).logout();
                      context.go('/login');
                    }
                  });
                }
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text('Cerrar sesión'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
