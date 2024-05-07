extension type MoneyExtensionType(double _value) implements double {
    double get value => _value;
}

class MoneyClass {
    final double _value;

    MoneyClass(this._value);

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