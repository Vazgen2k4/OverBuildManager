import 'package:build_manager/domain/models/over_user/client.dart';
import 'package:equatable/equatable.dart';

final class OverUser extends Equatable {
  final String? name;
  final String? email;
  final List<Client>? clients;

  const OverUser({this.name, this.email, this.clients});

  factory OverUser.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final email = json['email'];

    final clients = <Client>[];

    if (json['Clients'] != null) {
      json['Clients'].forEach((v) {
        clients.add(Client.fromJson(v));
      });
    }

    return OverUser(
      name: name,
      clients: clients,
      email: email,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['email'] = email;
    if (clients != null) {
      data['Clients'] = clients!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  OverUser copyWith({
    String? name,
    String? email,
    List<Client>? clients,
  }) {
    return OverUser(
      name: name ?? this.name,
      email: email ?? this.email,
      clients: clients ?? this.clients,
    );
  }
  
  @override
  List<Object?> get props => [name, email];
}
