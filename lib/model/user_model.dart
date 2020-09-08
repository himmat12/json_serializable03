class User {
  String name;
  String email;
  String userName;
  Address address;

  User.fromjson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        userName = json['username'],
        address = Address.fromJson(json['address']);
}

class Address {
  String city;
  Geo geo;

  Address.fromJson(Map<String, dynamic> json)
      : city = json['city'],
        geo = Geo.fromJson(json['geo']);
}

class Geo {
  String lat;
  String lng;

  Geo.fromJson(Map<String, dynamic> json)
      : lat = json['lat'],
        lng = json['lng'];
}
