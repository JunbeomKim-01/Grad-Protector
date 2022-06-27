// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grade_protector/APi/Api.dart';

import 'package:grade_protector/main.dart';

void main() {

    // Build our app and trigger a frame.
    // await tester.pumpWidget(Loginpage());
    //
    // // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);
    //
    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();
    //
    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);

    group('api test', () {
      test('login ', () async{
        var result = await Api().getLoginAuth("junbeom1", "hk0301234");
        print(result);
      });
      test('quiz ', () async{
        var result = await Api().getQuiz();
        print(result['data']['body']);
      });
      test('assign ', () async{
        var result = await Api().getassign();
        print(result['data']['body'].keys);
      });
      test('course ', () async{
        var result = await Api().getcourse();
        print(result['data']['body']);
      });
      test('lecture ', () async{
        var result = await Api().getlectrue();
        print(result['data']['body']);
      });
  });
}
