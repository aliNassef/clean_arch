import 'sub_enitites/address_entity.dart';

class UserEntitiy {
  final String name;
  final String email;
  final String phone;
  final AddressEnitity address;

  UserEntitiy({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });
}
