import 'dart:developer' as developer;

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'navigation_screen.dart';

// Blue text
void logInfo(final String msg) {
  developer.log('\x1B[34m$msg\x1B[0m');
}

// Green text
void logSuccess(final String msg) {
  developer.log('\x1B[32m$msg\x1B[0m');
}

// Yellow text
void logWarning(final String msg) {
  developer.log('\x1B[33m$msg\x1B[0m');
}

// Red text
void logError(final String msg) {
  developer.log('\x1B[31m$msg\x1B[0m');
}

Future<void> main() async {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final BeamerDelegate<BeamState> routerDelegate = BeamerDelegate<BeamState>(
    initialPath: '/users',
    locationBuilder: SimpleLocationBuilder(
      routes: <Pattern, dynamic Function(BuildContext, BeamState)>{
        '*': (final BuildContext context, final BeamState state) =>
            NavigationScreen(),
      },
    ),
  );

  @override
  Widget build(final BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Example',
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: routerDelegate,
      ),
    );
  }
}

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FlutterDemo',
        ),
      ),
      body: Column(
        children: const <Widget>[
          SizedBox(
            child: Text('FlutterDemo'),
          ),
        ],
      ),
    );
  }
}
