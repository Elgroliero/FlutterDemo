class Cat {
  String? id;
  String? urlImage;
  int? width;
  int? height;

  Cat(this.id, this.urlImage, this.width, this.height);

  Cat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    urlImage = json['url'];
    width = json['width'];
    height = json['height'];
  }
}
