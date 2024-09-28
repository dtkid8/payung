import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String format() {
    NumberFormat format =
        NumberFormat.currency(locale: "id", symbol: "", decimalDigits: 0);
    return format.format(this);
  }
}