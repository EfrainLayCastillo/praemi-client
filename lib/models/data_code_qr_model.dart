class DataCodeQrModel {
  int promoId;
  String userId;
  String tokenAuth;
  
  DataCodeQrModel({
    this.promoId,
    this.userId,
    this.tokenAuth
  });

  String toJsonStringFormat(){
    return '{"promoId":"$promoId","userId":"$userId","tokenAuth":"$tokenAuth"}';
  }

  factory DataCodeQrModel.fromJson(dynamic json) {
    return DataCodeQrModel(
      promoId: json['promoId'] as int, 
      userId: json['userId'] as String, 
      tokenAuth: json['tokenAuth'] as String 
    );
  }

}