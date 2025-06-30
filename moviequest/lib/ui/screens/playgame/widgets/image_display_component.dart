import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviequest/ui/core/theme/theme.dart';

// ignore: must_be_immutable
class ImageDisplayComponent extends StatelessWidget {
  ImageDisplayComponent({super.key, required this.UrlImage});
  String UrlImage;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    AppTheme appTheme = AppTheme();
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          decoration: appTheme.imageBoxDecoration,
          child: Stack(
            children: [
              Container(
                color: Colors.transparent,
                width: size.width * 0.2,
                height: size.height * 0.2,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              Image.network(
                UrlImage,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
