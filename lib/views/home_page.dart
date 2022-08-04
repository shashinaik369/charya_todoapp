// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:todoapp_assignment/constants.dart';
import 'package:todoapp_assignment/shared/bloc/cubit.dart';
import 'package:todoapp_assignment/shared/bloc/status.dart';
import '../shared/components/components.dart';

// ignore: must_be_immutable
class HomeLayout extends StatelessWidget {
  var titlecontrolar = TextEditingController();
  var datecontrolar = TextEditingController();
  var Timecontrolar = TextEditingController();
  var Scaffoldkey = GlobalKey<ScaffoldState>();

  var formkey = GlobalKey<FormState>();

  HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => bloc()..CreatDatabase(),
      child: BlocConsumer<bloc, appstatus>(
        listener: (context, status) {
          if (status is Appinsertdatabasestate) {
            Navigator.pop(context);
          }
        },
        builder: (context, status) {
          bloc cubit = bloc.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            key: Scaffoldkey,
            appBar: AppBar(
              backgroundColor: Colors.white,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    iconSize: 25,
                    color: Colors.orange,
                    onPressed: () {
                      authController.signOut();
                    },
                    icon: const Icon(Iconsax.logout),
                  ),
                )
              ],
              centerTitle: true,
              elevation: 0.1,
              title: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Todo App ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.openShowMottom) {
                  if (Scaffoldkey.currentState != null &&
                      formkey.currentState != null &&
                      formkey.currentState!.validate()) {
                    cubit.inserToDatabase(
                        title: titlecontrolar.text,
                        data: datecontrolar.text,
                        time: Timecontrolar.text);
                  }
                } else {
                  cubit.openShowMottom = true;
                  Scaffoldkey.currentState!
                      .showBottomSheet(
                        (context) => Container(
                          color: Colors.white,
                          child: Form(
                            key: formkey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: defulteditTextx(

                                      ///edit text title
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Tasks Must be not  empty';
                                        }
                                        return null;
                                      },
                                      onchanged: (value) {},
                                      onfiled: (s) {},
                                      controller: titlecontrolar,
                                      keyboardType: TextInputType.text,
                                      lable: 'Task',
                                      prefix: Iconsax.text),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: defulteditTextx(
                                    ///edit text time
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Time Must be not empty';
                                      }
                                      return null;
                                    },
                                    controller: Timecontrolar,
                                    keyboardType: TextInputType.datetime,
                                    lable: 'Time',
                                    prefix: Iconsax.timer,
                                    ontab: () {
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then(
                                        (value) => {
                                          print(value!.format(context)),
                                          Timecontrolar.text =
                                              value.format(context).toString(),
                                        },
                                      );
                                    },
                                    onchanged: () {},
                                    onfiled: () {}, //ontap
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),

                                  ///edit text date
                                  child: defulteditTextx(
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Date must be not empty';
                                      }
                                      return null;
                                    },
                                    controller: datecontrolar,
                                    keyboardType: TextInputType.datetime,
                                    lable: 'Date',
                                    prefix: Iconsax.calendar,
                                    ontab: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate:
                                                  DateTime.parse('2030-01-01'))
                                          .then((value) => {
                                                datecontrolar.text =
                                                    DateFormat.yMMMd()
                                                        .format(value!),
                                              });
                                    },
                                    onchanged: () {},
                                    onfiled: () {},
                                  ),
                                ),
                                /////
                              ],
                            ),
                          ),
                        ),
                      )
                      .closed
                      .then((value) {
                    cubit.showbottomsheeat(icon: Iconsax.edit, isShow: false);
                  });
                  cubit.showbottomsheeat(
                      icon: Iconsax.add_circle, isShow: true);
                }
              }, ////
              child: Icon(
                cubit.iconData,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedFontSize: 20.0,
              elevation: 15.0,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.navchange(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.task_square),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.tag_right),
                  label: 'Completed',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.tag_cross),
                  label: 'Archived',
                ),
              ],
            ),
            body: cubit.models[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
