import 'package:app_barber_shop/data/professionals.dart';
import 'package:app_barber_shop/data/services.dart';
import 'package:app_barber_shop/models/booking_model.dart';
import 'package:app_barber_shop/models/reservation_model.dart';
import 'package:flutter/material.dart';

class BookingProvider with ChangeNotifier {
  final List<ReservationModel> _confirmedBookings = [];
  BookingModel _currentBooking = BookingModel();

  void addServiceToBooking(Service service) {
    if (service.name == 'Corte & Barba') {
      _currentBooking.selectedServices.removeWhere((s) => s.name == 'Corte');
      _currentBooking.selectedServices.removeWhere((s) => s.name == 'Barba');
    }

    if (service.name == 'Corte' || service.name == 'Barba') {
      _currentBooking.selectedServices
          .removeWhere((s) => s.name == 'Corte & Barba');
    }

    _currentBooking.selectedServices.add(service);
    notifyListeners();
  }

  void removeServiceFromBooking(String serviceName) {
    _currentBooking.selectedServices.removeWhere((s) => s.name == serviceName);
    notifyListeners();
  }

  void setServices(List<Service> services) {
    _currentBooking.setServices(services);
    notifyListeners();
  }

  void setDate(DateTime date) {
    _currentBooking.setDate(date);
    notifyListeners();
  }

  void setHour(String hour) {
    _currentBooking.setHour(hour);
    notifyListeners();
  }

  void setProfessional(String professional) {
    _currentBooking.setProfessional(professional);

    final professionalImage = professionals.firstWhere(
      (professionalData) => professionalData['name'] == professional,
      orElse: () => {'imagePath': ''},
    )['imagePath'];

    _currentBooking.setProfessionalImage(professionalImage ?? '');

    notifyListeners();
  }

  void confirmBooking() {
    final reservation = ReservationModel.fromBooking(
      services: _currentBooking.selectedServices,
      date: _currentBooking.selectedDate ?? DateTime.now(),
      hour: _currentBooking.selectedHour ?? '',
      professional: _currentBooking.selectedProfessional ?? '',
      professionalImage: _currentBooking.professionalImage ?? '',
    );

    _confirmedBookings.add(reservation);
    _currentBooking = BookingModel();
    notifyListeners();
  }

  List<ReservationModel> get confirmedBookings => _confirmedBookings;
  BookingModel get currentBooking => _currentBooking;
  DateTime? get selectedDate => _currentBooking.selectedDate;
  String? get selectedHour => _currentBooking.selectedHour;
  String? get selectedProfessional => _currentBooking.selectedProfessional;
  List<Service> get selectedServices => _currentBooking.selectedServices;
}
