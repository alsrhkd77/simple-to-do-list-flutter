import 'package:intl/intl.dart';

class DateTimeFormatter {
  
  /*
 * DateTime 형식을 String 형식으로 변환해서 반환
 */
  static String dateTimeToString(DateTime dateTime) {
    return DateFormat('yyyy.MM.dd').format(dateTime);
  }
}
