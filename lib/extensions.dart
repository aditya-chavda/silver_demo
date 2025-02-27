import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String format() {
    return DateFormat('d/MM/yy').format(this);
  }
}
