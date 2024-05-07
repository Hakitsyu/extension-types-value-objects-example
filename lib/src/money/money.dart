class InvalidMoneyAmountException implements Exception { }

extension type MoneyExtensionType._(double _value) implements double {
    factory MoneyExtensionType(double value) {
      if (value < 0) {
        throw InvalidMoneyAmountException();
      }

      return MoneyExtensionType._(value);
    }

    double get value => _value;
}

class MoneyClass {
    late final double _value;

    MoneyClass(double value) {
      if (value < 0) {
        throw InvalidMoneyAmountException();
      }

      _value = value;
    }

    double get value => _value;

    operator + (double other) {
        return MoneyClass(value + other);
    }

    operator - (double other) {
        return MoneyClass(value - other);
    }

    @override
    bool operator ==(Object other) =>
        identical(this, other) ||
        other is MoneyClass &&
        runtimeType == other.runtimeType &&
        _value == other.value; 

    @override
    int get hashCode => _value.hashCode;
}