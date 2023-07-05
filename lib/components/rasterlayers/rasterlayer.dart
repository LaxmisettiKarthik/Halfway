import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/core.engine.dart';
import 'package:here_sdk/core.errors.dart';
import 'package:here_sdk/mapview.dart';

import '../../home.dart';
import 'CustomRasterLayersExample.dart';
class RasterLayers extends StatefulWidget {
  const RasterLayers({super.key});

  @override
  State<RasterLayers> createState() => _RasterLayersState();
}

class _RasterLayersState extends State<RasterLayers> {
   CustomRasterLayersExample? _customRasterLayersExample;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Raster Layers'),
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
                button('Enable', _enableButtonClicked),
                button('Disable', _disableButtonClicked),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onMapCreated(HereMapController hereMapController) {
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.normalDay, (MapError? error) {
      if (error == null) {
        _customRasterLayersExample = CustomRasterLayersExample(hereMapController);
      } else {
        print("Map scene not loaded. MapError: " + error.toString());
      }
    });
  }

  void _enableButtonClicked() {
    _customRasterLayersExample?.enableButtonClicked();
  }

  void _disableButtonClicked() {
    _customRasterLayersExample?.disableButtonClicked();
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
}