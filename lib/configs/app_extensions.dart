import 'package:intl/intl.dart';

extension NumExtension on num {
  /// Change to currency format
  String formatToCurrencyForm() {
    var f = NumberFormat('###,###.00#', 'en_US');
    return f.format(this);
  }
}
