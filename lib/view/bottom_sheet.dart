import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../provider/data_provider.dart';
import 'package:smooth_sheets/smooth_sheets.dart';
import 'package:smooth_sheets/src/foundation/sheet_viewport.dart';

class BottomSheetUI extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(dataProvider);

    // Future<bool?> showCancelDialog(BuildContext context) {
    //   return showDialog<bool>(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Text('確認'),
    //         content: Text('本当にキャンセルしますか？'),
    //         actions: <Widget>[
    //           TextButton(
    //             child: Text('いいえ'),
    //             onPressed: () {
    //               Navigator.of(context).pop(false);
    //             },
    //           ),
    //           TextButton(
    //             child: Text('はい'),
    //             onPressed: () {
    //               Navigator.of(context).pop(true);
    //             },
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }

    // return SafeArea(
    //   bottom: false,
    //   child: PopScope(
    //       canPop: false,
    //       onPopInvokedWithResult: (didPop, result) async {
    //         if (!didPop) {
    //           // final shouldPop = await showCancelDialog(context) ?? false;
    //           // if (shouldPop && context.mounted) {
    //           //   context.go('/');
    //           // }
    //         }
    //       },
    //       child: SheetViewport(
    //         child: ScrollableSheet(
    //           physics: BouncingSheetPhysics(
    //             parent: SnappingSheetPhysics(
    //               behavior: SnapToNearest(
    //                 anchors: [
    //                   SheetAnchor.proportional(0.2),
    //                   SheetAnchor.proportional(0.8),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           minPosition: SheetAnchor.proportional(0.2),
    //           child: Card(
    //             margin: EdgeInsets.zero,
    //             clipBehavior: Clip.antiAlias,
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    //             ),
    //             child: Column(
    //               children: [
    //                 SheetDraggable(
    //                   child: Container(
    //                     height: 80,
    //                     child: Center(
    //                       child: Text(
    //                         'データ: $data',
    //                         style: Theme.of(context).textTheme.headlineSmall,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 Expanded(
    //                   child: ListView(
    //                     children: [
    //                       ListTile(
    //                         leading: Icon(Icons.update),
    //                         title: Text('データを更新'),
    //                         onTap: () {
    //                           ref.read(dataProvider.notifier).state = '新しいデータ';
    //                         },
    //                       ),
    //                       ListTile(
    //                         leading: Icon(Icons.close),
    //                         title: Text('閉じる'),
    //                         onTap: () {
    //                           Navigator.of(context).pop();
    //                         },
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       )),
    // );

    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('データ: $data', style: Theme.of(context).textTheme.headlineSmall),
          ListTile(
            leading: Icon(Icons.update),
            title: Text('データを更新'),
            onTap: () {
              ref.read(dataProvider.notifier).state = '新しいデータ';
            },
          ),
          ListTile(
            leading: Icon(Icons.close),
            title: Text('閉じる'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
