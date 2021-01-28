class DataCodeQrModel {
  int promoId;
  String vendorId;
  String userId;
  String tokenAuth;
  
  DataCodeQrModel({
    this.promoId,
    this.vendorId,
    this.userId,
    this.tokenAuth
  });

  String toJsonStringFormat(){
    return '{"promoId":"$promoId","vendorId":"$vendorId","userId":"$userId","token":"$tokenAuth"}';
  }

}