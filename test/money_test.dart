import 'package:extension_types_value_objects_example/src/money/money.dart';
import 'package:test/test.dart';

import 'shared/is_boolean.dart';

void main() {
  equals_test();
  sum_test();
}

void equals_test() {
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
            test('${p1} is equal to ${p2}', () {
                final result = MoneyClass(p1) == MoneyClass(p2);
                expect(result, isBoolean(p3));
            });
        });

        group('extension types', () {
            test('${p1} is equal to ${p2}', () {
                final result = MoneyExtensionType(p1) == MoneyExtensionType(p2);
                expect(result, isBoolean(p3));
            });
        });
    });
  });
}

void sum_test() {
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
            test('${p1} + ${p2} is equal to ${p3}', () {
                final result = (MoneyClass(p1) + MoneyClass(p2).value) as MoneyClass;
                
                expect(result.value, equals(p3));
            });
        });

        group('extension types', () {
            test('${p1} + ${p2} is equal to ${p3}', () {
                final result = MoneyExtensionType(p1) + MoneyExtensionType(p2);
                expect(result, equals(p3));
            });
        });
    });
  });
}