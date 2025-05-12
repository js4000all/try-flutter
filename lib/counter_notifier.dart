import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef CounterState = ({int count, int limit, bool isLimitReached});

final counterProvider = StateNotifierProvider<CounterNotifier, CounterState>((
  ref,
) {
  return CounterNotifier();
});

class CounterNotifier extends StateNotifier<CounterState> {
  CounterNotifier() : super((count: 0, limit: 5, isLimitReached: false));

  void increment() {
    if (state.count < state.limit) {
      state = (
        count: state.count + 1,
        limit: state.limit,
        isLimitReached: state.count + 1 >= state.limit,
      );
    }
  }

  void decrement() {
    if (state.count > 0) {
      state = (
        count: state.count - 1,
        limit: state.limit,
        isLimitReached: false,
      );
    }
  }
}
