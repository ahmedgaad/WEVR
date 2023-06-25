import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/Home/states.dart';
import '../../../../../core/components/vr_alert_dialog.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../controller/Home/cubit.dart';

class VirtualTour extends StatelessWidget {
  const VirtualTour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Virtual Tour",
          style: getSemiBoldStylePoppins(
            color: ColorManager.black,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showAlertDialogWidget(context);
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: BlocBuilder<HomeLayoutCubit, HomeLayOutStates>(
        builder: (context, state) {
          if (state is ApartmentLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorManager.primary,
              ),
            );
          }
          if (state is ApartmentLoadedState) {
            return Stack(
              children:[
              SizedBox(
                height: double.infinity,
                child: WebView(
                  initialUrl: state.apartment.apartments[0].vrlink,
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              ),

            ]
            );
          } else {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Fail to load , please try again '),
                    IconButton(
                      onPressed: () {
                        HomeLayoutCubit.get(context).getApartment();
                      },
                      icon: const Icon(Icons.refresh),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
