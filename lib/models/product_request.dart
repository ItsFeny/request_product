class ProductRequest {
  final String id;
  final String productType;
  final String name;
  final String email;
  final String phone;
  final DateTime requestDate;

  ProductRequest({
    required this.id,
    required this.productType,
    required this.name,
    required this.email,
    required this.phone,
    required this.requestDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productType': productType,
      'name': name,
      'email': email,
      'phone': phone,
      'requestDate': requestDate.toIso8601String(),
    };
  }

  factory ProductRequest.fromMap(Map<String, dynamic> map) {
    return ProductRequest(
      id: map['id'],
      productType: map['productType'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      requestDate: DateTime.parse(map['requestDate']),
    );
  }
}
