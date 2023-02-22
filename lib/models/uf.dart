class UF {
  int? id;
  String? initials;
  String? name;

  UF({this.id, this.initials, this.name});
  factory UF.fromJson(Map<String,dynamic> json) {
    return UF(
      id: json['id'],
      name: json['name'],
      initials: json['sigla']
    );
  }


}
