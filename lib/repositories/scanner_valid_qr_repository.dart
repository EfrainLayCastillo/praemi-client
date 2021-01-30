import 'dart:convert';

import 'package:praemiclient/utils/utilsFn.dart';

class ScannerValidQrRespository{

   Future<bool> validQrDataFn(String dataResult) async {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(dataResult);      // dXNlcm5hbWU6cGFzc3dvcmQ=
    String decoded = stringToBase64.decode(encoded); 

    print('#########');
    print('encoded -----> $encoded');
    print('#########');
    print('decoded -----> $decoded');
    return UtilsFn.validDataQrString(decoded);
  }

}