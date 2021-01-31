
class DataCodeQrModel{
  int promoId;
  String userId;
  String tokenAuth;
  
  DataCodeQrModel({
    this.promoId = 99,
    this.userId = '',
    this.tokenAuth = ''
  });

  String toJsonStringFormat(){
    return '{"promoId":"$promoId","userId":"$userId","tokenAuth":"$tokenAuth"}';
  }

  factory DataCodeQrModel.fromJson(dynamic json) {
    return DataCodeQrModel(
      promoId: int.parse(json['promoId']), 
      userId: json['userId'] as String, 
      tokenAuth: json['tokenAuth'] as String 
    );
  }  

}