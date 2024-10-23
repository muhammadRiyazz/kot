import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmerGrid(
    int crossAxisCount, double childAspectRatio, double boxPadding) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
              color: boxbgwhite,
              borderRadius: BorderRadius.circular(15),
            ),
            width: double.infinity,
            height: 50,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Expanded(
          child: GridView.builder(
            itemCount: 13,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: boxPadding),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount, // Dynamic number of columns
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: childAspectRatio, // Dynamic aspect ratio
            ),
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  decoration: BoxDecoration(
                    color: boxbgwhite,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
