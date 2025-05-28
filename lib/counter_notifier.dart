import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends StateNotifier<int> {
  final int limit;

  CounterNotifier({required this.limit}) : super(0);

  void increment() {
    if (state < limit) {
      state++;
    }
  }

  void decrement() {
    if (state > 0) {
      state--;
    }
  }
}

final getCounterNotifierProvider =
    StateNotifierProvider.family<CounterNotifier, int, int>(
      (ref, limit) => CounterNotifier(limit: limit),
    );
