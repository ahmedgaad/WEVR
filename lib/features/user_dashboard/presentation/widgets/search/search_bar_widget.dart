import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/search/cubit.dart';
import '../../controller/search/states.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key, required this.width, required this.height}) : super(key: key);
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit,SearchStates>(
      builder: (context , state) {
        return Container(
            width: width,
            height: height,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: TextFormField(
              // initialValue: StringsManager.searchBar.tr,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              onChanged: (String text){
                SearchCubit.get(context).search(query: text);
              },
            )
        );
      },
    );
  }
}