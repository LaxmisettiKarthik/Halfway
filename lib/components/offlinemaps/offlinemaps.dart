import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/core.engine.dart';
import 'package:here_sdk/core.errors.dart';
import 'package:here_sdk/mapview.dart';

import '../../home.dart';
import 'OfflineMapsExample.dart';
class OfflineMaps extends StatefulWidget {
  const OfflineMaps({super.key});

  @override
  State<OfflineMaps> createState() => _OfflineMapsState();
}

class _OfflineMapsState extends State<OfflineMaps> {
   OfflineMapsExample? _offlineMapsExample;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HERE SDK - Offline Maps Example'),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button('Get Regions', _regionsButtonClicked),
                  button('Download Region', _downloadButtonClicked),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button('Cancel', _cancelButtonClicked),
                  button('Test Search', _testButtonClicked),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button('Switch Online', _onlineButtonClicked),
                  button('Switch Offline', _offlineButtonClicked),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onMapCreated(HereMapController hereMapController) {
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.normalDay, (MapError? error) {
      if (error == null) {
        _offlineMapsExample = OfflineMapsExample(_showDialog, hereMapController);
      } else {
        print("Map scene not loaded. MapError: " + error.toString());
      }
    });
  }

  void _regionsButtonClicked() {
    _offlineMapsExample?.onDownloadListClicked();
  }

  void _downloadButtonClicked() {
    _offlineMapsExample?.onDownloadMapClicked();
  }

  void _cancelButtonClicked() {
    _offlineMapsExample?.onCancelMapDownloadClicked();
  }

  void _testButtonClicked() {
    _offlineMapsExample?.onSearchPlaceClicked();
  }

  void _onlineButtonClicked() {
    _offlineMapsExample?.onOnlineButtonClicked();
  }

  void _offlineButtonClicked() {
    _offlineMapsExample?.onOfflineButtonClicked();
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