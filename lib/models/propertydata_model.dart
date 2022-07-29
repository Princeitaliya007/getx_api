class PropertyDataModel {
  String? id;
  String? proName;
  String? proDescription;
  String? proImage;
  String? phoneNumber;
  String? category;
  int? price;
  int? areasfit;
  String? address;

  PropertyDataModel({
    required this.id,
    required this.proName,
    required this.proDescription,
    required this.proImage,
    required this.phoneNumber,
    required this.category,
    required this.price,
    required this.areasfit,
    required this.address,
  });

  factory PropertyDataModel.fromJson(Map<String, dynamic> data) {
    return PropertyDataModel(
        id: data['_id'],
        proName: data['propertyName'],
        proDescription: data['propertyDescription'],
        proImage: data['propertyImage'],
        phoneNumber: data['phoneNumber'],
        category: data['propertyCategory'],
        price: data['price'],
        areasfit: data['areaSquareFt'],
        address: data['address']);
  }
}
