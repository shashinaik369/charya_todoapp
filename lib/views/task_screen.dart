import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_assignment/shared/bloc/cubit.dart';
import 'package:todoapp_assignment/shared/bloc/status.dart';

import '../shared/components/components.dart';

class Tasks extends StatelessWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<bloc, appstatus>(
        listener: (context, status) {},
        builder: (context, status) {
          var cubit = bloc.get(context).newtasks;
          return buildTaskItem(cubit: cubit);
        });
  }
}
