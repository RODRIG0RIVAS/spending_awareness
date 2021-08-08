import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spending_awareness/app/modules/screens/welcome/widgets/how_works/how_works.dart';

void main() {
  testWidgets("Verifica os Widgets", (tester) async {
    final widget = HowWorks();

    final finder = find.byType(Container).first;

    var fakeContainer = Container(
      margin: const EdgeInsets.only(bottom: 50.0),
    );

    await tester.pumpWidget(fakeContainer);

    await tester.pumpWidget(buildTestableWidget(widget));

    final stringFinder = find.text("S.of(context).lbl_choice_your_earn_type");
    expect(stringFinder, findsOneWidget);

    expect(finder, findsOneWidget);
  });
}
