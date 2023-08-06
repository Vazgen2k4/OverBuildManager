part of 'over_user.dart';

class Expenses {
  int? date;
  String? descr;
  int? price;

  Expenses({this.date, this.descr, this.price});

  Expenses.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    descr = json['descr'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['date'] = date;
    data['descr'] = descr;
    data['price'] = price;
    return data;
  }
}
