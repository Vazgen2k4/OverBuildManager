import 'package:equatable/equatable.dart';

part 'document_lists.dart';
part 'catigories.dart';
part 'expenses.dart';

class OverUser extends Equatable {
  final List<DocumetLists> lists;
  final String? tableId;
  final String? phone;
  final String? name;
  final List<Categories> categories;

  const OverUser({
    required this.categories,
    required this.lists,
    this.tableId,
    this.phone,
    this.name,
  });

  factory OverUser.fromJson(Map<String, dynamic> json) {
    final categories = <Categories>[];
    if (json['Categories'] != null) {
      json['Categories'].forEach((v) {
        categories.add(Categories.fromJson(v));
      });
    }
    final lists = <DocumetLists>[];
    if (json['lists'] != null) {
      json['lists'].forEach((v) {
        lists.add(DocumetLists.fromJson(v));
      });
    }
    final tableId = json['table_id'];
    final phone = json['phone'];
    final name = json['name'];

    return OverUser(
      lists: lists,
      name: name,
      tableId: tableId,
      phone: phone,
      categories: categories,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['table_id'] = tableId;
    data['phone'] = phone;
    data['name'] = name;
    data['lists'] = lists.isEmpty ? [] : lists.map((v) => v.toJson()).toList();
    data['Categories'] =
        categories.isEmpty ? [] : categories.map((v) => v.toJson()).toList();
    return data;
  }

  OverUser copyWith({
    List<DocumetLists>? lists,
    List<Categories>? categories,
    String? tableId,
    String? phone,
    String? name,
  }) {
    return OverUser(
      lists: lists ?? this.lists,
      tableId: tableId ?? this.tableId,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [name, phone, tableId, lists, categories];
}
