import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmerGrid({
  required int crossAxisCount,
  required double childAspectRatio,
  double boxPadding = 8.0,
  int itemCount = 13, // Default item count
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Column(
      children: [
        const SizedBox(height: 10),

        const SizedBox(height: 5),
        // Shimmering grid
        Expanded(
          child: GridView.builder(
            itemCount: itemCount, // Number of items in the grid
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: boxPadding),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount, // Number of columns
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 1, // Aspect ratio of grid items
            ),
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[200]!,
                highlightColor: const Color.fromARGB(255, 255, 255, 255)!,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: boxbgwhite,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon or small image placeholder
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Text placeholder for title
                      Container(
                        height: 12.0,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 5),
                      // Text placeholder for subtitle or additional info
                      Container(
                        height: 12.0,
                        width: 80.0,
                        color: Colors.grey,
                      ),
                      const Spacer(),
                      // Bottom bar for action or price placeholder
                      Container(
                        height: 12.0,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
