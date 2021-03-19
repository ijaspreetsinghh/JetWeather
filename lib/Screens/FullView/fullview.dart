import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../data.dart';

class FullView extends StatefulWidget {
  static const id = 'fullview';
  final String dewPoint;
  final String windDeg;
  final String icon;
  final String humidity;
  final String pressure;
  final String uvi;
  final String windSpeed;
  final String main;
  final String temp;
  final String sunrise;
  final String sunset;
  FullView(
      {@required this.icon,
      @required this.dewPoint,
      @required this.humidity,
      @required this.uvi,
      @required this.pressure,
      @required this.temp,
      @required this.main,
      @required this.windDeg,
      @required this.windSpeed,
      @required this.sunrise,
      @required this.sunset});
  @override
  _FullViewState createState() => _FullViewState();
}

class _FullViewState extends State<FullView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(builder: (context, data, child) {
      return Scaffold(
          backgroundColor: kBlackColor,
          appBar: AppBar(
            backgroundColor: kBlackColor,
            elevation: 0.0,
          ),
          body: ListView(
            children: [
              SingleChildScrollView(child: Consumer<Data>(
                builder: (context, data, child) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: kVerticalPadding * 2),
                          padding: EdgeInsets.symmetric(
                              vertical: kVerticalPadding * 2,
                              horizontal: kHorizontalPadding * 1.5),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        'assets/images/${widget.icon}.png'),
                                    width: 90.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text('${widget.main}',
                                          style: kSecondaryTextStyle),
                                      SizedBox(
                                        height: kVerticalPadding / 2,
                                      ),
                                      Hero(
                                        tag: 'BigTemp',
                                        child: Text('${widget.temp} °',
                                            style: kNumericTextStyle.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 70.0,
                                              decoration: TextDecoration.none,
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: kVerticalPadding * 3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SingleComponentofFullViewGradientContainerRow(
                                      field: 'Wind Deg',
                                      icon: 'winddeg',
                                      value: '${widget.windDeg} °',
                                    ),
                                    SingleComponentofFullViewGradientContainerRow(
                                      field: 'Pressure',
                                      icon: 'pressure',
                                      value: '${widget.pressure} hPa',
                                    ),
                                    SingleComponentofFullViewGradientContainerRow(
                                      field: 'UVI',
                                      icon: 'uvi',
                                      value: '${widget.uvi} ',
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SingleComponentofFullViewGradientContainerRow(
                                    field: 'Humidity',
                                    icon: 'humidity',
                                    value: '${widget.humidity} %',
                                  ),
                                  SingleComponentofFullViewGradientContainerRow(
                                    field: 'Wind',
                                    icon: 'windspeed',
                                    value: '${widget.windSpeed} km/h',
                                  ),
                                  SingleComponentofFullViewGradientContainerRow(
                                    field: 'Dew Point',
                                    icon: 'dewpoint',
                                    value: '${widget.dewPoint} °',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kRoundedCorner),
                            gradient: LinearGradient(
                                begin: AlignmentDirectional.topCenter,
                                end: AlignmentDirectional.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Color(0xff111111),
                                  kGreyBackground
                                ],
                                stops: [
                                  0.05,
                                  0.40,
                                  0.75
                                ]),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: kHorizontalPadding * 1.5,
                              vertical: kVerticalPadding * 2),
                          decoration: BoxDecoration(
                            color: kGreyBackground,
                            borderRadius: BorderRadius.circular(kRoundedCorner),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    widget.sunrise,
                                    style: kSecondaryTextStyle.copyWith(
                                        fontSize: 16.0),
                                  ),
                                  SizedBox(
                                    height: kVerticalPadding,
                                  ),
                                  Text(
                                    'Sunrise',
                                    style: kGreyTextStyle.copyWith(
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: kHorizontalPadding),
                                color: Colors.lightBlue,
                                height: 10.0,
                              )),
                              Column(
                                children: [
                                  Text(
                                    widget.sunset,
                                    style: kSecondaryTextStyle.copyWith(
                                        fontSize: 16.0),
                                  ),
                                  SizedBox(
                                    height: kVerticalPadding,
                                  ),
                                  Text(
                                    'Sunset',
                                    style: kGreyTextStyle.copyWith(
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        LayoutBuilder(builder: (context, constraints) {
                          return Container(
                            width: constraints.maxWidth,
                            margin: EdgeInsets.symmetric(
                                vertical: kVerticalPadding * 2),
                            padding: EdgeInsets.symmetric(
                                horizontal: kHorizontalPadding * 1.5,
                                vertical: kVerticalPadding * 3),
                            decoration: BoxDecoration(
                                color: kGreyBackground,
                                borderRadius:
                                    BorderRadius.circular(kRoundedCorner)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ForeCast15DaysBuilder(
                                  bgColor: Color(0xff53482B),
                                  color: Color(0xffFED337),
                                  icon: Icons.whatshot_rounded,
                                  secondaryText: 'Temprature',
                                  primaryText: 'Average temprature 22',
                                ),
                                SizedBox(
                                  height: kVerticalPadding * 3,
                                ),
                                ForeCast15DaysBuilder(
                                  bgColor: Color(0xff2E3A53),
                                  color: Color(0xff468AFF),
                                  icon: Icons.accessible_forward_rounded,
                                  secondaryText: 'Precipitation',
                                  primaryText: '2 days precipitation',
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  );
                },
              )),
            ],
          ));
    });
  }
}

class SingleComponentofFullViewGradientContainerRow extends StatelessWidget {
  final String icon;
  final String value;
  final String field;
  const SingleComponentofFullViewGradientContainerRow(
      {@required this.field, @required this.icon, @required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/$icon.svg',
            color: kWhiteColor,
            height: 20.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: kVerticalPadding),
            child: Text(
              value,
              style: kSecondaryTextStyle.copyWith(fontSize: 16.0),
            ),
          ),
          Text(
            field,
            style: kGreyTextStyle,
          ),
        ],
      ),
    );
  }
}

class ForeCast15DaysBuilder extends StatelessWidget {
  final Color color;
  final Color bgColor;
  final String secondaryText;
  final IconData icon;
  final String primaryText;
  const ForeCast15DaysBuilder(
      {@required this.bgColor,
      @required this.color,
      @required this.icon,
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
          child: Icon(icon, color: color),
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
