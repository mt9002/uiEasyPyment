import 'package:first_app/src/features/auth/presentation/provider/home_provider.dart';
import 'package:first_app/src/features/auth/presentation/provider/login_provider.dart';
import 'package:first_app/src/features/bill/domain/bill_use_case.dart';
import 'package:first_app/src/features/bill/domain/i_repository.dart';
import 'package:first_app/src/features/bill/infra/impl_bill.dart';
import 'package:first_app/src/features/bill/presentation/provider/bill_provider.dart';
import 'package:get_it/get_it.dart';

import 'src/features/auth/domain/interfaces/login_repository.dart';
import 'src/features/auth/domain/usecases/login_use_case.dart';
import 'src/features/auth/infra/login_impl.dart';

final sl = GetIt.instance;

void setupDependencies() {
  // Infraestructura
  sl.registerLazySingleton<ILoginRepository>(() => LoginRepositoryImpl());
  sl.registerLazySingleton<IRepositoryBill>(() => ImplBill());
  //sl.registerLazySingleton<IRegisterRepository>(() => RegisterRepositoryImpl());

  // Domain
  sl.registerLazySingleton(() => LoginUseCase(sl<ILoginRepository>()));
  sl.registerLazySingleton(() => BillUseCase(sl<IRepositoryBill>()));
  //sl.registerLazySingleton(() => RegisterUseCase(sl<IRegisterRepository>()));

  // presentation/providers
  sl.registerFactory(() => LoginProvider(sl<LoginUseCase>()));
  sl.registerFactory(() => HomeProvider());
  sl.registerFactory(() => BillProvider(sl<BillUseCase>()));
  //sl.registerFactory(() => RegisterProvider(sl<RegisterService>()));

  // Application
  // sl.registerLazySingleton(() => LoginService(sl<LoginUseCase>()));
  //sl.registerLazySingleton(() => RegisterService(sl<RegisterUseCase>()));
}
