import 'dart:convert';

import 'package:praemiclient/models/data_code_qr_model.dart';
import 'package:praemiclient/models/user.dart';
import 'package:praemiclient/services/WordpressAPI.dart';
import 'package:praemiclient/utils/utilsFn.dart';

class ScannerValidQrRespository{

  WordpressAPI _query = WordpressAPI();
  
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

  Future<DataCodeQrModel> convertStringtoDataModelFn(String dataResult) async {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(dataResult);      // dXNlcm5hbWU6cGFzc3dvcmQ=
    String decoded = stringToBase64.decode(encoded); 

    print('#########');
    print('encoded -----> $encoded');
    print('#########');
    print('decoded -----> $decoded');
    return DataCodeQrModel.fromJson(decoded);
  }

  Future<bool> createOrderByUser(DataCodeQrModel dataCodeQrModel) async {
    User _userGet = User.fromJson(await  _query.queryGetUserByToken(dataCodeQrModel.tokenAuth));
    _userGet.tokenAuth = dataCodeQrModel.tokenAuth;
    print(_userGet.email);
    return _userGet.email.isNotEmpty ? true : false;
    //_query.queryMakeOrder(userData: _userGet, productID: dataCodeQrModel.promoId );

  }


}