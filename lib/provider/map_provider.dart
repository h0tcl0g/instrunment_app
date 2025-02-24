import 'package:flutter/material.dart';
import 'package:instrunment_app/component/flutter_map/packages.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final markerProvider = StateNotifierProvider<MarkerNotifier, List<Marker>>(
    (ref) => MarkerNotifier());

class MarkerNotifier extends StateNotifier<List<Marker>> {
  MarkerNotifier() : super([]);

  void addMarker(LatLng latlng) {
    state.add(
      Marker(
        width: 30.0,
        height: 30.0,
        point: latlng,
        child: GestureDetector(
          child: const Icon(
            Icons.location_on,
            color: Colors.blue,
            size: 50,
          ),
        ),
      ),
    );
  }
}

// class MarkerWidget extends StatefulWidget {
//   @override
//   _MarkerWidgetState createState() => _MarkerWidgetState();
// }

// class _MarkerWidgetState extends State<MarkerWidget>
//     with TickerProviderStateMixin {
//   late final AnimatedMapController _animatedMapController;

//   @override
//   void initState() {
//     super.initState();
//     _animatedMapController = AnimatedMapController(vsync: this);
//   }

//   void addMarker(LatLng latlng) {
//     final marker = Marker(
//       width: 30.0,
//       height: 30.0,
//       point: latlng,
//       child: GestureDetector(
//         onTap: () {
//           _animatedMapController.animateTo(dest: latlng);
//         },
//         child: const Icon(
//           Icons.location_on,
//           color: Colors.blue,
//           size: 50,
//         ),
//       ),
//     );

//     context.read(markerProvider.notifier).addMarker(marker);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(); // 実際のUIをここに構築します
//   }
// }
