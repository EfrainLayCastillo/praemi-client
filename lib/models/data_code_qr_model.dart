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
    return '{"promoId":"$promoId","userId":"$userId","token":"$tokenAuth"}';
  }

}