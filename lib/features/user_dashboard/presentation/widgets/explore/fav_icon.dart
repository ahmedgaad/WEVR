import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/Home/cubit.dart';
import '../../controller/Home/states.dart';

class FavIcon extends StatelessWidget {
  const FavIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = HomeLayoutCubit.get(context);
    return BlocConsumer<HomeLayoutCubit, HomeLayOutStates>(
      listener:(context , state){} ,
      builder: (context , state) => IconButton(
          onPressed: (){
            cubit.changeFavorites();
          },
          icon: cubit.isFav? Icon(Icons.favorite , color: Colors.redAccent,) : Icon(Icons.favorite_border_outlined),),
    );
  }
}
