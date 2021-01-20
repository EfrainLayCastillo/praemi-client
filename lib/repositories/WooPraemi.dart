import 'package:woocommerce/woocommerce.dart';

class WooPraemi extends WooCommerce{

  WooPraemi._();

  

  static Future<WooCommerce> initializeWoo({ WooOptions wooOptions }) async{
    return WooCommerce(
      baseUrl: wooOptions.baseUrl,
      consumerKey: wooOptions.consumerKey,
      consumerSecret: wooOptions.consumerSecret,
    );
  }
}

class WooOptions{

  const WooOptions({
    this.baseUrl = baseUrlConst,
    this.consumerKey = consumerSecretConst,
    this.consumerSecret = consumerSecretConst,
  }): assert(baseUrl != null, "baseUrl cannot be null"),
      assert(consumerKey != null, "consumerKey cannot be null"),
      assert(consumerSecret != null, "consumerSecret cannot be null");

  final String baseUrl;
  final String consumerKey;
  final String consumerSecret;


  static const String baseUrlConst = "www.praemi.3.94.78.53.xip.io";
  static const String consumerKeyConst = "ck_d63ac7bdf64319678019f5b41d9a81b30b34f1b4";
  static const String consumerSecretConst = "cs_b2a29c2368789f4a6e70fc8677d715819830e94b";
}