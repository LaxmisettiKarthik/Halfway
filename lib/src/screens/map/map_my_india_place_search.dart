import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:mapmyindia_place_widget/mapmyindia_place_widget.dart';
import 'package:provider/provider.dart';

import '../../viwModel/map_my_india_provider.dart';

class PlaceSearchWidget extends StatefulWidget {
  const PlaceSearchWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return PlaceSearchWidgetState();
  }
}

class PlaceSearchWidgetState extends State {
 // ELocation _eLocation = ELocation();
  late MapMyIndiaProvider provider;
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MapMyIndiaProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        brightness: Brightness.dark,
        title: const Text(
          'Place Search',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.2,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TextFormField(
                  controller: textController,
                  decoration: const InputDecoration(
                      hintText: "Search Here", fillColor: Colors.white),
                  maxLines: 1,
                  onChanged: (text) {
                    provider.autoComplete(text);
                  })),
          const SizedBox(
            height: 20,
          ),
          provider.placeList.isNotEmpty
              ? Expanded(
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: ListView.builder(
                          itemCount: provider.placeList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding: const EdgeInsets.all(12),
                              focusColor: Colors.white,
                              title: Text(
                                  provider.placeList[index].placeName ?? ''),
                              subtitle: Text(
                                provider.placeList[index].placeAddress ?? '',
                                maxLines: 2,
                              ),
                              onTap: () {
                                provider
                                    .goToLocation(provider.placeList[index]);
                                Navigator.pop(context);
                              },
                            );
                          })))
              : Container()
        ],
      ),
    );
  }
}
