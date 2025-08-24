import 'package:flutter_riverpod/flutter_riverpod.dart';

class Limit extends StateNotifier<int> {
  static const int minLimit = 1;
  static const int maxLimit = 10;

  Limit({int? initialValue}) : super(initialValue ?? 5) {
    if (state < minLimit || state > maxLimit) {
      state = 5;
    }
  }

  void increment() {
    if (state < maxLimit) {
      state++;
    }
  }

  void decrement() {
    if (state > minLimit) {
      state--;
    }
  }
}

StateNotifierProvider<Limit, int> getLimitProvider(int limit) =>
    StateNotifierProvider<Limit, int>((ref) => Limit(initialValue: limit));
