import 'package:shared_preferences/shared_preferences.dart';


  
// Load saved preferences
  Future<void> loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      isSoundEnabled = prefs.getBool("isSoundEnabled") ?? false;
      soundOption = prefs.getString("soundOption") ?? "After Printing";
    
  }

  // Save preferences
  Future<void> savePreferences({required bool isSoundEnabled,required String soundOption}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isSoundEnabled", isSoundEnabled);
    prefs.setString("soundOption", soundOption);
  }
bool? isSoundEnabled;
String? soundOption;
