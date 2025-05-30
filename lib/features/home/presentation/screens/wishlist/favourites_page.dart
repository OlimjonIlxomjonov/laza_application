import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:laza_applicaiton/core/common/constants/colors/app_colors.dart';
import 'package:laza_applicaiton/core/common/widgets/app_bar/action_app_bar.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/products/products_bloc.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/products/products_state.dart';

import '../../../../../core/common/textstyles/app_text_styles.dart';
import '../../../../../core/page_routes/route_generator.dart';
import '../../../../../core/utils/responsiveness/app_responsivness.dart';
import '../../bloc/home_event.dart';
import '../products/single_product_page.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  Set<int> likedIndex = {};

  @override
  void initState() {
    context.read<ProductsBloc>().add(FetchAllProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBar(
        onPressed: () {},
        text: 'Wishlist',
        actions: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: AppColors.greyBackground,
            ),
            onPressed: () {},
            icon: Icon(IconlyLight.bag, size: appH(25)),
          ),
        ],
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductsError) {
            return Center(child: Text('Error'));
          } else if (state is ProductsLoaded) {
            return Column(
              children: [
                ListTile(
                  title: Text(
                    "${(state.products.length).toString()} Items",
                    style: AppTextStyles.inter.medium(
                      color: AppColors.black,
                      fontSize: 17,
                    ),
                  ),
                  subtitle: Text(
                    'in wishlist',
                    style: AppTextStyles.inter.regular(
                      color: AppColors.grey,
                      fontSize: 15,
                    ),
                  ),
                  trailing: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.greyBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Edit',
                      style: AppTextStyles.inter.medium(
                        color: AppColors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // mainAxisSpacing: ,
                      crossAxisSpacing: 40,
                      childAspectRatio: appW(0.50),
                    ),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final allProducts = state.products[index];
                      return GestureDetector(
                        onTap: () {
                          AppRoute.go(SingleProductPage(id: allProducts.id));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            spacing: 15,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                allProducts.image,
                                fit: BoxFit.cover,
                                scale: 4.5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    allProducts.title,
                                    style: AppTextStyles.inter.medium(
                                      color: AppColors.black,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$${allProducts.price.toString()}",
                                        style: AppTextStyles.inter.semiBold(
                                          color: AppColors.black,
                                          fontSize: 13,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (likedIndex.contains(index)) {
                                              likedIndex.remove(index);
                                            } else {
                                              likedIndex.add(index);
                                            }
                                          });
                                        },
                                        child: Icon(
                                          likedIndex.contains(index)
                                              ? IconlyBold.heart
                                              : IconlyLight.heart,
                                          color:
                                              likedIndex.contains(index)
                                                  ? Colors.red
                                                  : Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return Text('Wait...');
        },
      ),
    );
  }
}
