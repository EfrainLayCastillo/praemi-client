class PromosModel {
  int id;
  String name;
  String permalink;
  String status;
  bool featured;
  String description;
  String shortDescription;
  String sku;
  String price;
  String regularPrice;
  String stockStatus;
  String averageRating;
  int ratingCount;
  List<WooCategories> categories;
  List<ProdImages> images;

  PromosModel(
    { this.id,
      this.name,
      this.permalink,
      this.status,
      this.featured,
      this.description,
      this.shortDescription,
      this.sku,
      this.price,
      this.regularPrice,
      this.stockStatus,
      this.averageRating,
      this.ratingCount,
      this.categories,
      this.images,
    });

  PromosModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    permalink = json['permalink'];
    status = json['status'];
    featured = json['featured'];
    description = json['description'];
    shortDescription = json['short_description'];
    sku = json['sku'];
    price = json['price'];
    regularPrice = json['regular_price'];
    stockStatus = json['stock_status'];
    averageRating = json['average_rating'];
    ratingCount = json['rating_count'];
    if (json['categories'] != null) {
      categories = new List<WooCategories>();
      json['categories'].forEach((v) {
        categories.add(new WooCategories.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = new List<ProdImages>();
      json['images'].forEach((v) {
        images.add(new ProdImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['permalink'] = this.permalink;
    data['status'] = this.status;
    data['featured'] = this.featured;
    data['description'] = this.description;
    data['short_description'] = this.shortDescription;
    data['sku'] = this.sku;
    data['price'] = this.price;
    data['regular_price'] = this.regularPrice;
    data['stock_status'] = this.stockStatus;
    data['average_rating'] = this.averageRating;
    data['rating_count'] = this.ratingCount;
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WooCategories {
  int id;
  String name;
  String slug;

  WooCategories({this.id, this.name, this.slug});

  WooCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class ProdImages {
  int id;
  String src;

  ProdImages({ this.id, this.src});

  ProdImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    src = json['src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['src'] = this.src;
    return data;
  }
}

