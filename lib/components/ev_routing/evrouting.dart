import 'package:flutter/material.dart';
import 'package:here_sdk/mapview.dart';

import '../../home.dart';
import 'EVRoutingExample.dart';

class EvRouting extends StatefulWidget {
  const EvRouting({super.key});

  @override
  State<EvRouting> createState() => _EvRoutingState();
}

class _EvRoutingState extends State<EvRouting> {
   EVRoutingExample? _evRoutingExample;

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HERE SDK - EVRouting Example'),
         leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
            Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
      ),
      body: Stack(
        children: [
          HereMap(onMapCreated: _onMapCreated),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button('EV Route', _addEVRouteButtonClicked),
              button('Isoline', _reachableAreaButtonClicked),
              button('Clear', _clearMapButtonClicked),
            ],
          ),
        ],
      ),
    );
  }

  void _onMapCreated(HereMapController hereMapController) {
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.normalDay, (MapError? error) {
      if (error == null) {
        _evRoutingExample = EVRoutingExample(_showDialog, hereMapController);
      } else {
        print("Map scene not loaded. MapError: " + error.toString());
      }
    });
  }

  void _addEVRouteButtonClicked() {
    _evRoutingExample?.addEVRoute();
  }

  void _reachableAreaButtonClicked() {
    _evRoutingExample?.showReachableArea();
  }

  void _clearMapButtonClicked() {
    _evRoutingExample?.clearMap();
  }

 

  // A helper method to add a button on top of the HERE map.
  Align button(String buttonLabel, Function callbackFunction) {
    return Align(
      alignment: Alignment.topCenter,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.lightBlueAccent,
          onPrimary: Colors.white,
        ),
        onPressed: () => callbackFunction(),
        child: Text(buttonLabel, style: TextStyle(fontSize: 20)),
      ),
    );
  }

  // A helper method to show a dialog.
  Future<void> _showDialog(String title, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}