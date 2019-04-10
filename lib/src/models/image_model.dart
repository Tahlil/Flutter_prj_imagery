class ImageModel {
  String id;
  String url;
  String title;
  int likes;
  
  ImageModel(this.id, this.url, this.title, this.likes);

  ImageModel.fromJson(Map<String, dynamic> parsedJson){
    id = parsedJson['id'];
    url = parsedJson['urls']['raw'] + "&w=600&h=600";
    print("url: " + url);
    if(parsedJson['descrption'] == null){
      title = parsedJson['alt_descrption'];
    }
    else{
      title = parsedJson['descrption'];
    }
    likes = parsedJson['likes'];
  }
}