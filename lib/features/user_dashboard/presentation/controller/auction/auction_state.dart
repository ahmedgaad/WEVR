part of 'auction_cubit.dart';

abstract class AuctionStates extends Equatable {
  const AuctionStates();

  @override
  List<Object> get props => [];
}

class AuctionInitial extends AuctionStates {}

class GetAllAuctionsLoadingState extends AuctionStates{

}
class GetAllAuctionsSuccessState extends AuctionStates{
    final List<Auction> auctions;
  const GetAllAuctionsSuccessState({required this.auctions});
}
class GetAllAuctionsFailedState extends AuctionStates{
  final String error;
  const GetAllAuctionsFailedState(this.error);
}