class Product {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Product({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  Product.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }
}