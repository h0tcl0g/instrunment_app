import 'package:hooks_riverpod/hooks_riverpod.dart';

class DataNotifier extends StateNotifier<String> {
  DataNotifier() : super('初期データ');

  void updateData() {
    state = '更新されたデータ';
  }
}

final dataProvider = StateNotifierProvider<DataNotifier, String>((ref) {
  return DataNotifier();
});
