import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ThumbnailImage extends StatelessWidget {
  final String thumbnail;
  const ThumbnailImage({super.key, required this.thumbnail});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          'http://becknowledge.com/af24/storage/app/public/product/$thumbnail',
      errorWidget: (context, url, error) =>
          Image.asset('assets/images/NoPic.jpg'),
    );
  }
}

class ProductImages extends StatelessWidget {
  final String image;
  const ProductImages({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          'http://becknowledge.com/af24/storage/app/public/product/$image',
      errorWidget: (context, url, error) =>
          Image.asset('assets/images/NoPic.jpg'),
    );
  }
}
