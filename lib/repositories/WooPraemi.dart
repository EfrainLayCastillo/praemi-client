import 'package:woocommerce/woocommerce.dart';

class WooPraemi extends WooCommerce{

  WooPraemi._();

  static const String baseUrlConst = "http://praemi.3.94.78.53.xip.io";
  static const String consumerKeyConst = "ck_d63ac7bdf64319678019f5b41d9a81b30b34f1b4";
  static const String consumerSecretConst = "cs_b2a29c2368789f4a6e70fc8677d715819830e94b";
  static const String apiPathConst = "/wp-json/wc/v3/";  

  static Future<WooCommerce> initWoo() async{
    
    return WooCommerce(
      baseUrl: baseUrlConst,
      consumerKey: consumerKeyConst,
      consumerSecret: consumerSecretConst,
      apiPath: apiPathConst,
      isDebug: true,
    );
    
  }
}