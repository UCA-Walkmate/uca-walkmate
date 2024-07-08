import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:uca_walkmate/config/constants/environment.dart';
import 'package:uca_walkmate/infrastructure/mappers/location_mapper.dart';
import 'package:uca_walkmate/presentation/widgets/modals/location_modal.dart';

class SearchAppBar extends StatefulWidget {
  const SearchAppBar({super.key});

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
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
    var response = await Dio().get(
      '${Environment.apiUrl}/locations/search',
      queryParameters: {'fragment': search}
    );
    
    return (response.data as List).map((location) => location['name'] as String).toList();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color:  colors.onPrimary,
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

              final response = await Dio().get('${Environment.apiUrl}/locations/name/$selectedItem');

              final selectedLocation = LocationMapper.locationJsonToLocation(response.data);

              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) => LocationModal(
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
                  style: const TextStyle(color: Color(0XFFFFFFFF), fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'Buscar...',
                    hintStyle: TextStyle(color: const  Color(0XFFFDFFE2).withOpacity(0.5), fontSize: 16),
                    border: InputBorder.none,
                  ),
                  
                  onChanged: (value) {
                    if (_debounce?.isActive ?? false) _debounce!.cancel();

                    _debounce = Timer(const Duration(milliseconds: 850), () async {                      
                      
                      setState(() {
                        search = value;
                      });

                      _openDropDownProgKey.currentState?.openDropDownSearch();                     
                    });

                  } 
                ),
              );
            },
            // popupProps: ,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                hintText: 'Buscar...',
                hintStyle: TextStyle(color: const  Color(0XFFFDFFE2).withOpacity(0.5), fontSize: 16),
                border: InputBorder.none,
                icon: const Icon(Icons.search, color: Color(0XFFFDFFE2)),
              ),
            ),
            asyncItems: (filter) => getData(),
          ),

          Positioned(
            right: 0,
            child: IconButton(
              onPressed: () {
                
              },
              icon: const Icon(Icons.person, color: Color(0XFFFDFFE2)),
            ),
          )
        
        ] 

      ),
    );
  }
}
