// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../data/models/sample.dart' as _i8;
import '../samples/add_botanic_info_page.dart' as _i7;
import '../samples/botanic_info_page.dart' as _i6;
import '../samples/samples_page.dart' as _i5;
import '../sign_in/sign_in_page.dart' as _i4;
import '../splash/splash_page.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.SplashPage();
        }),
    SignInRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.SignInPage();
        }),
    SamplesRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.SamplesPage();
        }),
    BotanicInfoRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<BotanicInfoRouteArgs>();
          return _i6.BotanicInfoPage(key: args.key, item: args.item);
        }),
    AddBotanicInfoRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i7.AddBotanicInfoPage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashRoute.name, path: '/'),
        _i1.RouteConfig(SignInRoute.name, path: '/sign-in-page'),
        _i1.RouteConfig(SamplesRoute.name, path: '/samples-page'),
        _i1.RouteConfig(BotanicInfoRoute.name, path: '/botanic-info-page'),
        _i1.RouteConfig(AddBotanicInfoRoute.name,
            path: '/add-botanic-info-page')
      ];
}

class SplashRoute extends _i1.PageRouteInfo {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

class SignInRoute extends _i1.PageRouteInfo {
  const SignInRoute() : super(name, path: '/sign-in-page');

  static const String name = 'SignInRoute';
}

class SamplesRoute extends _i1.PageRouteInfo {
  const SamplesRoute() : super(name, path: '/samples-page');

  static const String name = 'SamplesRoute';
}

class BotanicInfoRoute extends _i1.PageRouteInfo<BotanicInfoRouteArgs> {
  BotanicInfoRoute({_i2.Key? key, required _i8.Sample? item})
      : super(name,
            path: '/botanic-info-page',
            args: BotanicInfoRouteArgs(key: key, item: item));

  static const String name = 'BotanicInfoRoute';
}

class BotanicInfoRouteArgs {
  const BotanicInfoRouteArgs({this.key, required this.item});

  final _i2.Key? key;

  final _i8.Sample? item;
}

class AddBotanicInfoRoute extends _i1.PageRouteInfo {
  const AddBotanicInfoRoute() : super(name, path: '/add-botanic-info-page');

  static const String name = 'AddBotanicInfoRoute';
}
