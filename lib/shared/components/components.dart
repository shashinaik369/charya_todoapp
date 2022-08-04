// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todoapp_assignment/shared/bloc/cubit.dart';

Widget defulteditTextx({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required Function onfiled,
  required Function onchanged,
  GestureTapCallback? ontab,
  FormFieldValidator<String>? validator,
  required String lable,
  required IconData prefix,
  IconData? sufix,
  bool? obscureText = false,
}) =>
    TextFormField(
      onTap: ontab,
      obscureText: obscureText!,
      controller: controller,
      keyboardType: keyboardType,
      onFieldSubmitted: (s) {
        onfiled(s);
      },
      onChanged: (s) {
        onchanged(s);
      },
      validator: validator,
      decoration: InputDecoration(
        labelText: lable,
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: Icon(
          sufix,
        ),
      ),
    );

Widget buildtaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text(
                '${model['time']}',
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${model['title']}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text('${model['data']}',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,
                      )),
                ],
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            IconButton(
              onPressed: () {
                bloc
                    .get(context)
                    .updatedatabase(status: 'done', id: model['id']);
              },
              icon: Icon(
                Iconsax.like_1,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {
                bloc
                    .get(context)
                    .updatedatabase(status: 'archive', id: model['id']);
              },
              icon: Icon(
                Iconsax.note_remove,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        bloc.get(context).deletdatabase(id: model['id']);
      },
    );

Widget buildTaskItem({cubit}) => ConditionalBuilder(
      condition: cubit.length > 0,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) => buildtaskItem(cubit[index], context),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(start: 20.0),
          child: Container(
            height: 1.0,
            width: double.infinity,
            color: Colors.grey,
          ),
        ),
        itemCount: cubit.length,
      ),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.menu,
              size: 100.0,
              color: Colors.grey,
            ),
            Text(
              'No task yet , Please add some tasks',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
