class EquipmentModel {
  int? id;
  String? name;
  String? localizedName;
  String? image;

  EquipmentModel({this.id, this.name, this.localizedName, this.image});

  factory EquipmentModel.fromJson(json) => EquipmentModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        localizedName: json['localizedName'] as String?,
        image: json['image'] as String?,
      );

  toJson() => {
        'id': id,
        'name': name,
        'localizedName': localizedName,
        'image': image,
      };
}

class EquipmentsList {
  final List<EquipmentModel> items;

  EquipmentsList({
    required this.items,
  });

  factory EquipmentsList.fromJson(List<dynamic> list) {
    return EquipmentsList(
      items: list.map((data) => EquipmentModel.fromJson(data)).toList(),
    );
  }
}
