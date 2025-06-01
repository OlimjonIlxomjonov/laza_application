import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconly/iconly.dart';
import 'package:laza_applicaiton/core/common/constants/colors/app_colors.dart';
import 'package:laza_applicaiton/core/common/textstyles/app_text_styles.dart';
import 'package:laza_applicaiton/core/common/widgets/app_bar/action_app_bar.dart';
import 'package:laza_applicaiton/core/common/widgets/buttons/bottom_button_wg.dart';
import 'package:laza_applicaiton/core/page_routes/route_generator.dart';
import 'package:laza_applicaiton/core/utils/responsiveness/app_responsivness.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/delete_product/delete_bloc.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/home_event.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/products/products_bloc.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/products/products_state.dart';
import 'package:laza_applicaiton/features/home/presentation/screens/carts/address_page.dart';
import 'package:laza_applicaiton/features/home/presentation/screens/carts/order_confirmed_page.dart';
import 'package:laza_applicaiton/features/home/presentation/screens/carts/payment_page.dart';

class CartsPage extends StatefulWidget {
  const CartsPage({super.key});

  @override
  State<CartsPage> createState() => _CartsPageState();
}

class _CartsPageState extends State<CartsPage> {
  List<int> itemCounts = [];

  void _increment(int index) {
    setState(() {
      itemCounts[index]++;
    });
  }

  void _decrement(int index) {
    setState(() {
      if (itemCounts[index] > 0) {
        itemCounts[index]--;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Are you serious?'),
            backgroundColor: AppColors.red,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBar(onPressed: () {}, text: 'Cart'),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductsError) {
            return Center(child: Text(state.message));
          } else if (state is ProductsLoaded) {
            if (itemCounts.length != state.products.length) {
              itemCounts = List.filled(state.products.length, 1);
            }
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final carts = state.products[index];
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                        ),
                        backgroundColor: AppColors.white,
                        context: context,
                        builder: (context) => buildSizedBox(),
                      );
                    },
                    child: Slidable(
                      key: ValueKey(carts.id),
                      endActionPane: ActionPane(
                        motion: const DrawerMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              context.read<DeleteBloc>().add(
                                DeleteProductEvent(carts.id),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Successfully deleted!'),
                                  backgroundColor: AppColors.green,
                                ),
                              );
                            },
                            backgroundColor: AppColors.red,
                            foregroundColor: AppColors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.greyBackground,
                              spreadRadius: 5,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Row(
                          spacing: 10,
                          children: [
                            SizedBox(
                              width: appW(100),
                              height: appH(100),
                              child: Image.network(carts.image),
                            ),
                            Column(
                              spacing: 10,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: appH(137),
                                  child: Text(
                                    carts.title,
                                    style: AppTextStyles.inter.medium(
                                      color: AppColors.black,
                                      fontSize: 13,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  '\$${carts.price} (-\$4.00 Tax)',
                                  style: AppTextStyles.inter.regular(
                                    color: AppColors.grey,
                                    fontSize: 11,
                                  ),
                                ),
                                Row(
                                  spacing: 15,
                                  children: [
                                    GestureDetector(
                                      onTap: () => _decrement(index),
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppColors.grey,
                                          ),
                                        ),
                                        child: Icon(
                                          IconlyLight.arrow_down_2,
                                          size: appW(15),
                                        ),
                                      ),
                                    ),
                                    Text(itemCounts[index].toString()),
                                    GestureDetector(
                                      onTap: () => _increment(index),
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppColors.grey,
                                          ),
                                        ),
                                        child: Icon(
                                          IconlyLight.arrow_up_2,
                                          size: appW(15),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return Text('Waiting...');
        },
      ),
    );
  }

  SizedBox buildSizedBox() {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      width: 100,
                      child: Divider(thickness: 2, height: 2),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      AppRoute.go(AddressPage());
                    },
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Delivery Address',
                      style: AppTextStyles.inter.medium(
                        color: AppColors.black,
                        fontSize: 17,
                      ),
                    ),
                    trailing: Icon(IconlyLight.arrow_right_2, size: 20),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Image.asset(
                      'assets/images/location.png',
                      width: appW(50),
                      height: appH(50),
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      'Chhatak, Sunamgonj 12/8AB',
                      style: AppTextStyles.inter.regular(
                        color: AppColors.black,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Text(
                      'Sylhet',
                      style: AppTextStyles.inter.regular(
                        color: AppColors.grey,
                        fontSize: 13,
                      ),
                    ),
                    trailing: Image.asset('assets/images/check.png'),
                  ),
                  ListTile(
                    onTap: () {
                      AppRoute.go(PaymentPage());
                    },
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Payment Method',
                      style: AppTextStyles.inter.medium(
                        color: AppColors.black,
                        fontSize: 17,
                      ),
                    ),
                    trailing: Icon(IconlyLight.arrow_right_2, size: 20),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: appW(50),
                      height: appH(50),
                      decoration: BoxDecoration(
                        color: AppColors.greyBackground,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/images/visa.png',
                        // fit: BoxFit.contain,
                      ),
                    ),
                    title: Text(
                      'Visa Classic',
                      style: AppTextStyles.inter.regular(
                        color: AppColors.black,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Text(
                      '**** 7690',
                      style: AppTextStyles.inter.regular(
                        color: AppColors.grey,
                        fontSize: 13,
                      ),
                    ),
                    trailing: Image.asset('assets/images/check.png'),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Order Info',
                      style: AppTextStyles.inter.medium(
                        color: AppColors.black,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  _orderInfo('Subtotal', 110),
                  _orderInfo('Shipping cost', 10),
                  _orderInfo('Total', 120),
                ],
              ),
            ),
            BottomButtonWg(
              text: 'Checkout',
              onPressed: () {
                AppRoute.go(OrderConfirmedPage());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderInfo(String costType, int cost) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            costType,
            style: AppTextStyles.inter.regular(
              color: AppColors.grey,
              fontSize: 15,
            ),
          ),
          Text(
            "\$${cost.toString()}",
            style: AppTextStyles.inter.medium(
              color: AppColors.black,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
