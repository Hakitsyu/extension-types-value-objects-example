import 'package:extension_types_value_objects_example/src/money/money.dart';
import 'package:test/test.dart';

void main() {
  testEquals();
  testSum();
  testAmount();
}

void testEquals() {
  const cases = [
    [10.0, 20.0, false],
    [30.0, 45.0, false],
    [5.0, 5.0,  true],
    [4.0, 3.0, false],
    [6.0, 6.0, true],
    [30.5, 30.5, true],
    [100.55, 100.55, true]
  ];

  group('equals', () {
    cases.forEach((caze) { 
      final p1 = caze[0] as double;
      final p2 = caze[1] as double;
      final p3 = caze[2] as bool;

      group('class', () {
        test('$p1 is equal to $p2', () {
            final result = MoneyClass(p1) == MoneyClass(p2);
            expect(result, equals(p3));
        });
      });

      group('extension types', () {
        test('$p1 is equal to $p2', () {
          final result = MoneyExtensionType(p1) == MoneyExtensionType(p2);
          expect(result, equals(p3));
        });
      });
    });
  });
}

void testSum() {
  const cases = [
    [10.0, 20.0, 30.0],
    [20.0, 20.0, 40.0],
    [20.5, 20.5, 41.0],
    [55.5, 55.5, 111.0]
  ];
  
  group('sum', () {
    cases.forEach((caze) { 
      final p1 = caze[0] as double;
      final p2 = caze[1] as double;
      final p3 = caze[2] as double;

      group('class', () {
        test('$p1 + $p2 is equal to $p3', () {
          final result = (MoneyClass(p1) + MoneyClass(p2).value) as MoneyClass;
          
          expect(result.value, equals(p3));
        });
      });

      group('extension types', () {
        test('$p1 + $p2 is equal to $p3', () {
          final result = MoneyExtensionType(p1) + MoneyExtensionType(p2);
          expect(result, equals(p3));
        });
      });
    });
  });
}

void testAmount() {
  const cases = [
    [10.0, true],
    [5000.0, true],
    [15000.0, true],
    [-100.0, false],
    [-1000.0, false],
    [-500.0, false],
    [-0.5, false]
  ];

  group('amount', () {
    cases.forEach((caze) { 
      final p1 = caze[0] as double;
      final p2 = caze[1] as bool;

      group('class', () {
        test('$p1 amount is valid', () {
          expect(() => MoneyClass(p1), p2 
            ? isNotNull : throwsA(TypeMatcher<InvalidMoneyAmountException>()));
        });
      });

      group('extension types', () {
        test('$p1 amount is valid', () {
          expect(() => MoneyExtensionType(p1), p2 
            ? isNotNull : throwsA(TypeMatcher<InvalidMoneyAmountException>()));
        });
      });
    });
  });
}