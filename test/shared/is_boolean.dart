import 'package:test/test.dart';

class _IsBoolean extends Matcher {
  final bool _value;

  _IsBoolean(this._value);
  
  @override
  bool matches(Object? item, Map matchState) => item == _value;
  @override
  Description describe(Description description) => description.add(_value ? 'true' : 'false');
}

var isBoolean = (bool value) => _IsBoolean(value);