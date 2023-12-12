import 'dart:io';

import 'package:calendar_app/extensions/buildContext_ext.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  static const String routeName = '/imageView';

  static Widget builder(BuildContext context){

    return ImageView(path: context.args);
  }

  final String path;
  const ImageView({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(path.split('/').last),

      ),
      body: Image.file(File(path),height: context.height,width: context.width,),
    );
  }
}
