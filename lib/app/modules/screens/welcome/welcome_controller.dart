import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'welcome_controller.g.dart';

@Injectable()
class WelcomeController = _WelcomeControllerBase with _$WelcomeController;

abstract class _WelcomeControllerBase with Store {}
