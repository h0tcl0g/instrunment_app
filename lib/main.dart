import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'view/map_view.dart';
import 'view/bottom_sheet.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
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
      home: MapViewWithBottomSheet(),
    );
  }
}

class MapViewWithBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MapView(title: 'Flutter Demo Home Page'),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => BottomSheetUI(),
              );
            },
            child: Text('ボトムシート表示'),
          ),
        ),
      ],
    );
  }
}
