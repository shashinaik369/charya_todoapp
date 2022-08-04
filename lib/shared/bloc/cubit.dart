// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sqflite/sqflite.dart';

import 'package:todoapp_assignment/views/done_screen.dart';
import 'package:todoapp_assignment/views/task_screen.dart';
import 'package:todoapp_assignment/shared/bloc/status.dart';

import '../../views/archieved_screen.dart';

class bloc extends Cubit<appstatus> {
  bloc() : super(appinitialsyatus());

  static bloc get(context) => BlocProvider.of(context);
  late int currentIndex = 0;
  late Database database;

  List<Map> newtasks = [];
  List<Map> donetasks = [];
  List<Map> archivetasks = [];

  List<Widget> models = [
    Tasks(),
    Done(),
    Archived(),
  ];

  void navchange(int index) {
    currentIndex = index;
    emit(appchange_navbarstatus());
  }

  void CreatDatabase() {
    openDatabase(
      'dataAAb.db',
      version: 1,
      onCreate: (database, version) async {
        await database
            .execute(
                'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT , data TEXT , time TEXT ,status TEXT )')
            .then((value) {})
            .catchError((error) {});
      },
      onOpen: (database) {
        getdatafromdatabase(database);
      },
    ).then((value) {
      database = value;
      emit(Appcreatdatabasestate());
    });
  }

  Future inserToDatabase({
    required String title,
    required String data,
    required String time,
  }) async {
    return await database.transaction((txn) async {
      return await txn
          .rawInsert(
              'INSERT INTO tasks(title ,data,time,status) VALUES("$title" ,"$data","$time","new")')
          .then((value) {
        emit(Appinsertdatabasestate());

        getdatafromdatabase(database);
        emit(Appgetdatabasestate());
      }).catchError((error) {});
    });
  }

  void getdatafromdatabase(database) {
    newtasks = [];
    donetasks = [];
    archivetasks = [];
    database.rawQuery('SELECT * FROM tasks').then((value) {
      emit(Appgetdatabasestate());
      value.forEach((element) {
        if (element['status'] == 'new') {
          newtasks.add(element);
        } else if (element['status'] == 'done') {
          donetasks.add(element);
        } else {
          archivetasks.add(element);
        }
      });
    });
  }

  IconData iconData = Iconsax.edit;
  bool openShowMottom = false;

  void showbottomsheeat({
    required IconData icon,
    required bool isShow,
  }) {
    iconData = icon;
    openShowMottom = isShow;
    emit(Appchangiconstate());
  }

  void updatedatabase({
    required String status,
    required int id,
  }) {
    database.rawUpdate('UPDATE tasks SET status = ?  WHERE id = ?',
        [status, id]).then((value) {
      getdatafromdatabase(database);
      emit(Appapdetdatabasestate());
    });
  }

  void deletdatabase({
    required int id,
  }) {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getdatafromdatabase(database);
      emit(AppDeletdatabasestate());
    });
  }
}
