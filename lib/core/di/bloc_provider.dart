import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/user/presentation/blocs/userCreate/user_create_bloc.dart';
import '../../features/user/presentation/blocs/userList/user_list_bloc.dart';
import '../../features/products/presentation/blocs/productList/product_list_bloc.dart';
import '../../features/coupons/presentation/blocs/couponList/coupon_add_and_l_ist_bloc.dart';
import '../../features/coupons/presentation/blocs/couponUpdate/coupon_update_bloc.dart';

class AppBlocProvider extends StatelessWidget {
  const AppBlocProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCreateBloc>(
          create: (context) => UserCreateBloc(),
        ),
        BlocProvider<UserListBloc>(
          create: (context) => UserListBloc(),
        ),
        BlocProvider<ProductListBloc>(
          create: (context) => ProductListBloc(),
        ),
        BlocProvider<CouponAddAndLIstBloc>(
          create: (context) => CouponAddAndLIstBloc(),
        ),
        BlocProvider<CouponUpdateBloc>(
          create: (context) => CouponUpdateBloc(),
        ),
      ],
      child: child,
    );
  }
}
