import 'package:flutter/material.dart';

class User{
  int id;
  String username = '';
  String email = '';
  String profilePictureUrl = '';
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.profilePictureUrl,
  });
}