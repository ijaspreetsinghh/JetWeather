import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../data.dart';

class FullView extends StatefulWidget {
  static const id = 'fullview';
  @override
  _FullViewState createState() => _FullViewState();
}

class _FullViewState extends State<FullView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(builder: (context, data, child) {
      data.getData();
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
                padding:
                    const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                margin: EdgeInsets.only(bottom: kVerticalPadding * 1.5),
                child: Text('Chengdu',
                    style: kPrimaryTextStyle.copyWith(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TabBar(
                            isScrollable: true,
                            indicatorColor: kBlackColor,
                            automaticIndicatorColorAdjustment: false,
                            indicatorPadding: EdgeInsets.zero,
                            labelPadding: EdgeInsets.symmetric(
                                horizontal: kHorizontalPadding / 2),
                            indicator: BoxDecoration(color: kBlackColor),
                            tabs: [
                              TopTabFullView(),
                              TopTabFullView(),
                              TopTabFullView(),
                            ],
                          ),
                          Container(
                            height: 550.0,
                            child: TabBarView(
                              children: [
                                BodyWidget(),
                                BodyWidget(),
                                BodyWidget(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          ));
    });
  }
}

class TopTabFullView extends StatelessWidget {
  const TopTabFullView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.symmetric(
          horizontal: kHorizontalPadding * 1.5, vertical: kVerticalPadding / 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kRoundedCorner),
        gradient: kPrimaryGradient,
      ),
      child: Tab(
        child: Column(
          children: [
            Text(
              'Today',
              style: kPrimaryTextStyle.copyWith(
                  fontSize: 14.0,
                  letterSpacing: .85,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: kVerticalPadding / 2,
            ),
            Text(
              '02/10',
              style: kSecondaryTextStyle.copyWith(fontSize: 12.0),
            )
          ],
        ),
      ),
    );
  }
}

class BodyWidget extends StatefulWidget {
  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Consumer<Data>(
      builder: (context, data, child) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: kVerticalPadding * 2),
                padding: EdgeInsets.symmetric(
                    vertical: kVerticalPadding * 2,
                    horizontal: kHorizontalPadding * 1.5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: AssetImage('assets/images/4.png'),
                          width: 90.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('${data.weatherMain}',
                                style: kSecondaryTextStyle),
                            SizedBox(
                              height: kVerticalPadding / 2,
                            ),
                            Hero(
                              tag: 'BigTemp',
                              child: Text('${data.temp}°',
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
                      margin:
                          EdgeInsets.symmetric(vertical: kVerticalPadding * 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SingleComponentofFullViewGradientContainerRow(
                            field: 'Wind Deg',
                            icon: FontAwesomeIcons.airbnb,
                            value: '${data.windDeg}°',
                          ),
                          SingleComponentofFullViewGradientContainerRow(
                            field: 'Pressure',
                            icon: FontAwesomeIcons.compress,
                            value: '${data.pressure} hPa',
                          ),
                          SingleComponentofFullViewGradientContainerRow(
                            field: 'UVI',
                            icon: FontAwesomeIcons.sprayCan,
                            value: '${data.uvi}',
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SingleComponentofFullViewGradientContainerRow(
                          field: 'Humidity',
                          icon: Icons.ac_unit_outlined,
                          value: '${data.humidity} %',
                        ),
                        SingleComponentofFullViewGradientContainerRow(
                          field: 'Wind',
                          icon: Icons.ac_unit_outlined,
                          value: '${data.windSpeed} km/h',
                        ),
                        SingleComponentofFullViewGradientContainerRow(
                          field: 'Visibility',
                          icon: Icons.ac_unit_outlined,
                          value: '${data.visibility} km',
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
                          '07:09',
                          style: kSecondaryTextStyle.copyWith(fontSize: 16.0),
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
                      margin:
                          EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                      color: Colors.lightBlue,
                      height: 10.0,
                    )),
                    Column(
                      children: [
                        Text(
                          '18:40',
                          style: kSecondaryTextStyle.copyWith(fontSize: 16.0),
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
              )
            ],
          ),
        );
      },
    ));
  }
}

class SingleComponentofFullViewGradientContainerRow extends StatelessWidget {
  final IconData icon;
  final String value;
  final String field;
  const SingleComponentofFullViewGradientContainerRow(
      {@required this.field, @required this.icon, @required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            icon,
            color: kWhiteColor,
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
