import 'package:shared_preferences/shared_preferences.dart';

class BillDesignMng {

  
  changesbilldesignName({required bool value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('DesignName', value);
    addName = value;
  }
   changebilldesignLogo({required bool value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('DesignLogo', value);
    addLogo = value;
  }
  

 Future<bool?> fetchbilldesignName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
      addName =  prefs.get('DesignName') as bool?;
    return addName;
  }
  Future<bool?> fetchbilldesignLogo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
      addLogo =  prefs.get('DesignLogo') as bool?;
    return addLogo;
  }
}

bool? addName;
bool? addLogo;

