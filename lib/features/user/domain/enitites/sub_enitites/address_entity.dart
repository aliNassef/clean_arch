
 import 'geo_entity.dart';

class AddressEnitity {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoEnitity geo;

  AddressEnitity({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });
}