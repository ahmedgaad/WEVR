part of 'auction_imports.dart';

class AuctionView extends StatelessWidget {
  const AuctionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.exploreBackground,
      body: BlocProvider.value(
        value: sl<AuctionCubit>()..getAuctions(),
        child: BlocBuilder<AuctionCubit, AuctionStates>(
          builder: (context, state) {
            if (state is GetAllAuctionsSuccessState) {
              return state.auctions.isNotEmpty
                  ? ListView.separated(
                itemBuilder: (context, index) {
                  final auction = state.auctions[index];
                  return AuctionComponent(
                    image: auction.apartment.image,
                    type: auction.apartment.type,
                    location: auction.apartment.location,
                    startingPrice: auction.startingPrice,
                  );
                },
                separatorBuilder: (context, index) => 27.ph,
                itemCount: state.auctions.length,
              )
                  : Center(
                child: Text(
                  'لا يوجد مزادات بعد ..',
                  style: TextStyle(fontSize: 30, color: Colors.grey[300]),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
