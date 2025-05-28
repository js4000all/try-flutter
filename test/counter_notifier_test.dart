import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/counter_notifier.dart';

void main() {
  group('CounterNotifier', () {
    test('初期状態が正しい', () {
      // 準備
      final notifier = CounterNotifier(limit: 5);

      // 検証
      expect(notifier.state, 0);
    });

    test('incrementでカウントが増加する', () {
      // 準備
      final notifier = CounterNotifier(limit: 5);

      // 実行
      notifier.increment();

      // 検証
      expect(notifier.state, 1);
    });

    test('limitに達するとそれ以上増加しない', () {
      // 準備
      final notifier = CounterNotifier(limit: 5);

      // 実行
      for (var i = 0; i < 6; i++) {
        notifier.increment();
      }

      // 検証
      expect(notifier.state, 5);
    });

    test('decrementでカウントが減少する', () {
      // 準備
      final notifier = CounterNotifier(limit: 5);
      notifier.increment();
      notifier.increment();

      // 実行
      notifier.decrement();

      // 検証
      expect(notifier.state, 1);
    });

    test('0未満には減少しない', () {
      // 準備
      final notifier = CounterNotifier(limit: 5);

      // 実行
      notifier.decrement();

      // 検証
      expect(notifier.state, 0);
    });
  });
}
