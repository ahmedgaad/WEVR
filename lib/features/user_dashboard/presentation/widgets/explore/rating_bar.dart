import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 0,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemSize: 25.0,
      // itemPadding: const EdgeInsetsDirectional.symmetric(horizontal: 0.25),
      itemBuilder: (context,_){
        return const Icon(Icons.star_outlined , color: Colors.amber, size: 15.0,);
      },
      onRatingUpdate: (rating){
        print(rating);
      },
    );
  }
}
