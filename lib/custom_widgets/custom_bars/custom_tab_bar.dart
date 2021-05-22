import 'package:app_mercado/custom_widgets/custom_text/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final String title;
  final String img;

  final bool imageNetwork;

  CustomTabBar(this.title, this.img, {this.imageNetwork = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 8,
      child: Tab(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageNetwork == false
                ? Container(
                    height: 30,
                    width: 30,
                    margin: EdgeInsets.all(3),
                    child: Image.asset(
                      img,
                      fit: BoxFit.cover,
                    ),
                  )
                : Container(
                    height: 30,
                    width: 30,
                    margin: EdgeInsets.all(3),
                    child: CachedNetworkImage(
                      imageUrl: img,
                      fit: BoxFit.cover,
                    ),
                  ),
            Container(
              padding: EdgeInsets.all(2),
              child: CustomText(
                texto: title,
                bold: true,
                tamanhoFonte: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
