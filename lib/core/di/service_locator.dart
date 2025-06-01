import 'dart:io';

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
import 'package:laza_applicaiton/features/home/data/repository/home_repository_impl.dart';
import 'package:laza_applicaiton/features/home/data/source/home_remote_data_source_impl.dart';
import 'package:laza_applicaiton/features/home/data/source/home_remote_datasource.dart';
import 'package:laza_applicaiton/features/home/domain/repository/product_repository.dart';
import 'package:laza_applicaiton/features/home/domain/usecase/all_carts_use_case.dart';
import 'package:laza_applicaiton/features/home/domain/usecase/all_products_use_case.dart';
import 'package:laza_applicaiton/features/home/domain/usecase/delete_product_use_case.dart';
import 'package:laza_applicaiton/features/home/domain/usecase/get_by_categories_use_case.dart';
import 'package:laza_applicaiton/features/home/domain/usecase/get_single_product_use_case.dart';
import 'package:laza_applicaiton/features/home/domain/usecase/product_categories_use_case.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/carts/carts_bloc.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/categories_list/categories_bloc.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/delete_product/delete_bloc.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/product_by_category/by_category_bloc.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/products/products_bloc.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/single_product/single_product_bloc.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => HttpClient());

  /// REMOTE
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );

  /// REPO
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<ProductRepository>(() => HomeRepositoryImpl(sl()));

  /// USE CASE
  // AUTH
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => ConfirmationUseCase(sl()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));
  sl.registerLazySingleton(() => CreateNewPasswordUseCase(sl()));

  // HOME
  sl.registerLazySingleton(() => AllProductsUseCase(sl()));
  sl.registerLazySingleton(() => ProductCategoriesUseCase(sl()));
  sl.registerLazySingleton(() => GetByCategoriesUseCase(sl()));
  sl.registerLazySingleton(() => GetSingleProductUseCase(sl()));
  sl.registerLazySingleton(() => AllCartsUseCase(sl()));
  sl.registerLazySingleton(() => DeleteProductUseCase(sl()));

  /// BLOC
  // AUTH
  sl.registerLazySingleton(() => SignUpBloc(sl()));
  sl.registerLazySingleton(() => SignInBloc(sl()));
  sl.registerLazySingleton(() => ConfirmationBloc(sl()));
  sl.registerLazySingleton(() => ResetPasswordBloc(sl()));
  sl.registerLazySingleton(() => CreateNewPasswordBloc(sl()));

  // HOME
  sl.registerLazySingleton(() => ProductsBloc(sl()));
  sl.registerLazySingleton(() => CategoriesBloc(sl()));
  sl.registerLazySingleton(() => ByCategoryBloc(sl()));
  sl.registerLazySingleton(() => SingleProductBloc(sl()));
  sl.registerLazySingleton(() => CartsBloc(sl()));
  sl.registerLazySingleton(() => DeleteBloc(sl()));
}
