import 'package:first_app/src/features/auth/presentation/provider/login_provider.dart';
import 'package:get_it/get_it.dart';

import 'src/features/auth/application/login_service.dart';
import 'src/features/auth/domain/interfaces/login_repository.dart';
import 'src/features/auth/domain/usecases/LoginUseCase.dart';
import 'src/features/auth/infra/login_impl.dart';

final sl = GetIt.instance;

void setupDependencies() {
  // Infraestructura
  sl.registerLazySingleton<ILoginRepository>(() => LoginRepositoryImpl());
  //sl.registerLazySingleton<IRegisterRepository>(() => RegisterRepositoryImpl());
  
  // Domain
  sl.registerLazySingleton(() => LoginUseCase(sl<ILoginRepository>()));
  //sl.registerLazySingleton(() => RegisterUseCase(sl<IRegisterRepository>()));
  
  // Application
  sl.registerLazySingleton(() => LoginService(sl<LoginUseCase>()));
  //sl.registerLazySingleton(() => RegisterService(sl<RegisterUseCase>()));
  
  // presentation/providers
  sl.registerFactory(() => LoginProvider(sl<LoginService>()));
  //sl.registerFactory(() => RegisterProvider(sl<RegisterService>()));
}
