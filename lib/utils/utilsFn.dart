import 'dart:convert';

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
    return data.contains('tokenAuth') ? true : false;
  }

  static String decodedDataQrString(String dataEncoded){
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String decoded = stringToBase64.decode(dataEncoded); 
    return decoded;
  }

  static String encodedDataQrString(String dataDecoded){
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(dataDecoded);
    return encoded;
  }

}