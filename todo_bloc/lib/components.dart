import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// //! ------------------------------------------------------------------------------------------------ Company Information
// const baseUrl = "";
// // const baseUrl = "";

//! ------------------------------------------------------------------------------------------------ Sizes
const double defaultPadding = 24;
const double defaultBoxHeight = defaultPadding * 2;
const double maxBoxWidth = 400;
const double carouselHeight = 300;

// //* Border
// get borderWidth1 => 1.sp;
// get borderWidth2 => 2.sp;

// //! ------------------------------------------------------------------------------------------------ Animation
// Curve defaultCurve = Curves.easeInOut;

// //! ------------------------------------------------------------------------------------------------ Time
const defaultSplashScreenShow = Duration(seconds: 3);
const defaultDuration = Duration(milliseconds: 500);

//! ------------------------------------------------------------------------------------------------ Color
const primaryColor = Colors.green;
List<BoxShadow> get defaultShadow => [
      const BoxShadow(
        offset: Offset(2, 2),
        blurRadius: 1,
        spreadRadius: 1,
        color: Colors.black38,
      ),
    ];

//! ------------------------------------------------------------------------------------------------ Theme
TextTheme get textTheme => GoogleFonts.poppinsTextTheme(Typography.englishLike2018.apply(fontSizeFactor: 1));
get buttonTheme => const ButtonThemeData(height: defaultBoxHeight);
AppBarTheme _appBarTheme({Brightness brightness = Brightness.light}) {
  return AppBarTheme(
    toolbarHeight: defaultBoxHeight,
    surfaceTintColor: Colors.transparent,
    centerTitle: false,
    titleTextStyle: textTheme.titleLarge?.copyWith(color: brightness == Brightness.light ? Colors.black : Colors.white),
  );
}

ThemeData theme({Brightness brightness = Brightness.light}) {
  return ThemeData(
    useMaterial3: true,
    textTheme: textTheme,
    buttonTheme: buttonTheme,
    appBarTheme: _appBarTheme(brightness: brightness),
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor, brightness: brightness),
  );
}

SystemUiOverlayStyle setSafeAreaColor(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.light) {
    return SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemStatusBarContrastEnforced: false,
    );
  } else {
    return SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemStatusBarContrastEnforced: false,
    );
  }
}

// //! ------------------------------------------------------------------------------------------------ Validation
// const int phoneNumberLength = 11;
// const int nameMinLength = 8;
// const int passwordMinLength = 6;
// const int addressLength = 10;
// const String emailValidationPattern = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
// const int otpValidationLength = 5;
