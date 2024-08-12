import 'package:clean_arch/features/user/domain/enitites/user_entity.dart';

import 'sub_models/company_model.dart';

class UserModel extends UserEntitiy {
  final int id;
  final String website;
  final String username;
  final CompanyModel company;
  UserModel({
    required super.name,
    required super.email,
    required super.phone,
    required super.address,
    required this.website,
    required this.username,
    required this.id,
    required this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      website: json['website'],
      username: json['username'],
      id: json['id'],
      company: CompanyModel.fromJson(json['company']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'website': website,
      'username': username,
      'id': id,
      'company': company.toJson(),
    };
  }
}
