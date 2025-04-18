import 'dart:convert';
import 'package:http/http.dart' as http;

class HolidayService {
  final String _baseUrl = "https://date.nager.at/api/v2/PublicHolidays";

  Future<List<String>> getHolidays(String countryCode, int year) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/$year/$countryCode'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> holidays = json.decode(response.body);
        return holidays.map((holiday) => holiday['date'] as String).toList();
      } else {
        throw Exception('Falha ao carregar feriados');
      }
    } catch (e) {
      print('Erro ao buscar feriados: $e');
      return [];
    }
  }
}
