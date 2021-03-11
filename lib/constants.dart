import 'package:flutter/material.dart';

const kGreyBackground = Color(0xff212121);
const kPrimaryGradient = LinearGradient(
    end: AlignmentDirectional.bottomEnd,
    begin: AlignmentDirectional.topStart,
    stops: [.15, .85],
    colors: [Color(0xffFC62E4), Color(0xff3363F2)]);
const kBlackColor = Colors.black;
const kWhiteColor = Color(0xffffffff);
const kPrimaryFontFamily = 'Montserrat';
const kSecondaryFontFamily = 'Lato';
const kHorizontalPadding = 16.0;
const kVerticalPadding = 10.0;
const kGreyColor = Color(0xffb8b8b8);
const kRoundedCorner = 25.0;
const kNumericTextStyle =
    TextStyle(color: kWhiteColor, fontFamily: kSecondaryFontFamily);
const kSecondaryTextStyle = TextStyle(
    color: kWhiteColor,
    letterSpacing: .5,
    fontFamily: kSecondaryFontFamily,
    fontWeight: FontWeight.w400);
const kGreyTextStyle = TextStyle(
    fontFamily: kSecondaryFontFamily,
    color: kGreyColor,
    // letterSpacing: 1.0,
    fontWeight: FontWeight.w300);
const kPrimaryTextStyle = TextStyle(
    color: kWhiteColor,
    letterSpacing: 2,
    fontFamily: kPrimaryFontFamily,
    fontWeight: FontWeight.w400);
const kNoBorder = OutlineInputBorder(
    borderSide: BorderSide(style: BorderStyle.none, width: 0),
    borderRadius: BorderRadius.all(Radius.circular(kRoundedCorner * 2)));
