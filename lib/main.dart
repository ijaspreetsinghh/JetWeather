import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jetweather/Screens/Forecast/forecast.dart';
import 'package:jetweather/Screens/FullView/fullview.dart';
import 'package:jetweather/Screens/SearchCity/searchcity.dart';
import 'package:jetweather/constants.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => Home(),
        SearchCity.id: (context) => SearchCity(),
        FullView.id: (context) => FullView(),
        Forecast.id: (context) => Forecast(),
      },
    );
  }
}

class Home extends StatefulWidget {
  static const id = 'Home';
  const Home({
    Key key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBlackColor,
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.location_city_outlined),
                onPressed: () => Navigator.pushNamed(context, SearchCity.id))
          ],
          backgroundColor: kBlackColor,
          elevation: 0.0,
          leading: Icon(Icons.menu),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: kHorizontalPadding,
                    ),
                    child: Column(
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
                    ),
                  )
                ],
              ),
              LayoutBuilder(builder: (context, constraints) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, FullView.id);
                  },
                  child: Container(
                      child: Column(
                        children: [
                          Text('Rain Showers', style: kSecondaryTextStyle),
                          Hero(
                            tag: 'BigTemp',
                            child: Text('29°',
                                style: kNumericTextStyle.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 100.0,
                                  decoration: TextDecoration.none,
                                )),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(
                          bottom: kVerticalPadding * 9,
                          top: kVerticalPadding * 3),
                      width: constraints.maxWidth,
                      margin: EdgeInsets.symmetric(
                          vertical: kVerticalPadding * 4,
                          horizontal: kHorizontalPadding * 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kRoundedCorner),
                        gradient: kPrimaryGradient,
                      )),
                );
              }),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, Forecast.id),
                      child: Container(
                        margin: EdgeInsets.only(right: kHorizontalPadding),
                        padding: EdgeInsets.symmetric(
                            horizontal: kHorizontalPadding,
                            vertical: kVerticalPadding * 2),
                        decoration: BoxDecoration(
                            gradient: kPrimaryGradient,
                            borderRadius:
                                BorderRadius.circular(kRoundedCorner * 2)),
                        child: Column(
                          children: [
                            Text(
                              '12:00',
                              style: kPrimaryTextStyle,
                            ),
                            Container(
                              child: Icon(
                                Icons.ac_unit_sharp,
                                size: 32.0,
                              ),
                              margin: EdgeInsets.symmetric(
                                  vertical: kVerticalPadding),
                            ),
                            Text(
                              '26°',
                              style: kSecondaryTextStyle.copyWith(
                                  fontSize: 16.0, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: kHorizontalPadding),
                      padding: EdgeInsets.symmetric(
                          horizontal: kHorizontalPadding,
                          vertical: kVerticalPadding * 2),
                      decoration: BoxDecoration(
                          color: kGreyBackground,
                          borderRadius:
                              BorderRadius.circular(kRoundedCorner * 2)),
                      child: Column(
                        children: [
                          Text(
                            '12:00',
                            style: kPrimaryTextStyle.copyWith(
                                color: Color(0xff888888)),
                          ),
                          Container(
                            child: Icon(
                              Icons.ac_unit_sharp,
                              size: 32.0,
                            ),
                            margin: EdgeInsets.symmetric(
                                vertical: kVerticalPadding),
                          ),
                          Text(
                            '26°',
                            style: kSecondaryTextStyle.copyWith(
                                color: Color(0xff888888),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
