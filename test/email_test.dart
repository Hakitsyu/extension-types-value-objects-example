import 'package:extension_types_value_objects_example/src/email/email.dart';
import 'package:test/test.dart';

void main() {
  testEmails();
  testDomains();
  testNames();
}

void testEmails() {
  const cases = [
    ['helloworld@gmail.com', true],
    ['@gmail.com', false],
    ['hello0123@gmail.com', true],
    ['gmail.com', false]
  ];

  group('emails', () {
    cases.forEach((caze) { 
      final p1 = caze[0] as String;
      final p2 = caze[1] as bool;

      group('class', () {
        test('$p1 is valid', () {
          expect(() => EmailClass(p1), p2
            ? isNotNull : throwsA(TypeMatcher<InvalidEmailException>()));
        });
      });

      group('extension types', () {
        test('$p1 is valid', () {
          expect(() => EmailExtensionType(p1), p2
            ? isNotNull : throwsA(TypeMatcher<InvalidEmailException>()));
        });
      });
    });
  });
}

void testDomains() {
  const cases = [
    ['helloworld@gmail.com', 'gmail'],
    ['helloworld@hotmail.com', 'hotmail'],
    ['123@xyz.com', 'xyz'],
    ['123@no.com', 'no']
  ];

  group('domains', () {
    cases.forEach((caze) { 
      final p1 = caze[0] as String;
      final p2 = caze[1] as String;

      group('class', () {
        test('$p1 has the domain $p2', () {
          final email = EmailClass(p1);

          expect(email.domain, equals(p2));
        });
      });

      group('extension types', () {
        test('$p1 has the domain $p2', () {
          final email = EmailExtensionType(p1);

          expect(email.domain, equals(p2));
        });
      });
    });
  });
}

void testNames() {
  const cases = [
    ['helloworld@gmail.com', 'helloworld'],
    ['helloworld123@hotmail.com', 'helloworld123'],
    ['123@xyz.com', '123'],
    ['321.he@no.com', '321.he']
  ];

  group('names', () {
    cases.forEach((caze) { 
      final p1 = caze[0] as String;
      final p2 = caze[1] as String;

      group('class', () {
        test('$p1 has the name $p2', () {
          final email = EmailClass(p1);

          expect(email.name, equals(p2));
        });
      });

      group('extension types', () {
        test('$p1 has the name $p2', () {
          final email = EmailExtensionType(p1);

          expect(email.name, equals(p2));
        });
      });
    });
  });
}