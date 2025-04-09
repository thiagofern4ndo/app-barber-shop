class Service {
  final String name;
  final double price;

  Service({required this.name, required this.price});
}

final List<Service> serviceList = [
  Service(name: 'Corte:', price: 40.0),
  Service(name: 'Corte Infantil:', price: 50.0),
  Service(name: 'Barba:', price: 30.0),
  Service(name: 'Sobrancelha:', price: 30.0),
  Service(name: 'Combo: Corte e Barba:', price: 60.0),
];
