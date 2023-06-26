import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wevr_app/core/components/bottom_sheet.dart';
import 'package:wevr_app/core/utils/constants.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/save/states.dart';
import '../../../../../core/service/service_locator_imports.dart';
import '../../controller/save/cubit.dart';

class FavIcon extends StatefulWidget {
  final int id;

  const FavIcon({Key? key, required this.id}) : super(key: key);

  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SaveCubit(saveApartmentUsecCase: sl()),
      child: BlocBuilder<SaveCubit, SaveApartmentState>(
        builder: (context, state) {
          var cubit = SaveCubit.get(context);

          return IconButton(
            onPressed: () {
              setState(() {
                if (Constants.userToken == null) {
                  showBottomSheetWidget(context);
                }  
                cubit.saveApartment(id: widget.id);
              });
            },
            icon: state is SaveSuccessState &&
                    state.saveApartmentEntity.massage ==
                        'Apartment saved successfully'
                ? const Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                  )
                : const Icon(Icons.favorite_border),
          );
        },
      ),
    );
  }
}
