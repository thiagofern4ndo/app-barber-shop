class Service {
  final String name;
  final double price;

  Service({required this.name, required this.price});
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Service && other.name == name && other.price == price;
  }
  @override
  int get hashCode => name.hashCode ^ price.hashCode;
}

final List<Service> serviceList = [
  Service(name: 'Corte', price: 40.0),
  Service(name: 'Corte Infantil', price: 50.0),
  Service(name: 'Barba', price: 30.0),
  Service(name: 'Sobrancelha', price: 30.0),
  Service(name: 'Corte & Barba', price: 60.0),
];
