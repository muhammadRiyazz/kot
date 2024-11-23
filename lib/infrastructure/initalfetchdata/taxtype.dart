import 'package:shared_preferences/shared_preferences.dart';

class TaxtypeMng {

  
  addTaxtype({required bool value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('inc', value);
    inc = value;
  }

 Future<bool?> fetchtaxtype() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
      inc =  prefs.get('inc') as bool?;
    return inc;
  }
}

bool? inc;
