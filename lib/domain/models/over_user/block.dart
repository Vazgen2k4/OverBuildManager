


import 'package:build_manager/domain/models/over_user/categorie.dart';

class Block {
  String? name;
  List<Categorie>? categories;

  Block({this.name, this.categories});

  Block.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['categories'] != null) {
      categories = <Categorie>[];
      json['categories'].forEach((v) {
        categories!.add(Categorie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
