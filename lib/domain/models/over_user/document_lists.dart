part of 'over_user.dart';

class DocumetLists extends Equatable {
  final String? name;

  const DocumetLists({this.name});

  factory DocumetLists.fromJson(Map<String, dynamic> json) {
    final name = json['name'];

    return DocumetLists(name: name);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    
    return data;
  }

  @override
  List<Object?> get props => [name];
}
