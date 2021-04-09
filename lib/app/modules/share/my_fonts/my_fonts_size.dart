import 'package:mobx/mobx.dart';
part 'my_fonts_size.g.dart';

class MyFontsSize = _MyFontsSizeBase with _$MyFontsSize;

abstract class _MyFontsSizeBase with Store {
  @observable
  var labelIreceive = 20.0;

  @observable
  var labelMySalary = 35.0;
}
