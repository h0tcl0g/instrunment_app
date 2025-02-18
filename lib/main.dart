import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // マーカー用のList
  List<Marker> addMarkers = [];

  // ピンを追加する関数
  void _addMarker(LatLng latlng) {
    // setStateを行うことで、マップを更新している
    setState(() {
      addMarkers.add(
        Marker(
          width: 30.0,
          height: 30.0,
          point: latlng,
          child: const Icon(
            Icons.location_on,
            color: Colors.blue,
            size: 50,
          ),
          rotate: true,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: const LatLng(35.170915, 136.881537),
          initialZoom: 10.0,

          // マップをタップした際の処理
          // pointはタップした位置がLatLng型で受け取れるので、引数にpointを渡す
          onTap: (tapPosition, point) {
            _addMarker(point);
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          //　MarkerLayerに追加したピンを指定する
          MarkerLayer(markers: addMarkers),
        ],
      ),
    );
  }
}
