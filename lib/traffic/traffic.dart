import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/core.engine.dart';
import 'package:here_sdk/mapview.dart';

import 'TrafficExample.dart';
class Traffic extends StatefulWidget {
  const Traffic({super.key});

  @override
  State<Traffic> createState() => _TrafficState();
}

class _TrafficState extends State<Traffic> {
    TrafficExample? _trafficExample;

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('HERE SDK - Traffic Example'),
        ),
        body: Stack(
          children: [
            HereMap(onMapCreated: _onMapCreated),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button('Enable All', _enableAllButtonClicked),
                button('Disable All', _disableAllButtonClicked),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onMapCreated(HereMapController hereMapController) {
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.satellite, (MapError? error) {
      if (error == null) {
        _trafficExample = TrafficExample(_showDialog, hereMapController);
      } else {
        print("Map scene not loaded. MapError: " + error.toString());
      }
    });
  }

  void _enableAllButtonClicked() {
    _trafficExample?.enableAll();
  }

  void _disableAllButtonClicked() {
    _trafficExample?.disableAll();
  }

  @override
  void dispose() {
    // Free HERE SDK resources before the application shuts down.
    SDKNativeEngine.sharedInstance?.dispose();
    SdkContext.release();
    super.dispose();
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