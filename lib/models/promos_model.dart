class PromosModel {
  int id;
  String name;
  String slug;
  String permalink;
  String dateCreated;
  String dateModified;
  String type;
  String status;
  bool featured;
  String description;
  String shortDescription;
  String sku;
  String price;
  String regularPrice;
  String salePrice;
  Null stockQuantity;
  String stockStatus;
  String averageRating;
  int ratingCount;
  List<int> relatedIds;
  List<Categories> categories;
  List<Images> images;

  PromosModel(
    { this.id,
      this.name,
      this.slug,
      this.permalink,
      this.dateCreated,
      this.dateModified,
      this.type,
      this.status,
      this.featured,
      this.description,
      this.shortDescription,
      this.sku,
      this.price,
      this.regularPrice,
      this.salePrice,
      this.stockQuantity,
      this.stockStatus,
      this.averageRating,
      this.ratingCount,
      this.relatedIds,
      this.categories,
      this.images,
    });

  PromosModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    permalink = json['permalink'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    type = json['type'];
    status = json['status'];
    featured = json['featured'];
    description = json['description'];
    shortDescription = json['short_description'];
    sku = json['sku'];
    price = json['price'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    stockQuantity = json['stock_quantity'];
    stockStatus = json['stock_status'];
    averageRating = json['average_rating'];
    ratingCount = json['rating_count'];
    relatedIds = json['related_ids'].cast<int>();
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['permalink'] = this.permalink;
    data['date_created'] = this.dateCreated;
    data['date_modified'] = this.dateModified;
    data['type'] = this.type;
    data['status'] = this.status;
    data['featured'] = this.featured;
    data['description'] = this.description;
    data['short_description'] = this.shortDescription;
    data['sku'] = this.sku;
    data['price'] = this.price;
    data['regular_price'] = this.regularPrice;
    data['sale_price'] = this.salePrice;
    data['stock_quantity'] = this.stockQuantity;
    data['stock_status'] = this.stockStatus;
    data['average_rating'] = this.averageRating;
    data['rating_count'] = this.ratingCount;
    data['related_ids'] = this.relatedIds;
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int id;
  String name;
  String slug;

  Categories({this.id, this.name, this.slug});

  Categories.fromJson(Map<String, dynamic> json) {
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

class Images {
  int id;
  String src;
  String name;

  Images({ this.id, this.src, this.name});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    src = json['src'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['src'] = this.src;
    data['name'] = this.name;
    return data;
  }
}
