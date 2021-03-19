import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jetweather/Screens/FullView/fullview.dart';
import 'package:jetweather/constants.dart';
import 'package:jetweather/data.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Data(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(),
        initialRoute: Home.id,
        routes: {
          Home.id: (context) => Home(),
        },
      ),
    );
  }
}

class Home extends StatefulWidget {
  static const id = 'Home';
  final dataType = '';
  const Home({
    Key key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<Data>(context, listen: false).getLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (context, data, child) {
        return Scaffold(
            backgroundColor: kBlackColor,
            appBar: AppBar(
              backgroundColor: kBlackColor,
              elevation: 0.0,
              // leading: Icon(Icons.menu),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'Today',
                      style: kPrimaryTextStyle.copyWith(
                          fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  LayoutBuilder(builder: (context, constraints) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FullView(
                                      main: data.weatherMain.toString(),
                                      icon: data.weatherIcon.toString(),
                                      humidity: data.humidity.toString(),
                                      pressure: data.pressure.toString(),
                                      temp: data.temp.toString(),
                                      uvi: data.uvi.toString(),
                                      dewPoint: data.dewPoint.toString(),
                                      windDeg: data.windDeg.toString(),
                                      windSpeed: data.windSpeed.toString(),
                                      sunrise: DateFormat('Hm')
                                          .format(DateTime
                                              .fromMillisecondsSinceEpoch(
                                                  1000 * data.sunrise))
                                          .toString(),
                                      sunset: DateFormat('Hm')
                                          .format(DateTime
                                              .fromMillisecondsSinceEpoch(
                                                  1000 * data.sunset))
                                          .toString(),
                                    )));
                      },
                      child: Container(
                          child: Column(
                            children: [
                              Text('${data.weatherMain}',
                                  style: kSecondaryTextStyle),
                              Hero(
                                tag: 'BigTemp',
                                child: Text('${data.temp}°',
                                    style: kNumericTextStyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 120.0,
                                      decoration: TextDecoration.none,
                                    )),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(
                              bottom: kVerticalPadding * 5,
                              top: kVerticalPadding * 3),
                          width: constraints.maxWidth,
                          margin: EdgeInsets.only(
                              left: kHorizontalPadding * 3,
                              right: kHorizontalPadding * 3,
                              top: kHorizontalPadding * 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kRoundedCorner),
                            gradient: kPrimaryGradient,
                          )),
                    );
                  }),
                  SizedBox(
                    height: kVerticalPadding * 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: kHorizontalPadding),
                        margin: EdgeInsets.symmetric(
                            vertical: kVerticalPadding * 3),
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
                            for (var i = 1; i < 7; i++)
                              GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FullView(
                                              main: data.daily[i]['weather'][0]
                                                  ['main'],
                                              icon: data.daily[i]['weather'][0]
                                                  ['icon'],
                                              humidity: data.daily[i]
                                                      ['humidity']
                                                  .toString(),
                                              pressure: data.daily[i]
                                                      ['pressure']
                                                  .toString(),
                                              temp: data.daily[i]['temp']['day']
                                                  .round()
                                                  .toString(),
                                              uvi: data.daily[i]['uvi']
                                                  .toString(),
                                              dewPoint: data.daily[i]
                                                      ['dew_point']
                                                  .toString(),
                                              windDeg: data.daily[i]['wind_deg']
                                                  .toString(),
                                              windSpeed: data.daily[i]
                                                      ['wind_speed']
                                                  .toString(),
                                              sunset: DateFormat('Hm')
                                                  .format(DateTime
                                                      .fromMillisecondsSinceEpoch(
                                                          1000 *
                                                              data.daily[i]
                                                                  ['sunset']))
                                                  .toString(),
                                              sunrise: DateFormat('Hm')
                                                  .format(DateTime
                                                      .fromMillisecondsSinceEpoch(
                                                          1000 *
                                                              data.daily[i]
                                                                  ['sunrise']))
                                                  .toString(),
                                            ))),
                                child: ForecastGradientComponentBuilder(
                                    condition: data.daily[i]['weather'][0]
                                        ['main'],
                                    date: DateTime.fromMillisecondsSinceEpoch(
                                            1000 * data.daily[i]['dt'])
                                        .day
                                        .toString(),
                                    day: DateFormat('EE').format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            1000 * data.daily[i]['dt'])),
                                    image: data.daily[i]['weather'][0]['icon'],
                                    highTemp: (data.daily[i]['temp']['max'])
                                        .toString(),
                                    lowTemp: (data.daily[i]['temp']['min'])
                                        .toString()),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }
}

class ForecastGradientComponentBuilder extends StatelessWidget {
  final String day;
  final String date;
  final String condition;
  final String lowTemp;
  final String highTemp;
  final String image;
  const ForecastGradientComponentBuilder(
      {@required this.condition,
      @required this.date,
      @required this.day,
      @required this.highTemp,
      @required this.lowTemp,
      @required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      alignment: AlignmentDirectional.centerStart,
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
            child: Image(
              image: AssetImage('assets/images/$image.png'),
              width: 35.0,
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
