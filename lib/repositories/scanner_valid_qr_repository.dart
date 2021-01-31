import 'dart:convert';

import 'package:praemiclient/models/data_code_qr_model.dart';
import 'package:praemiclient/models/order.dart';
import 'package:praemiclient/models/user.dart';
import 'package:praemiclient/services/WordpressAPI.dart';
import 'package:praemiclient/utils/utilsFn.dart';

class ScannerValidQrRespository {
  WordpressAPI _query = WordpressAPI();

  Future<bool> validQrDataFn(String dataResultEncoded) async {
    String decodedData = UtilsFn.decodedDataQrString(dataResultEncoded);
    print('############');
    print('decoded -----> $decodedData');
    print('############');
    return UtilsFn.validDataQrString(decodedData);
  }

  Future<DataCodeQrModel> convertStringtoDataModelFn(
      String dataResultEncoded) async {
    String decodedData = UtilsFn.decodedDataQrString(dataResultEncoded);
    return DataCodeQrModel.fromJson(jsonDecode(decodedData));
  }

  Future<bool> createOrderByUser(DataCodeQrModel dataCodeQrModel) async {
    Map<String, dynamic> jsonResp =
        await _query.queryGetUserByToken(dataCodeQrModel.tokenAuth);
    User _userGet = User.fromJson(jsonResp);

    _userGet.tokenAuth = dataCodeQrModel.tokenAuth;

    print('ID USER GET : ${_userGet.idUser}');
    if (_userGet.email.isNotEmpty) {
      return await _query.queryMakeOrder(
          userData: _userGet, productID: dataCodeQrModel.promoId);
    } else {
      return false;
    }
  }
}
