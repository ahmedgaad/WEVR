import 'package:flutter/material.dart';
import 'package:wevr_app/core/utils/extensions.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../screens/explore/product_container.dart';
import '../explore/fav_icon.dart';

class AuctionComponent extends StatelessWidget {
  const AuctionComponent({
    super.key,
    required this.image,
    required this.type,
    required this.startingPrice,
    required this.location,
  });

  final String image;
  final String type;
  final String startingPrice;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6.0,
      shadowColor: Colors.black.withOpacity(0.4),
      borderRadius: BorderRadius.circular(30),
      clipBehavior: Clip.hardEdge,
      child: Container(
        width: double.infinity,
        // height: 344.h,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                image,
                height: 168,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            7.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  type,
                  style: getMediumStylePoppins(
                    color: ColorManager.lightPink,
                    fontSize: 14,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFFDBDBDB))),
                  child:  Text(startingPrice),
                ),
                const FavIcon(id: 1)
              ],
            ),
            // 7.ph,
            Row(
              children: [
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    icon(
                      icon: Icons.location_on_outlined,
                    ),
                    spaceW(),
                    Text(
                      location,
                      style: getMediumStylePoppins(
                        color: ColorManager.smokyGray,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                60.pw,
                Text(
                  'Current Price',
                  style: getMediumStyleInter(
                    color: Colors.black,
                  ),
                )
              ],
            ),
            7.ph,
            Text(
              'Ends In',
              style: getMediumStylePoppins(
                  color: const Color(0xFF555555), fontSize: 12.0),
            ),
            7.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      height: 20,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFFDBDBDB))),
                      child: Text('02'),
                    ),
                    8.ph,
                    Text(
                      'Days',
                      style: getLightStyleInter(color: Colors.black),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      height: 20,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xFFDBDBDB))),
                      child: Text('10'),
                    ),
                    8.ph,
                    Text(
                      'Hours',
                      style: getLightStyleInter(color: Colors.black),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      height: 20,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xFFDBDBDB))),
                      child: Text('50'),
                    ),
                    8.ph,
                    Text(
                      'Minutes',
                      style: getLightStyleInter(color: Colors.black),
                    )
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: MaterialButton(
                    onPressed: () {},
                    color: ColorManager.primary,
                    minWidth: 116,
                    height: 48,
                    child: Text(
                      'join',
                      style: getMediumStylePoppins(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
