import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/save/states.dart';

import '../../../domain/use_cases/Save_apartment_usecase.dart';

class SaveCubit extends Cubit<SaveApartmentState> {
  final SaveApartmentUsecCase saveApartmentUsecCase;

  SaveCubit({required this.saveApartmentUsecCase}) : super(SaveInitialState());

  static SaveCubit get(context) => BlocProvider.of(context);

  bool isFav = false;

  Future<void> saveApartment({required int id}) async {
    try {
      final save = await saveApartmentUsecCase.call(id: id);
      save.fold((failure) {
        emit(SaveErrorState(failure.toString()));
      }, (saveEntity){
        emit(SaveSuccessState(saveEntity));
      });
    } catch (e) {
      emit(SaveErrorState(e.toString()));
    }
  }
}
