import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 6, 
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            title: Container(
              height: 10,
              color: Colors.white,
            ),
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 5,
                  color: Colors.white,
                ),
                Container(
                  height: 5,
                  color: Colors.white,
                ),
                Container(
                  height: 10,
                  color: Colors.white,
                ),
                Container(
                  height: 10,
                  color: Colors.white,
                ),
                  Container(
                  height: 10,
                  color: Colors.white,
                ),
                  Container(
                  height: 10,
                  color: Colors.white,
                ),
                  Container(
                  height: 10,
                  color: Colors.white,
                ),
                  Container(
                  height: 10,
                  color: Colors.white,
                ),
                  Container(
                  height: 10,
                  color: Colors.white,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
