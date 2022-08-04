import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_assignment/shared/bloc/cubit.dart';
import 'package:todoapp_assignment/shared/bloc/status.dart';
import '../shared/components/components.dart';

class Archived extends StatelessWidget {
  const Archived({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<bloc, appstatus>(
        listener: (context, status) {},
        builder: (context, status) {
          var cubit = bloc.get(context).archivetasks;
          return buildTaskItem(cubit: cubit);
        });
  }
}
