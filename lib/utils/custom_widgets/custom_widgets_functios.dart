import 'package:flutter/material.dart';
import 'package:getx_api/utils/statics/colors.dart';
import 'package:getx_api/utils/statics/textstyles.dart';

Widget containerWidget(
    {required double height,
    required double width,
    Color? color,
    EdgeInsets? margin,
    Alignment? align,
    Widget? child}) {
  return Container(
    height: height,
    width: width,
    color: color,
    margin: margin,
    alignment: align,
    child: child,
  );
}

Widget customButton(
    {required String name, required Color color, void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 50,
      width: 350,
      // margin: const EdgeInsets.only(left: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        name,
        style: style20w600white,
      ),
    ),
  );
}

Widget customButtonWhite({required String name, required Color color}) {
  return Container(
    height: 50,
    width: 350,
    margin: const EdgeInsets.only(left: 20),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      name,
      style: style20w600black,
    ),
  );
}
