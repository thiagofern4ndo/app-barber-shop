import 'package:flutter/material.dart';
import 'package:app_barber_shop/models/reservation_model.dart';

class ReservationProvider with ChangeNotifier {
  final List<ReservationModel> _reservations = [];

  List<ReservationModel> get reservations => _reservations;

  void addReservation(ReservationModel reservation) {
    _reservations.add(reservation);
    notifyListeners();
  }

  void removeReservation(String id) {
    _reservations.removeWhere((res) => res.id == id);
    notifyListeners();
  }
}
