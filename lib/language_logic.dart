import 'package:flutter/material.dart';
import 'package:flutter_pro_1/language_data.dart';

class LanguageLogic extends ChangeNotifier{
  Language _language = Language();
  Language get language => _language;

  void changeLanguage(Language language){
    _language = language;
    notifyListeners();
  }
  void changeToKh(){
    _language = LanguageKh();
    notifyListeners();
  }
}