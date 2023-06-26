import 'package:dartz/dartz.dart';
import 'package:wevr_app/core/errors/failures.dart';
import 'package:wevr_app/core/network/network_info.dart';
import 'package:wevr_app/features/user_dashboard/data/datasources/auction_remote_datasource.dart';
import 'package:wevr_app/features/user_dashboard/domain/entities/auction.dart';
import 'package:wevr_app/features/user_dashboard/domain/repository/auction_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/strings_manager.dart';

class AuctionRepoImpl extends BaseAuctionRepository {
  final BaseAuctionRemoteDatasource baseAuctionRemoteDatasource;
  final NetworkInfo networkInfo;

  AuctionRepoImpl({
    required this.baseAuctionRemoteDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Auction>>> getAuctions() async {
    if (await networkInfo.isConnected) {
      try {
        final auctions = await baseAuctionRemoteDatasource.getAuctions();
        return Right(auctions);
      } on ServerException {
        return const Left(ServerFailure(StringsManager.SERVER_FAILURE_MESSAGE));
      }
    } else {
      throw ServerException();
    }
  }
}
