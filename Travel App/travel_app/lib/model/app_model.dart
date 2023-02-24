class AppModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  int? people;
  int? selectedPeople;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;

  AppModel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.stars,
      this.people,
      this.selectedPeople,
      this.img,
      this.location,
      this.createdAt,
      this.updatedAt});

  AppModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    people = json['people'];
    selectedPeople = json['selected_people'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['stars'] = stars;
    data['people'] = people;
    data['selected_people'] = selectedPeople;
    data['img'] = img;
    data['location'] = location;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
