import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uzgaruvchi/models/note.dart';
import 'package:uzgaruvchi/utils/app_constats.dart';
import 'package:uzgaruvchi/utils/extensions/extension.dart';

class NoteController {
  Color darkBody = AppConstants.bodyDark;
  Color lightBody = AppConstants.bodyLight;
  Color darkApp = AppConstants.appBarDark;
  Color lightApp = AppConstants.appBarLight;
  double newTextSize = AppConstants.textSize;
  String? password = AppConstants.password;
  final List<Note> _list = [
    Note(
        title: "darslar",
        text: "17:00 duahnba shanba",
        iscomplited: false,
        date: "2024-04-22 13:55"),
    Note(
        title: "darslar1",
        text: "17:00 duahnba shanba",
        iscomplited: true,
        date: "2024-04-22 13:55"),
    Note(
        title: "darslar2",
        text: "17:00 duahnba shanba",
        iscomplited: false,
        date: "2024-04-22 13:55"),
    Note(
        title: "darslar3",
        text: "17:00 duahnba shanba",
        iscomplited: true,
        date: "2024-04-22 13:55"),
    Note(
        title: "darslar4",
        text: "17:00 duahnba shanba",
        iscomplited: false,
        date: "2024-04-22 13:55"),
    Note(
        title: "darslar5",
        text: "17:00 duahnba shanba",
        iscomplited: true,
        date: "2024-04-22 13:55"),
  ];

  List<Note> get list {
    return [..._list];
  }

  void add(String title, String text) {
    _list.add(
      Note(
        title: title,
        text: text,
        iscomplited: false,
        date: DateTime.now().dateTimeFormat(),
      ),
    );
  }

  Future<void> saveData(double newTextSize,String color) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setDouble("textSize", newTextSize);
    sharedPreferences.setString("password", password!);
    sharedPreferences.setString("darkBody", color); 

  }

  Future<void> getData(double? newTextSize) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    newTextSize = sharedPreferences.getDouble("textSize");
    password = sharedPreferences.getString("password");
    darkBody = Color(int.parse('0x${sharedPreferences.getString("darkBody")}'));

  }

  void edit({
    required int index,
    required String title,
    required String text,
  }) {
    _list[index].text = text;
    _list[index].title = title;
  }

  void delete(int index) {
    _list.removeAt(index);
  }
}
