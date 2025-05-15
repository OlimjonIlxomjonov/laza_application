import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:laza_applicaiton/features/auth/data/repository/auth_repository_impl.dart';
import 'package:laza_applicaiton/features/auth/data/source/auth_remote_data_source.dart';
import 'package:laza_applicaiton/features/auth/data/source/auth_remote_data_source_impl.dart';
import 'package:laza_applicaiton/features/auth/domain/repositories/auth_repository.dart';
import 'package:laza_applicaiton/features/auth/domain/usecases/confirmation_use_case.dart';
import 'package:laza_applicaiton/features/auth/domain/usecases/create_new_password_use_case.dart';
import 'package:laza_applicaiton/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:laza_applicaiton/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:laza_applicaiton/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/confirmation/confirmation_bloc.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/create_new_password/create_new_password_bloc.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/reset_password/reset_password_bloc.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/sign_up/sign_up_bloc.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton(() => Dio());

  /// REMOTE
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );

  /// REPO
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  /// USE CASE
  // AUTH
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => ConfirmationUseCase(sl()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));
  sl.registerLazySingleton(() => CreateNewPasswordUseCase(sl()));

  /// BLOC
  // AUTH
  sl.registerLazySingleton(() => SignUpBloc(sl()));
  sl.registerLazySingleton(() => SignInBloc(sl()));
  sl.registerLazySingleton(() => ConfirmationBloc(sl()));
  sl.registerLazySingleton(() => ResetPasswordBloc(sl()));
  sl.registerLazySingleton(() => CreateNewPasswordBloc(sl()));
}
