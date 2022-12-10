import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controller/product_controller.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/views/category_screen/item_details.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets_common/loading_indicator.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();

    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: title!.text.fontFamily(bold).white.make(),
      ),
      body: StreamBuilder(
          stream: FirestoreServices.getProducts(title),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: loadingIndicator(),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: "Pas de produit".text.color(darkFontGrey).make(),
              );
            } else {
              var data = snapshot.data!.docs;

              return Container(
                padding: EdgeInsets.all(12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              controller.subcat.length,
                              (index) => "${controller.subcat[index]}"
                                  .text
                                  .size(12)
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .makeCentered()
                                  .box
                                  .white
                                  .rounded
                                  .size(120, 60)
                                  .margin(EdgeInsets.symmetric(horizontal: 4))
                                  .make()),
                        ),
                      ),
                      20.heightBox,
                      Expanded(
                          child: GridView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisExtent: 250,
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 8),
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      imgP5,
                                      height: 150,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ),
                                    10.heightBox,
                                    "Laptop 4GB/64GB"
                                        .text
                                        .fontFamily(semibold)
                                        .color(darkFontGrey)
                                        .make(),
                                    10.heightBox,
                                    "CFA 350 000"
                                        .text
                                        .color(blueColor)
                                        .fontFamily(bold)
                                        .size(16)
                                        .make(),
                                  ],
                                )
                                    .box
                                    .white
                                    .margin(EdgeInsets.symmetric(horizontal: 4))
                                    .roundedSM
                                    .outerShadowSm
                                    .padding(EdgeInsets.all(12))
                                    .make()
                                    .onTap(() {
                                  Get.to(() => ItemDetail(title: "Dummy item"));
                                });
                              }))
                    ]),
              );
            }
          }),
    ));
  }
}
