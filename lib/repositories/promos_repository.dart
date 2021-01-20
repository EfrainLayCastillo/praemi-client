
import 'package:praemiclient/models/promos_model.dart';
import 'package:praemiclient/repositories/WooPraemi.dart';
import 'package:woocommerce/woocommerce.dart';

class PromosRepository {
  
//Get Promos List WooCommerce
//Convert WooProduct to Model PromosModel
  Future<List<PromosModel>> getPromosListWooCommerce() async {
    final wooPraemi = await WooPraemi.initWoo();
    _getToken();
    List<WooProduct> productsList = await wooPraemi.getProducts();

    return productsList.map((prod) => 
      PromosModel(
        id: prod.id,
        name: prod.name,
        permalink: prod.permalink,
        status: prod.status,
        featured: prod.featured,
        description: prod.description,
        shortDescription: prod.shortDescription,
        sku: prod.sku,
        price : prod.price,
        regularPrice : prod.regularPrice,
        stockStatus : prod.stockStatus,
        averageRating : prod.averageRating,
        ratingCount : prod.ratingCount,
        categories : (prod.categories).map((cat) => WooCategories(
          id: cat.id,
          name: cat.name,
          slug: cat.slug
        )).toList(),
        images : (prod.images).map((img) => ProdImages(
          id: img.id,
          src: img.src
        )).toList(),
        
    )).toList();
  }

  _getToken() async {
    WooCommerce commerce = await WooPraemi.initWoo();
    final userAuth = await commerce.authenticateViaJWT( username: "restapi", password: "#Panama01" );
    print("Este es el token: $userAuth");
    print("GET TOKEN EXECUTED");
  }

}