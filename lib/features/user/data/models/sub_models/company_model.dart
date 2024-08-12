class CompanyModel {
  final String name;
  final String catchPhrase;
  final String bs;

  CompanyModel({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      bs: json['bs'],
      catchPhrase: json['catchPhrase'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bs': bs,
      'catchPhrase': catchPhrase,
      'name': name,
    };
  }
}
