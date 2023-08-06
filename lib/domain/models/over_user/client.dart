

import 'package:build_manager/domain/models/over_user/block.dart';

class Client {
  String? name;
  List<Block>? blocks;

  Client({this.name, this.blocks});

  Client.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['blocks'] != null) {
      blocks = <Block>[];
      json['blocks'].forEach((v) {
        blocks!.add(Block.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    if (blocks != null) {
      data['blocks'] = blocks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
