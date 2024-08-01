import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:property_managment/consts/colors.dart';

class ImagePreviewWidget extends StatelessWidget {
  final String attachment;
  final bool isLocal;
  const ImagePreviewWidget({Key? key,required this.attachment,this.isLocal = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(ColorCode.primary),
      ),
      body: SafeArea(
        child: isLocal? PhotoView(
          imageProvider: FileImage(File(attachment)),
        ): PhotoView(
          imageProvider: NetworkImage(attachment),
        ),
      ),
    );
  }
}
