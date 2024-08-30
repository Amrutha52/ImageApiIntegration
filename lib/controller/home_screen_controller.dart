import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier
{
  String? random;
  bool isLoading = false;

  Future<void> getUserData()
  async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("https://dog.ceo/api/breeds/image/random");
    var responseData = await  http.get(url); // bcoz get is a future function
    print('responseData' + responseData.statusCode.toString());
    print('responseBody' + responseData.body);
    if (responseData.statusCode == 200)
    {
      //json dataye decode cheythe map aakunu
      var decodedData = jsonDecode(responseData.body);
      print(decodedData["message"]);
      random = decodedData["message"];
      isLoading = false;
    }
    notifyListeners();
  }
}