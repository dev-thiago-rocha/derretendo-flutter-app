class PostModel {
  var title;
  var creationUserName;
  var description;
  var link;
  var creationDateTime;
  var price;

  PostModel({
    this.title,
    this.creationUserName,
    this.description,
    this.link,
    this.creationDateTime,
    this.price,
  });

  factory PostModel.fromJson(Map<String, dynamic> parsedJson) {
    return PostModel(
        title: parsedJson['title'].toString(),
        creationUserName: parsedJson['creationUserName'].toString(),
        description: parsedJson['description'].toString(),
        link: parsedJson['link'].toString(),
        creationDateTime: parsedJson['creationDateTime'].toString(),
        price: parsedJson['price'].toString());
  }
}
