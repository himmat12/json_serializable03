class District {
  int id;
  List bbox = [];
  String title_en;
  String title_np;
  int provience;
  Centroid centroid;

  District.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        bbox = json['bbox'],
        title_en = json['title_en'],
        title_np = json['title_ne'],
        provience = json['province'],
        centroid = Centroid.fromJson(json['centroid']);
}

class Centroid {
  List coordinates = [];

  Centroid.fromJson(Map<String, dynamic> json)
      : coordinates = json['coordinates'];
}
