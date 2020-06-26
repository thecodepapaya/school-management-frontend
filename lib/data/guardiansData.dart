import 'package:http/http.dart';
import 'package:school_mgmt/models/guardian.dart';
import '../models/guardian.dart';

class GuardianData {
  static List<Guardian> guardian = List();

  GuardianData() {
    getAllGuardians();
  }

  static Future getAllGuardians() async {
    Response response =
        await get("https://studymanagement.herokuapp.com/guardian/");
    if (response.statusCode != 200) {
      print("Error, cannot fetch Guardian");
    } else {
      guardian = guardianFromJson(response.body);
      print("Fetched latest Guardians");
    }
  }

  static void refresh() async{
    await getAllGuardians();
  }
}
