import 'package:intl/intl.dart';

/// Extensions for String
extension ExtendedDate on DateTime {
  /// Gives you defualt locale date as May 31, 2020 5:41:42 PM
  String get fullDate {
    return DateFormat().format(this);
  }

  /// Gives you defualt locale date as 2020-05-31 05:41:42
  String get fullSmallDate {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(this);
  }

  /// Gives you long date as May 31, 2020
  String get longDate {
    return DateFormat.yMMMMd().format(this);
  }

  /// Gives you short date as 5/31/2020
  String get shortDate {
    return DateFormat.yMd().format(this);
  }

  /// Gives you time only as 5:41:42 PM
  String get timeOnly {
    return DateFormat.jms().format(this);
  }
}
