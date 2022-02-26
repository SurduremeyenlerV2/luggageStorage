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
    bool? boolToBeGet;
    if(locale.getBool(key)!=null){
      boolToBeGet= locale.getBool(key);
    }
     
     return boolToBeGet;
    
  }
 }