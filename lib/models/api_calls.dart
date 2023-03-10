import 'dart:convert';
import 'dart:io';
import 'package:diet_planner_app/models/daily_plans_models.dart';
import 'package:diet_planner_app/models/ingredients.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

class ApiService {
  //The API service will be a singleton, therefore create a private constructor
  //ApiService._instantiate(), and a static instance variable
  ApiService._instantiate();
  static final ApiService instance = ApiService._instantiate();

  //Add base URL for the spoonacular API, endpoint and API Key as a constant
  final String _baseURL = "api.spoonacular.com";
  // ignore: constant_identifier_names
  static const String API_KEY = "c126e1c0ab36478ab13732a7048615f0";

  // an async function to create  diet based on (targetCalorie) BMR

  generateMealsPlans({required int targetCalories}) async {
    //check if diet is null
    Map<String, String> parameters = {
      'timeFrame': 'week', //to get 3 meals
      'targetCalories': targetCalories.toString(),
      'apiKey': API_KEY,
    };

    // a variable to check if user is connected to internet
    var connectivityResult = await Connectivity().checkConnectivity();

    //The Uri consists of the base url, the endpoint we are going to use. It has also
    //parameters
    Uri uri;
    if (connectivityResult == ConnectivityResult.none) {
      const Center(
        child: Text('Some erros occured!'),
      );
    } else {
      uri = Uri.https(
        _baseURL,
        '/mealplanner/generate',
        parameters,
      );

      //Our header specifies that we want the request to return a json object
      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
      };

      try {
        //http.get to retrieve the response
        var response = await http.get(uri, headers: headers);
        if (response.statusCode == 200) {
          //decode the body of the response into a map

          Map<String, dynamic> data = json.decode(response.body);
          //convert the map into a MealPlan Object using the factory constructor,
          //MealPlan.fromMap
          DailyPlans dailyPlans = DailyPlans.fromJson(data);
          print(dailyPlans);
          return dailyPlans;
        } else {
          const Center(
            child: Text('Some erros occured!'),
          );
        }
      } catch (err) {
        //If our response has error, we throw an error message
        print('The Exception code ${err.hashCode}');
      }
    }
  }

// an async function to get ingredients
  getIngridents({required int id}) async {
    // API link with params to get ingredients based on ID
    String apiLink =
        'https://api.spoonacular.com/recipes/$id/ingredientWidget.json?apiKey=$API_KEY';

    try {
      //http.get to retrieve the response
      var response = await http.get(Uri.parse(apiLink));
      //decode the body of the response into a map

      Map<String, dynamic> data = json.decode(response.body);
      //convert the map into a MealPlan Object using the factory constructor,
      //MealPlan.fromMap
      Ingredients ingredients = Ingredients.fromJson(data);
      print(ingredients);
      return ingredients;
    } catch (err) {
      //If our response has error, we throw an error message
      debugPrint('ERROR CODE :  ${err.hashCode}');
      throw err.toString();
    }
  }
}
