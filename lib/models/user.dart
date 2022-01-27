const nameKey = 'name';
const passwordKey = 'password';
const descriptionKey = 'description';
const idKey = 'id';
const imageKey = "image";

class User{
  late int id;
  late String name;
  late String password;
  late String description;
  late String image;

  Map<String, dynamic> toJson(){
    return {
      idKey: id,
      nameKey: name,
      passwordKey: password,
      descriptionKey: description,
      imageKey: image,
    };
  }
  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json[nameKey];
    password = json[passwordKey];
    description = json[descriptionKey];
    image = json[imageKey];
  }
}