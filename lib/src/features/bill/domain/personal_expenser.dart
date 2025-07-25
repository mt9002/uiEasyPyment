class PersonalExpenses {
  final String nameProduct;
  final double price;
  final int? client;

  PersonalExpenses({
    required this.nameProduct,
    required this.price,
    this.client,
  });

  // Constructor para crear una instancia desde un mapa (e.g., JSON)
  factory PersonalExpenses.fromJson(Map<String, dynamic> json) {
    return PersonalExpenses(
      nameProduct: json['nameProduct'] as String,
      price: (json['price'] as num).toDouble(),
      client: json['client_id'] as int?,
    );
  }

  // Método para convertir la instancia a un mapa (e.g., para JSON)
  Map<String, dynamic> toJson() {
    return {
      'nameProduct': nameProduct,
      'price': price,
      'client_id': client,
    };
  }

  @override
  String toString() {
    return 'PersonalExpenses(nameProduct: $nameProduct, price: $price, client_id: $client)';
  }
}
