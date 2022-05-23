import 'package:flutter/material.dart';

import 'package:rjc_codelab_6/constants/constants.dart';

PreferredSizeWidget? appBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.grey),
    centerTitle: true,
    title: Image.network(
      AppImage.appBarIcon,
      width: 40,
      height: 40,
      fit: BoxFit.contain,
    ),
  );
}
