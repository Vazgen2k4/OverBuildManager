part of 'over_user.dart';

class Categories extends Equatable {
  final List<Expenses> expenses;
  final String? name;

  const Categories({required this.expenses, this.name});

  factory Categories.fromJson(Map<String, dynamic> json) {
    final _expenses = <Expenses>[];

    if (json['Expenses'] != null) {
      json['Expenses'].forEach((v) {
        _expenses.add(Expenses.fromJson(v));
      });
    }
    String? _name = json['name'];

    return Categories(name: _name, expenses: _expenses);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Expenses'] =
        expenses.isEmpty ? [] : expenses.map((v) => v.toJson()).toList();

    data['name'] = name;
    return data;
  }

  @override
  List<Object?> get props => [name, expenses];
}
