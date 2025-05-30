import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:laza_applicaiton/core/common/constants/colors/app_colors.dart';
import 'package:laza_applicaiton/core/common/widgets/app_bar/action_app_bar.dart';
import 'package:laza_applicaiton/core/page_routes/route_generator.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/home_event.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/product_by_category/by_category_bloc.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/product_by_category/by_category_state.dart';
import 'package:laza_applicaiton/features/home/presentation/screens/products/single_product_page.dart';

import '../../../../../core/common/textstyles/app_text_styles.dart';
import '../../../../../core/utils/responsiveness/app_responsivness.dart';

class CategoriesPage extends StatefulWidget {
  final String category;

  const CategoriesPage({super.key, required this.category});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  Set<int> likedIndex = {};

  @override
  void initState() {
    context.read<ByCategoryBloc>().add(
      ProductsByCategoryEvent(widget.category),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBar(
        onPressed: () {
          AppRoute.close();
        },
        text: widget.category.toUpperCase(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: BlocBuilder<ByCategoryBloc, ByCategoryState>(
          builder: (context, state) {
            if (state is ByCategoryLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ByCategoryError) {
              return Center(
                child: Text(
                  'Error occurred while getting a data: ${state.message}',
                ),
              );
            } else if (state is ByCategoryLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${(state.result.length).toString()} Items",
                    style: AppTextStyles.inter.semiBold(
                      color: AppColors.black,
                      fontSize: 17,
                    ),
                  ),
                  Divider(),
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
                      itemCount: state.result.length,
                      itemBuilder: (context, index) {
                        final allProducts = state.result[index];
                        return GestureDetector(
                          onTap: () {
                            AppRoute.go(
                              SingleProductPage(id: state.result[index].id),
                            );
                          },
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
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            return Text('Waiting...');
          },
        ),
      ),
    );
  }
}
