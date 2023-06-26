part of 'auction_imports.dart';

class AuctionView extends StatelessWidget {
  const AuctionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.exploreBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileRow(),
            25.ph,
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const AuctionComponent(
                  image: AssetsImagesManager.apartment,
                  type: 'Apartment',
                  location: 'eqypt',
                  startingPrice: '20000',
                );
              },
              separatorBuilder: (context, index) => 27.ph,
              itemCount: 10,
            ),
          ],
        ),
      ),
    );
  }
}
