import 'package:logger/logger.dart';

/*
logger.v("Verbose log");
logger.d("Debug log");
logger.i("Info log");
logger.w("Warning log");
logger.e("Error log");
logger.wtf("What a terrible failure log");
*/

Logger logger = Logger(
  printer: PrefixPrinter(
    PrettyPrinter(
      printEmojis: true,
      printTime: true,
      lineLength: 120,
      methodCount: 5,
    ),
  ),
);
