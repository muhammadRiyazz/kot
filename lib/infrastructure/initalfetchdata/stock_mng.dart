import 'package:shared_preferences/shared_preferences.dart';

class StockMng {

  
  changestockmngGoods({required bool value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('stockmngGoods', value);
    stockmngGoods = value;
  }
   changestockmngService({required bool value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('stockmngService', value);
    stockmngService = value;
  }
  

 Future<bool?> fetchstockmngGoods() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
      stockmngGoods =  prefs.get('stockmngGoods') as bool?;
    return stockmngGoods;
  }
  Future<bool?> fetchstockmngService() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
      stockmngService =  prefs.get('stockmngService') as bool?;
    return stockmngService;
  }
}

bool? stockmngGoods;
bool? stockmngService;

