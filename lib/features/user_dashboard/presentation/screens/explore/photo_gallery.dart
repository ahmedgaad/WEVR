import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:wevr_app/core/utils/constants_manager.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/Home/cubit.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/Home/states.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.exploreBackground,
      appBar: AppBar(
        title: Text(
          "photo gallery",
          style: getSemiBoldStylePoppins(
            color: ColorManager.black,
            fontSize: 20,
          ),
        ),
      ),
      body: BlocBuilder<HomeLayoutCubit, HomeLayOutStates>(
        builder: (context, state) {
          if (state is ApartmentLoadedState) {
            if (state.apartment.apartments[0].image.isEmpty) {
              return Container(color: Colors.red,);
            }else{
              return GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                  ),
                  scrollDirection: Axis.vertical,
                  // physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(10.0),
                  // semanticChildCount: 3,
                  shrinkWrap: true,
                  children: List.generate(
                    state.apartment.apartments[0].image.length,
                        (index) => buildGridView(
                        state.apartment.apartments[0].image[index],
                        context),
                  ));
            }
          }
          return Center(
            child: Text(
              "There is No images",
              style: getSemiBoldStylePoppins(),
            ),
          );
        },
      ),
    );
  }

  Widget buildGridView(String image, context) {
    return Image.network(image);
  }
}
