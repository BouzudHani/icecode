import 'package:games/translation/arabic.dart';
import 'package:get/get.dart';
import 'package:games/translation/english.dart';

class Messages extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'en' : en,
    'ar' : ar
  };

}