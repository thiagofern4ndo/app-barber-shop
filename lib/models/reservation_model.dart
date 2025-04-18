import 'package:app_barber_shop/data/services.dart';

class ReservationModel {
  final String id;
  final List<Service> services;
  final double totalPrice;
  final DateTime date;
  final String hour;
  final String professional;
  final String professionalImage;  
  final DateTime createdAt;

  ReservationModel({
    required this.id,
    required this.services,
    required this.totalPrice,
    required this.date,
    required this.hour,
    required this.professional,
    required this.professionalImage, 
    required this.createdAt,
  });

  factory ReservationModel.fromBooking({
    required List<Service> services,
    required DateTime date,
    required String hour,
    required String professional,
    required String professionalImage,
  }) {
    final double total = services.fold(0.0, (sum, item) => sum + item.price);
    final String id = '${DateTime.now().millisecondsSinceEpoch}';

    return ReservationModel(
      id: id,
      services: services,
      totalPrice: total,
      date: date,
      hour: hour,
      professional: professional,
      professionalImage: professionalImage, 
      createdAt: DateTime.now(),
    );
  }
}
