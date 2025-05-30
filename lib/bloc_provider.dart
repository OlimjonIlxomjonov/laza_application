import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/confirmation/confirmation_bloc.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/create_new_password/create_new_password_bloc.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/reset_password/reset_password_bloc.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/categories_list/categories_bloc.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/product_by_category/by_category_bloc.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/products/products_bloc.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/single_product/single_product_bloc.dart';

import 'core/di/service_locator.dart';

class MyBlocProvider extends StatelessWidget {
  final Widget child;

  const MyBlocProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /// AUTH
        BlocProvider<SignUpBloc>(create: (context) => sl<SignUpBloc>()),
        BlocProvider<SignInBloc>(create: (context) => sl<SignInBloc>()),
        BlocProvider<CreateNewPasswordBloc>(
          create: (context) => sl<CreateNewPasswordBloc>(),
        ),
        BlocProvider<ResetPasswordBloc>(
          create: (context) => sl<ResetPasswordBloc>(),
        ),
        BlocProvider<ConfirmationBloc>(
          create: (context) => sl<ConfirmationBloc>(),
        ),

        ///HOME
        BlocProvider<ProductsBloc>(create: (context) => sl<ProductsBloc>()),
        BlocProvider<CategoriesBloc>(create: (context) => sl<CategoriesBloc>()),
        BlocProvider<ByCategoryBloc>(create: (context) => sl<ByCategoryBloc>()),
        BlocProvider<SingleProductBloc>(
          create: (context) => sl<SingleProductBloc>(),
        ),
      ],
      child: child,
    );
  }
}
