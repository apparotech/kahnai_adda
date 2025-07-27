import 'package:flutter/material.dart';

void pushToScreen(BuildContext context, screen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
}
