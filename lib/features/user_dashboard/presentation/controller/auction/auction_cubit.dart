import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wevr_app/core/usecase/base_usecase.dart';
import 'package:wevr_app/features/user_dashboard/domain/use_cases/auction/get_auction_usecase.dart';

import '../../../domain/entities/auction.dart';
part 'auction_state.dart';

class AuctionCubit extends Cubit<AuctionStates> {
  final GetAuctionUsecase getAuctionUsecase;
  AuctionCubit({required this.getAuctionUsecase}) : super(AuctionInitial());

  static AuctionCubit get(context) => BlocProvider.of(context);

  Future<void> getAuctions() async {
    emit(GetAllAuctionsLoadingState());
    try {
      final auctions = await getAuctionUsecase.call(const NoParameters());
      auctions.fold(
        (failure) {
          log(failure.message);
          emit(GetAllAuctionsFailedState(failure.message));
        },
        (auctions) {
          emit(GetAllAuctionsSuccessState(auctions: auctions));
        },
      );
    } catch (e) {
      emit(GetAllAuctionsFailedState(e.toString()));
    }
  }
}
