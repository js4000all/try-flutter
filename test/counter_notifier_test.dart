import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/counter_notifier.dart';

void main() {
  group('CounterNotifier', () {
    test('初期状態が正しい', () {
      // 準備
      final notifier = CounterNotifier();

      // 検証
      expect(notifier.state.count, 0);
      expect(notifier.state.limit, 5);
      expect(notifier.state.isLimitReached, false);
    });

    test('incrementでカウントが増加する', () {
      // 準備
      final notifier = CounterNotifier();

      // 実行
      notifier.increment();

      // 検証
      expect(notifier.state.count, 1);
      expect(notifier.state.isLimitReached, false);
    });

    test('limitに達するとそれ以上増加しない', () {
      // 準備
      final notifier = CounterNotifier();

      // 実行
      for (var i = 0; i < 6; i++) {
        notifier.increment();
      }

      // 検証
      expect(notifier.state.count, 5);
      expect(notifier.state.isLimitReached, true);
    });

    test('decrementでカウントが減少する', () {
      // 準備
      final notifier = CounterNotifier();
      notifier.increment();
      notifier.increment();

      // 実行
      notifier.decrement();

      // 検証
      expect(notifier.state.count, 1);
      expect(notifier.state.isLimitReached, false);
    });

    test('0未満には減少しない', () {
      // 準備
      final notifier = CounterNotifier();

      // 実行
      notifier.decrement();

      // 検証
      expect(notifier.state.count, 0);
      expect(notifier.state.isLimitReached, false);
    });
  });
}
