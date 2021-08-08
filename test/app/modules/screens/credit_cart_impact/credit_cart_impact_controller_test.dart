@GenerateMocks([CreditCartImpactController])

import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spending_awareness/app/modules/screens/credit_cart_impact/credit_cart_impact_controller.dart';

import 'package:spending_awareness/app/modules/screens/credit_cart_impact/credit_cart_impact_module.dart';
import 'package:test/test.dart';

class CreditCartImpactControllerMock extends Mock
    implements CreditCartImpactController {}

void main() {
  initModule(CreditCartImpactModule());

  var creditcartimpact = CreditCartImpactControllerMock();
  /*=
      CreditCartImpactController(myFontsSize, _localDatabase, myTweens);*/
  //
  setUp(() async {
    /*creditcartimpact =
        CreditCartImpactModule.to.get<CreditCartImpactController>();*/
  });

  group('CreditCartImpactController Test', () {
    /*test("First Test", () {
      expect(creditcartimpact, isA<CreditCartImpactController>());
    });*/

    //   test("Set Value", () {
    //     expect(creditcartimpact.value, equals(0));
    //     creditcartimpact.increment();
    //     expect(creditcartimpact.value, equals(1));
    //   });

    test("method getHowDoYouSpendInAweek", () async {
      when(creditcartimpact.getHowDoYouSpendInAweek(25.0, 2)).thenReturn(50.0);
      expect(creditcartimpact.getHowDoYouSpendInAweek(25.0, 2), 50.0);
    });
  });
}
