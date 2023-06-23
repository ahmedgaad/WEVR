import 'package:dartz/dartz.dart';
import 'package:wevr_app/core/errors/failures.dart';
import 'package:wevr_app/features/user_dashboard/domain/entities/auction.dart';

abstract class BaseAuctionRepository{
  Future<Either<Failure, List<Auction>>> getAuctions();
}