import 'package:flutter/material.dart';
import '../../constants.dart';

class Forecast extends StatefulWidget {
  static const id = 'forecase';
  @override
  _ForecastState createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {
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
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Chengdu',
                        style: kPrimaryTextStyle.copyWith(
                            fontSize: 28.0, fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: kVerticalPadding / 2,
                    ),
                    Text(
                      'Wednesday, 10 Feb',
                      style: kGreyTextStyle,
                    )
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: kVerticalPadding * 3),
              child: Text('7 days forecast',
                  style: kPrimaryTextStyle.copyWith(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.85)),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ForecastGradientComponentBuilder(
                    condition: 'Shower',
                    date: '5 Jan',
                    day: 'Tue',
                    highTemp: '26',
                    lowTemp: '15',
                  ),
                  ForecastGradientComponentBuilder(
                    condition: 'Shower',
                    date: '5 Jan',
                    day: 'Tue',
                    highTemp: '26',
                    lowTemp: '15',
                  ),
                  ForecastGradientComponentBuilder(
                    condition: 'Shower',
                    date: '5 Jan',
                    day: 'Tue',
                    highTemp: '26',
                    lowTemp: '15',
                  ),
                  ForecastGradientComponentBuilder(
                    condition: 'Shower',
                    date: '5 Jan',
                    day: 'Tue',
                    highTemp: '26',
                    lowTemp: '15',
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: kVerticalPadding * 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('15 days forecast',
                      style: kPrimaryTextStyle.copyWith(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.85)),
                  Row(
                    children: [
                      Text(
                        'Next 15 Days',
                        style: kPrimaryTextStyle.copyWith(
                            color: Color(0xff416BF7),
                            fontSize: 12.0,
                            letterSpacing: 0.0),
                      ),
                      SizedBox(
                        width: kHorizontalPadding / 2,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 12.0,
                        color: Color(0xff416BF7),
                      )
                    ],
                  )
                ],
              ),
            ),
            LayoutBuilder(builder: (context, constraints) {
              return Container(
                width: constraints.maxWidth,
                padding: EdgeInsets.symmetric(
                    horizontal: kHorizontalPadding * 1.5,
                    vertical: kVerticalPadding * 3),
                decoration: BoxDecoration(
                    color: kGreyBackground,
                    borderRadius: BorderRadius.circular(kRoundedCorner)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ForeCast15DaysBuilder(
                      bgColor: Color(0xff53482B),
                      color: Color(0xffFED337),
                      secondaryText: 'Temprature',
                      primaryText: 'Average temprature 22',
                    ),
                    SizedBox(
                      height: kVerticalPadding * 3,
                    ),
                    ForeCast15DaysBuilder(
                      bgColor: Color(0xff2E3A53),
                      color: Color(0xff468AFF),
                      secondaryText: 'Precipitation',
                      primaryText: '2 days precipitation',
                    ),
                  ],
                ),
              );
            }),
          ],
        ));
  }
}

class ForecastGradientComponentBuilder extends StatelessWidget {
  final String day;
  final String date;
  final String condition;
  final String lowTemp;
  final String highTemp;
  const ForecastGradientComponentBuilder(
      {@required this.condition,
      @required this.date,
      @required this.day,
      @required this.highTemp,
      @required this.lowTemp});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: kHorizontalPadding),
      padding: EdgeInsets.symmetric(
          horizontal: kHorizontalPadding, vertical: kVerticalPadding * 2),
      decoration: BoxDecoration(
          gradient: kPrimaryGradient,
          borderRadius: BorderRadius.circular(kRoundedCorner * 2)),
      child: Column(
        children: [
          Text(
            day,
            style: kPrimaryTextStyle.copyWith(
                letterSpacing: .0, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: kVerticalPadding / 2,
          ),
          Text(
            date,
            style: kPrimaryTextStyle.copyWith(
                letterSpacing: .0, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: kVerticalPadding,
          ),
          Text(
            condition,
            style: kPrimaryTextStyle.copyWith(
                letterSpacing: .0, fontWeight: FontWeight.w500, fontSize: 13.0),
          ),
          Container(
            child: Icon(
              Icons.ac_unit_sharp,
              size: 32.0,
            ),
            margin: EdgeInsets.symmetric(vertical: kVerticalPadding),
          ),
          Text(
            'High',
            style: kPrimaryTextStyle.copyWith(
                letterSpacing: .0, fontWeight: FontWeight.w500, fontSize: 13.0),
          ),
          Text(
            '$highTemp°',
            style: kSecondaryTextStyle.copyWith(
                fontSize: 16.0, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: kVerticalPadding,
          ),
          Text(
            'Low',
            style: kPrimaryTextStyle.copyWith(
                letterSpacing: .0, fontWeight: FontWeight.w500, fontSize: 13.0),
          ),
          Text(
            '$lowTemp°',
            style: kSecondaryTextStyle.copyWith(
                fontSize: 16.0, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

class ForeCast15DaysBuilder extends StatelessWidget {
  final Color color;
  final Color bgColor;
  final String secondaryText;
  final String primaryText;
  const ForeCast15DaysBuilder(
      {@required this.bgColor,
      @required this.color,
      @required this.primaryText,
      @required this.secondaryText});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(kRoundedCorner / 2)),
          padding: EdgeInsets.symmetric(
              horizontal: kVerticalPadding / 1.5,
              vertical: kVerticalPadding / 1.5),
          child: Icon(Icons.whatshot_rounded, color: color),
        ),
        SizedBox(
          width: kHorizontalPadding,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$secondaryText',
              style: kGreyTextStyle.copyWith(
                  fontFamily: kPrimaryFontFamily, fontSize: 13.0),
            ),
            SizedBox(
              height: kVerticalPadding / 2,
            ),
            Text(
              primaryText,
              style: kPrimaryTextStyle.copyWith(letterSpacing: 0.0),
            )
          ],
        )
      ],
    );
  }
}
