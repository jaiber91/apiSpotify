import 'package:get_it/get_it.dart';
import 'adapters_di.dart';
import 'business_di.dart';

void setupDI(GetIt getIt) {
  adaptersDI(getIt);
  businessDI(getIt);
}
