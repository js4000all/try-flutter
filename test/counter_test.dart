import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/counter.dart';

void main() {
  group('Counter', () {
    test('初期状態が正しい', () {
      // 準備
      final counter = Counter(limit: 5);

      // 検証
      expect(counter.state, 0);
    });

    test('incrementでカウントが増加する', () {
      // 準備
      final counter = Counter(limit: 5);

      // 実行
      counter.increment();

      // 検証
      expect(counter.state, 1);
    });

    test('limitに達するとそれ以上増加しない', () {
      // 準備
      final counter = Counter(limit: 5);

      // 実行
      for (var i = 0; i < 6; i++) {
        counter.increment();
      }

      // 検証
      expect(counter.state, 5);
    });

    test('decrementでカウントが減少する', () {
      // 準備
      final counter = Counter(limit: 5);
      counter.increment();
      counter.increment();

      // 実行
      counter.decrement();

      // 検証
      expect(counter.state, 1);
    });

    test('0未満には減少しない', () {
      // 準備
      final counter = Counter(limit: 5);

      // 実行
      counter.decrement();

      // 検証
      expect(counter.state, 0);
    });
  });
}
