import 'package:bank_app/src/auth/controller/biometric_controller.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initInjectionContainer() async {
  sl.registerLazySingleton(() => BiometricNotifier());
}

final bioController = sl.get<BiometricNotifier>();
