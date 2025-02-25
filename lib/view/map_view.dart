import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instrunment_app/component/flutter_map/packages.dart';
import 'package:instrunment_app/provider/map_provider.dart';

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final markers = ref.watch(markerProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(this.title),
      ),
      body: FlutterMap(
        mapController: mapController,
        // _animatedMapController.mapControllerを指定する。
        // mapController: _animatedMapController.mapController,
        options: MapOptions(
          initialCenter: const LatLng(35.170915, 136.881537),
          initialZoom: 10.0,

          // マップをタップした際の処理
          // pointはタップした位置がLatLng型で受け取れるので、引数にpointを渡す
          onTap: (tapPosition, point) {
            ref.read(markerProvider.notifier).addMarker(point, context);
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          //　MarkerLayerに追加したピンを指定する
          MarkerLayer(markers: markers),
          // 線を表示するレイヤー
          PolylineLayer(
            polylines: [
              Polyline(
                points: [
                  const LatLng(35.1, 136.85),
                  const LatLng(35.2, 136.80),
                  const LatLng(35.3, 136.89),
                  const LatLng(35.4, 136.82),
                ],
                strokeWidth: 3.0,
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
