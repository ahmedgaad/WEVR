import 'package:dartz/dartz.dart';
import 'package:wevr_app/core/errors/failures.dart';
import 'package:wevr_app/core/usecase/base_usecase.dart';
import 'package:wevr_app/features/user_dashboard/domain/entities/auction.dart';
import 'package:wevr_app/features/user_dashboard/domain/repository/auction_repo.dart';

class GetAuctionUsecase extends BaseUsecase<List<Auction>, NoParameters>{
  final BaseAuctionRepository baseAuctionRepository;
  GetAuctionUsecase({required this.baseAuctionRepository});
  @override
  Future<Either<Failure, List<Auction>>> call(NoParameters parameters) async{
    return await baseAuctionRepository.getAuctions();
  }
}