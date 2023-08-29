import 'package:flutter/material.dart';

import '../../api/data/fetched_user_data.dart';


Widget avatar(double radius, double size) {
  return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      child: UserData.image != null
          ? UserData.image!.contains('avatar')
              ? Text(
                '${UserData.firstName![0]}${UserData.lastName![0]}',
                style: TextStyle(fontSize: size, color: Colors.black),
              )
              : Image.network(UserData.image!)
          : Text(
              'UK',
              style: TextStyle(fontSize: size, color: Colors.black),
            ));
}
