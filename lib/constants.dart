import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'controller/auth_controller.dart';

List pages = [];

// COLORS
const backgroundColor = Colors.transparent;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;

var firestore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instance;
