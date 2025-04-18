import 'package:flutter/material.dart';
import 'package:app_barber_shop/data/services.dart';

class BookingModel extends ChangeNotifier {
  List<Service> selectedServices = [];
  DateTime? selectedDate;
  String? selectedHour;
  String? selectedProfessional;
  String? professionalImage;  

  void addService(Service service) {
    selectedServices.add(service);
    notifyListeners();
  }

  void removeService(String serviceName) {
    selectedServices.removeWhere((service) => service.name == serviceName);
    notifyListeners();
  }

  void setServices(List<Service> services) {
    selectedServices = services;
    notifyListeners();
  }

  void setDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void setHour(String hour) {
    selectedHour = hour;
    notifyListeners();
  }

  void setProfessional(String professional) {
    selectedProfessional = professional;
    notifyListeners();
  }

  void setProfessionalImage(String image) {
    professionalImage = image;  
    notifyListeners();
  }

  void clear() {
    selectedServices = [];
    selectedDate = null;
    selectedHour = null;
    selectedProfessional = null;
    professionalImage = null;  
    notifyListeners();
  }

  List<double> get selectedPrices {
    return selectedServices.map((service) => service.price).toList();
  }

  String? get professionalImagePath => professionalImage; 
}
