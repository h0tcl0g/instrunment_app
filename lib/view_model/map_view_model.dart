// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:instrunment_app/component/flutter_map/packages.dart';
// import 'package:instrunment_app/view_model/map_view_model.dart';

// class _MyHomePageState extends StateNotifier<List<Marker>> {
//   // マーカー用のList
//   List<Marker> addMarkers = [];
//   // AnimatedMapControllerのインスタンス作成
//   late final _animatedMapController = AnimatedMapController(vsync: this);

//   // ピンを追加する関数
//   void _addMarker(LatLng latlng) {
//     setState(() {
//       addMarkers.add(
//         Marker(
//           width: 30.0,
//           height: 30.0,
//           point: latlng,
//           child: GestureDetector(
//             onTap: () {
//               // animateToで、引数の位置に滑らかにマップの中心を移動する
//               _animatedMapController.animateTo(dest: latlng);
//             },
//             child: const Icon(
//               Icons.location_on,
//               color: Colors.blue,
//               size: 50,
//             ),
//           ),
//         ),
//       );
//     });
//   }

//   void _showAlert(LatLng latlng) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('ピンの位置'),
//         content: Text('緯度: ${latlng.latitude}, 経度: ${latlng.longitude}'),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('閉じる'),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//         ],
//       ),
//     );
//   }
// }
