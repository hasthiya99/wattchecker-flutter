import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/styles.dart';
import 'package:wattchecker/services/api.dart';
import 'package:wattchecker/widgets/appbar.dart';
import 'package:wattchecker/widgets/gift_card.dart';

class GiftsForYou extends StatefulWidget {
  const GiftsForYou({super.key});

  @override
  State<GiftsForYou> createState() => _GiftsForYouState();
}

class _GiftsForYouState extends State<GiftsForYou> {
  String selectedTab = 'Redeem Rewards';
  List<Gift> redeemRewardsGifts = [];
  List<Gift> productOfferingsGifts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchGifts();
  }

  void _setSelectedTab(String tab) {
    setState(() {
      selectedTab = tab;
    });
  }

  Future<void> _fetchGifts() async {
    try {
      Api api = Api();
      List<Gift> allGifts = await api.getAllGifts();
      print('Fetched gifts: $allGifts');
      setState(() {
        redeemRewardsGifts =
            allGifts.where((gift) => !gift.isPhysicalGift).toList();
        productOfferingsGifts =
            allGifts.where((gift) => gift.isPhysicalGift).toList();
        isLoading = false;
      });
    } catch (e) {
      // Handle error here
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget _buildGiftCard() {
    List<Gift> giftsToShow = selectedTab == 'Redeem Rewards'
        ? redeemRewardsGifts
        : productOfferingsGifts;

    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (giftsToShow.isEmpty) {
      return Center(child: Text('No gifts available'));
    }

    return Column(
      children: giftsToShow
          .map((gift) => GiftCard(
                imagePath: gift.image,
                title: gift.name,
                subtitle: gift.description,
                credits: gift.creditCount,
                onRedeem: () {
                  // Add redeem functionality here
                },
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBarWithoutSearch(
          title: 'Gifts for you',
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 16.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(height: 10),
                    const Text(
                      'Your Credits',
                      style: TextStyle(
                        fontFamily: 'Lexend',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          color: creamCardColor,
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          boxShadow: [
                            defaultShadow(),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/annual_cost.svg'),
                                const SizedBox(width: 25),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '250',
                                      style: const TextStyle(
                                          fontFamily: 'Lexend',
                                          fontSize: 26,
                                          color: textBlack,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'Credits Earned',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: textGrey),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: Text(
                                'Keep earning rewards!',
                                style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          child: Text('Redeem Rewards'),
                          onPressed: () => _setSelectedTab('Redeem Rewards'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: selectedTab == 'Redeem Rewards'
                                ? Color.fromRGBO(13, 158, 105,
                                    1.0) // Dark green for selected
                                : Color.fromARGB(
                                    255, 203, 251, 204), // Default color
                            foregroundColor: Colors.black,
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w700,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          child: Text('Product Offerings'),
                          onPressed: () => _setSelectedTab('Product Offerings'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: selectedTab == 'Product Offerings'
                                ? Color.fromRGBO(13, 158, 105,
                                    1.0) // Dark green for selected
                                : Color.fromARGB(
                                    255, 203, 251, 204), // Default color
                            foregroundColor: Colors.black,
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w700,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    isLoading
                        ? Center(child: CircularProgressIndicator())
                        : _buildGiftCard(),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
