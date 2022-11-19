import 'package:emart_app/consts/consts.dart';
import 'package:flutter/cupertino.dart';

Widget detailsCart({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      "00".text.fontFamily(bold).size(16).color(darkFontGrey).make(),
      5.heightBox,
      "Au panier".text.color(darkFontGrey).make(),
    ],
  ).box.white.rounded.width(width).height(80).padding(EdgeInsets.all(4)).make();
}
