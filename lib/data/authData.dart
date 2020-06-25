import 'package:http/http.dart';
import 'package:school_mgmt/models/auth.dart';

import '../exceptions.dart';

class AuthData {
  static List<Auth> allAuth = List();

  AuthData() {
    getAuth();
  }

  static Future getAuth() async {
    Response response =
        await get("https://studymanagement.herokuapp.com/auth/");
    if (response.statusCode != 200) {
      print("Error, cannot fetch Auth");
      throw DataUnavailable("Could not fetch auth values");
    } else {
      allAuth = authFromJson(response.body);
      print("Fetched latest auth");
    }
  }

  static void refresh() {
    getAuth();
  }
}
