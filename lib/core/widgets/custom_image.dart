import 'package:flutter/widgets.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    required this.image,
    this.padding,
    this.height,
    this.width,
  }) : super(key: key);

  factory CustomImage.network({
    required String url,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
  }) =>
      CustomImage(
        width: width,
        height: height,
        padding: padding,
        image: Image.network(
          url,
          width: width,
          height: height,
          cacheWidth: width!.toInt(),
          cacheHeight: height!.toInt(),
        ),
      );

  factory CustomImage.asset({
    required String name,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
  }) =>
      CustomImage(
        width: width,
        height: height,
        padding: padding,
        image: Image.asset(
          name,
          width: width,
          height: height,
          cacheWidth: width!.toInt(),
          cacheHeight: height!.toInt(),
        ),
      );

  final Image image;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        height: height,
        width: width,
        child: image,
      ),
    );
  }
}
