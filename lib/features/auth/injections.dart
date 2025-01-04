
import 'package:estem/features/auth/data/remote/verification_api.dart';
import 'package:estem/features/auth/data/remote/verification_api_impl.dart';
import 'package:estem/features/auth/data/repositories/verification_repository_impl.dart';
import 'package:estem/features/auth/domain/repositories/verification_repository.dart';
import 'package:estem/features/auth/domain/use_cases/verification_use_case.dart';

import 'domain/use_cases/login_use_case.dart';

import '/core/utils/injections.dart';
import 'data/remote/auth_api.dart';
import 'data/remote/auth_api_impl.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';

void initAuthInjections() {

  // Remote data source
  sl.registerFactory<AuthApi>(() => AuthApiImpl(sl()));
  sl.registerFactory<VerificationApi>(() => VerificationApiImpl(sl()));

  // Repositories
  sl.registerFactory<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerFactory<VerificationRepository>(() => VerificationRepositoryImpl(sl(), sl()));

  // UserCases
  sl.registerFactory<LoginUseCase>(() => LoginUseCase(sl()));
  sl.registerFactory(() => VerificationUseCase(sl()));
}