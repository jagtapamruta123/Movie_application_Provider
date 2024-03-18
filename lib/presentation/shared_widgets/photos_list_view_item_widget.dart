import 'package:flutter/material.dart';

class PhotosListViewItemWidget extends StatelessWidget {
  final String url;
  const PhotosListViewItemWidget({
    required this.url,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 4),
      width: MediaQuery.of(context).size.width * 0.35,
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }
}
