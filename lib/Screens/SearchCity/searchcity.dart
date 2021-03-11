import 'package:flutter/material.dart';
import '../../constants.dart';

class SearchCity extends StatefulWidget {
  static const id = 'SearchCity';
  @override
  _SearchCityState createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.west_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: kBlackColor,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: kHorizontalPadding * 2,
                    vertical: kVerticalPadding * 2),
                suffixIcon: Container(
                  margin: EdgeInsets.only(right: kHorizontalPadding / 3),
                  padding: EdgeInsets.symmetric(
                    horizontal: kHorizontalPadding * 1.25,
                  ),
                  decoration: BoxDecoration(
                      gradient: kPrimaryGradient,
                      borderRadius: BorderRadius.circular(kRoundedCorner)),
                  child: Icon(
                    Icons.search_rounded,
                    color: kWhiteColor,
                    size: 24.0,
                  ),
                ),
                hintText: 'Search City',
                isDense: true,
                hintStyle: TextStyle(
                    color: Color(0xff949494),
                    fontSize: 16.0,
                    fontFamily: kPrimaryFontFamily),
                border: kNoBorder,
                filled: true,
                fillColor: kGreyBackground,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: kHorizontalPadding * 2,
                vertical: kVerticalPadding * 3),
            child: Column(
              children: [
                Text(
                  'Adding a coat is a good idea',
                  style: kPrimaryTextStyle.copyWith(
                    letterSpacing: 0.75,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: kVerticalPadding,
                ),
                Text(
                  'The average temprature for the next 40 days, will be 9 degrees it will rain for 4 days.',
                  style: kGreyTextStyle.copyWith(
                    height: 1.5,
                    fontFamily: kPrimaryFontFamily,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          LayoutBuilder(builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth,
              height: 300.0,
              padding: EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding * 2,
                  vertical: kVerticalPadding * 2),
              margin: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              decoration: BoxDecoration(
                  color: kGreyBackground,
                  borderRadius: BorderRadius.circular(kRoundedCorner)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: kVerticalPadding),
                    child: Text(
                      'Temprature \ntrend',
                      style: kPrimaryTextStyle.copyWith(
                          fontSize: 26.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}

class SalesData {
  final int year;
  final int sales;

  SalesData(this.year, this.sales);
}
