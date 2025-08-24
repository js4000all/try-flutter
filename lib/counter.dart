import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'limit.dart';

class Counter extends StateNotifier<int> {
  final int limit;

  Counter({required this.limit}) : super(0);

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

StateNotifierProvider<Counter, int> getCounterProvider(
  StateNotifierProvider<Limit, int> limitProvider,
) => StateNotifierProvider<Counter, int>((ref) {
  final limit = ref.watch(limitProvider);
  return Counter(limit: limit);
});
