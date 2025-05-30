import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:laza_applicaiton/core/common/constants/colors/app_colors.dart';
import 'package:laza_applicaiton/core/common/textstyles/app_text_styles.dart';
import 'package:laza_applicaiton/core/common/widgets/buttons/bottom_button_wg.dart';
import 'package:laza_applicaiton/core/utils/responsiveness/app_responsivness.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/home_event.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/single_product/singel_product_state.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/single_product/single_product_bloc.dart';

import '../../../../../core/common/widgets/app_bar/action_app_bar.dart';
import '../../../../../core/page_routes/route_generator.dart';

class SingleProductPage extends StatefulWidget {
  final int id;

  const SingleProductPage({super.key, required this.id});

  @override
  State<SingleProductPage> createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage> {
  late ScrollController _scrollController;
  bool _showBottomButton = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    context.read<SingleProductBloc>().add(FetchSingleProductEvent(widget.id));
    super.initState();
  }

  void _scrollListener() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;

    if (currentScroll >= maxScroll / 2) {
      if (!_showBottomButton) {
        setState(() {
          _showBottomButton = true;
        });
      }
    } else {
      if (_showBottomButton) {
        setState(() {
          _showBottomButton = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBar(
        onPressed: () {
          AppRoute.close();
        },
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
      body: BlocBuilder<SingleProductBloc, SingleProductState>(
        builder: (context, state) {
          if (state is SingleProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SingleProductError) {
            return Center(child: Text('Error! ${state.message}'));
          } else if (state is SingleProductLoaded) {
            final product = state.singleProduct;
            return SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  SizedBox(
                    height: appH(350),
                    width: double.infinity,
                    child: Image.network(
                      state.singleProduct.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: appH(15)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: appH(10),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.category,
                              style: AppTextStyles.inter.regular(
                                color: AppColors.grey,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              'Price',
                              style: AppTextStyles.inter.regular(
                                color: AppColors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: appW(180),
                              child: Text(
                                product.title,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.inter.semiBold(
                                  color: AppColors.black,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            Text(
                              "\$${product.price.toString()}",
                              style: AppTextStyles.inter.semiBold(
                                color: AppColors.black,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Size',
                              style: AppTextStyles.inter.semiBold(
                                color: AppColors.black,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              'Size Guide',
                              style: AppTextStyles.inter.regular(
                                color: AppColors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            myContainer('S'),
                            myContainer('M'),
                            myContainer('L'),
                            myContainer('XL'),
                            myContainer('2XL'),
                          ],
                        ),
                        Text(
                          'Description',
                          style: AppTextStyles.inter.semiBold(
                            color: AppColors.black,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          // height: 200,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            product.description,
                            style: AppTextStyles.inter.regular(
                              color: AppColors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Reviews',
                              style: AppTextStyles.inter.semiBold(
                                color: AppColors.black,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              'View All',
                              style: AppTextStyles.inter.regular(
                                color: AppColors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Image.asset(
                            'assets/images/reviewer.png',
                            width: appW(40),
                            height: appH(40),
                            fit: BoxFit.cover,
                          ),
                          title: Text('Ronald Richards'),
                          subtitle: Text('13 Sep, 2020'),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: ' rating',
                                      style: AppTextStyles.inter.regular(
                                        color: AppColors.grey,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                  text: product.rating.rate.toString(),
                                  style: AppTextStyles.inter.medium(
                                    color: AppColors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Text('⭐⭐⭐⭐⭐'),
                            ],
                          ),
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                          'Pellentesque malesuada eget vitae amet...',
                          style: AppTextStyles.inter.regular(
                            color: AppColors.grey,
                            fontSize: 15,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Total Price',
                            style: AppTextStyles.inter.semiBold(
                              color: AppColors.black,
                              fontSize: 15,
                            ),
                          ),
                          subtitle: Text(
                            'with VAT,SD',
                            style: AppTextStyles.inter.regular(
                              color: AppColors.grey,
                              fontSize: 11,
                            ),
                          ),
                          trailing: Text(
                            "\$${(product.price).toString()}",
                            style: AppTextStyles.inter.semiBold(
                              color: AppColors.black,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return Text('Wait...');
        },
      ),
      bottomNavigationBar: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: _showBottomButton ? 1.0 : 0.0,
        child:
            _showBottomButton
                ? BottomButtonWg(text: 'Add to Cart', onPressed: () {})
                : SizedBox.shrink(),
      ),
    );
  }

  Widget myContainer(String size) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.greyBackground,
      ),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Center(
        child: Text(
          size,
          style: AppTextStyles.inter.semiBold(
            color: AppColors.black,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
