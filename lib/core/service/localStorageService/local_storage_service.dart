import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService{

  Future<bool> setBoolToLocale({required String key,required bool boolToBeSet}) async{
    final locale = await SharedPreferences.getInstance();
    try{
      await locale.setBool(key, boolToBeSet);
      return true;
    }catch(_){
      return false;
    }
  }

  Future<bool?> getBoolFromLocale({required String key}) async{
    final locale = await SharedPreferences.getInstance();
   
     var boolToBeGet= locale.getBool(key);
     return boolToBeGet;
    
  }
 }