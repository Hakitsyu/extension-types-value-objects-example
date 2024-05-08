class InvalidEmailException implements Exception { }

class Emails {
  static bool isValid(String email) => _regex().hasMatch(email);

  static String name(String email) {
    final match = _regex().firstMatch(email);

    return match?.group(1) ?? '';
  }

  static String domain(String email) {
    final match = _regex().firstMatch(email);

    return match?.group(2) ?? '';
  }

  static RegExp _regex() 
    => RegExp(r'^([a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+)@([a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$'); 
}

class Validator {
  static void validate(String email) {
    if (!Emails.isValid(email)) throw InvalidEmailException();
  }
}

extension type EmailExtensionType._(String _email) {
  factory EmailExtensionType(String email) {
    Validator.validate(email);
    
    return EmailExtensionType._(email);
  }

  String get value => _email;

  String get domain => Emails.domain(value);

  String get name => Emails.name(value);
}

class EmailClass {
  late final String _value;
  
  EmailClass(String email) {
    Validator.validate(email);

    _value = email;
  }

  String get value => _value;

  String get domain => Emails.domain(value);

  String get name => Emails.name(value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmailClass &&
      runtimeType == other.runtimeType &&
      _value == other.value;

  @override
  int get hashCode => _value.hashCode;
}