// appRoutes

import 'package:flutter/material.dart';
import 'package:metafit/utils/routes.dart';
import 'package:metafit/view/screens/GymDetails.dart';
import 'package:metafit/view/screens/HomeScreen.dart';
import 'package:metafit/view/screens/dietScreen.dart';
import 'package:metafit/view/screens/filterScreen.dart';
import 'package:metafit/view/screens/fitFormScreen.dart';
import 'package:metafit/view/screens/goalScreen.dart';
import 'package:metafit/view/screens/nearByGymScreen.dart';
import 'package:metafit/view/screens/nutritionScreen.dart';
import 'package:metafit/view/screens/registrationScreen.dart';
import 'package:metafit/view/screens/sweatySwipeMessageScreen.dart';
import 'package:metafit/view/screens/sweatySwipePermissionScreen.dart';
import 'package:metafit/view/screens/sweatySwipeScreen.dart';

import '../view/screens/welcomeScreen.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    RouteConstants.register: (BuildContext context) =>
        const RegistrationScreen(),
    RouteConstants.welcome: (BuildContext context) => const Welcomescreen(),
    //for login with email and password use below code
    RouteConstants.goal: (BuildContext context) => const GoalsScreen(),
    RouteConstants.diet: (BuildContext context) => const Dietscreen(),
    RouteConstants.home: (BuildContext context) => const Homescreen(),
    RouteConstants.filter: (BuildContext context) => const filterScreen(),
    RouteConstants.GymDetails: (BuildContext context) => const GymDetails(),
    // RouteConstants.diet: (BuildContext context) => const Dietscreen(),
    RouteConstants.nutrition: (BuildContext context) => const Nutritionscreen(),
    RouteConstants.fitForm: (BuildContext context) => const FitFormScreen(),
    RouteConstants.sweatySwipe: (BuildContext context) =>
        const Sweatyswipescreen(),
    RouteConstants.sweatySwipePermission: (BuildContext context) =>
        const Sweatyswipepermissionscreen(),
    RouteConstants.nearByGymScreen: (BuildContext context) => const MapScreen(),
  };
}
