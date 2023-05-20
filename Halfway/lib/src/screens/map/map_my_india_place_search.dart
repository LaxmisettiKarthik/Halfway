// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:mapmyindia_gl/mapmyindia_gl.dart' as mapmyindia;
// import 'package:mappls_gl/mappls_gl.dart' as mappls;

// import '../../viwModel/map_my_india_provider.dart';

// class PlaceSearchWidget extends StatefulWidget {
//   const PlaceSearchWidget({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     return PlaceSearchWidgetState();
//   }
// }

// class PlaceSearchWidgetState extends State<PlaceSearchWidget> {
//   late MapMyIndiaProvider provider;
//   TextEditingController textController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     provider = Provider.of<MapMyIndiaProvider>(context, listen: true);
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         title: const Text(
//           'Place Search',
//           style: TextStyle(color: Colors.white),
//         ),
//         elevation: 0.2,
//         systemOverlayStyle: SystemUiOverlayStyle.light,
//       ),
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 20,
//           ),
//           Container(
//             padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
//             decoration: const BoxDecoration(
//               color: Colors.white,
//             ),
//             child: TextFormField(
//               controller: textController,
//               decoration: const InputDecoration(
//                 hintText: "Search Here",
//                 fillColor: Colors.white,
//               ),
//               maxLines: 1,
//               onChanged: (text) {
//                 provider.autoComplete(text);
//               },
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           provider.placeList.isNotEmpty
//               ? Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                     ),
//                     child: ListView.builder(
//                       itemCount: provider.placeList.length,
//                       itemBuilder: (context, index) {
//                         mapmyindia.ELocation mapMyIndiaLocation =
//                             provider.placeList[index];
//                         mappls.ELocation mapplsLocation =
//                             convertToMapplsLocation(mapMyIndiaLocation);
//                         return ListTile(
//                           contentPadding: const EdgeInsets.all(12),
//                           focusColor: Colors.white,
//                           title: Text(mapMyIndiaLocation.placeName ?? ''),
//                           subtitle: Text(
//                             mapMyIndiaLocation.placeAddress ?? '',
//                             maxLines: 2,
//                           ),
//                           onTap: () {
//                             provider.goToLocation(mapplsLocation);
//                             Navigator.pop(context);
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                 )
//               : Container(),
//         ],
//       ),
//     );
//   }

//    mappls.ELocation convertToMapplsLocation(
//       mapmyindia.ELocation mapMyIndiaLocation) {
//     return mappls.ELocation(
//       latitude: double.parse(mapMyIndiaLocation.latitude ?? '0.0'),
//       longitude: double.parse(mapMyIndiaLocation.longitude ?? '0.0'),
//       eLoc: mapMyIndiaLocation.eLoc ?? '',
//       placeName: mapMyIndiaLocation.placeName ?? '',
//       placeAddress: mapMyIndiaLocation.placeAddress ??,
//     );
//   }
// }

