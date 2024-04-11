// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "form": "Registration form",
  "name": "Full Name",
  "number": "Phone Number",
  "email": "Email",
  "password": "Password",
  "register": "Register",
  "inform": "User Info",
  "select": "Please, Select Full Information",
  "password_must_have_uppercase": "uppercase required",
  "home": "Home",
  "search": "Search",
  "profile": "Profile",
  "stor": "Story"
};
static const Map<String,dynamic> kk = {
  "form": "Тіркеу формасы",
  "name": "Аты-жөні",
  "number": "Телефон нөмірі",
  "email": "Электрондық пошта",
  "password": "Пароль",
  "register": "Тіркелу",
  "inform": "Пайдаланушы ақпараты",
  "select": "Толық ақпаратты таңдаңыз",
  "password_must_have_upppercase": "бас әріп қажет",
  "home": "Үй",
  "search": "Іздеу",
  "profile": "Профиль",
  "stor": "Әңгіме"
};
static const Map<String,dynamic> ru = {
  "form": "Регистрационная форма",
  "name": "Полное имя",
  "number": "Номер телефона",
  "эemail": "Электронная почта",
  "password": "Пароль",
  "register": "Зарегистрироваться",
  "inform": "Информация о пользователе",
  "select": "Пожалуйста, выберите полную информацию",
  "password_must_have_uppercase": "Требуются заглавные буквы",
  "home": "Дом",
  "search": "Поиск",
  "profile": "Профиль",
  "stor": "История"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "kk": kk, "ru": ru};
}
