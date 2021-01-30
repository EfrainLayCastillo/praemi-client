class UtilsFn {

  UtilsFn._();

  static String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(
      r"<[^>]*>",
      multiLine: true, caseSensitive: true
    );
    return htmlText.replaceAll(exp, '');
  }

  static bool validDataQrString(String data){
    return data.contains('token') ? true : false;
  }

}