
class Categorie {
  String? name;
  int? priceOfMeter;
  double? square;

  Categorie({this.name, this.priceOfMeter, this.square});

  Categorie.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    priceOfMeter = json['price_of_meter'];
    square = json['square'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['price_of_meter'] = priceOfMeter;
    data['square'] = square;
    return data;
  }
}
