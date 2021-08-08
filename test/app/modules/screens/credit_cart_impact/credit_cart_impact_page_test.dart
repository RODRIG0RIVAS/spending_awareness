@GenerateMocks([CreditCartImpactPage])

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spending_awareness/app/modules/screens/credit_cart_impact/credit_cart_impact_controller.dart';
import 'package:spending_awareness/app/modules/screens/credit_cart_impact/credit_cart_impact_module.dart';
import 'package:spending_awareness/app/modules/screens/credit_cart_impact/credit_cart_impact_page.dart';

void main() {
  testWidgets('CreditCartImpactPage has title', (tester) async {
    //  await tester.pumpWidget(buildTestableWidget(CreditCartImpactPage(title: 'CreditCartImpact')));
    //  final titleFinder = find.text('CreditCartImpact');
    //  expect(titleFinder, findsOneWidget);
  });

  testWidgets('Deve mostrar todos os estados na tela',
      (WidgetTester tester) async {
    initModule(CreditCartImpactModule());

    var mock = CreditCartImpactPage(
      title: 'Spending Awareness',
    );

    await tester.pumpWidget(MaterialApp(home: buildTestableWidget(mock)));
    //await tester.pumpAndSettle();
    //final titleFinder = find.text('Spending Awareness');
    // expect(titleFinder, findsOneWidget);

    final row = find.byType(Row);
    expect(row, findsOneWidget);
  });
}
