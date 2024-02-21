import 'dart:convert';
import 'package:http/http.dart';

import '../models/hotel.dart';

class HttpService {
  final String baseUrl =
      'https://us-central1-flutter-class-buu.cloudfunctions.net/hotel';

  Future<List<Hotel>> getHotelList() async {
    final response = await get(Uri.parse(baseUrl), headers: {
      "Accept": "application/json",
      "content-type": "application/json",
    });

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Hotel> hotelList = data
          .map((json) => Hotel(
                id: json['id'],
                name: json['name'],
                detail: json['detail'],
                location: json['location'],
                price: json['price'],
                image: json['image'],
                amenities: List<String>.from(json['amenities']),
              ))
          .toList();

      // print('yesh');

      return hotelList;
    } else {
      throw Exception('Failed to load hotel');
    }
  }
}
