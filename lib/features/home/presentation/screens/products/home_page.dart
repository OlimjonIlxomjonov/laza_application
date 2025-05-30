import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:laza_applicaiton/core/common/constants/colors/app_colors.dart';
import 'package:laza_applicaiton/core/common/textstyles/app_text_styles.dart';
import 'package:laza_applicaiton/core/page_routes/route_generator.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/categories_list/categories_bloc.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/categories_list/categories_state.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/home_event.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/products/products_bloc.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/products/products_state.dart';
import 'package:laza_applicaiton/features/home/presentation/screens/categories/categories_page.dart';
import 'package:laza_applicaiton/features/home/presentation/screens/products/single_product_page.dart';

import '../../../../../core/utils/responsiveness/app_responsivness.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // bool isActive = true;
  Set<int> likedIndex = {};
  List<String> drawerOptions = [
    'Account Information',
    'Password',
    'Order',
    'My Cards',
    'Wishlist',
    'Settings',
  ];

  List<Widget> drawerIcons = [
    Icon(IconlyLight.info_circle),
    Icon(IconlyLight.lock),
    Icon(IconlyLight.bag),
    Icon(IconlyLight.wallet),
    Icon(IconlyLight.heart),
    Icon(IconlyLight.setting),
  ];

  @override
  void initState() {
    context.read<ProductsBloc>().add(FetchAllProductsEvent());
    context.read<CategoriesBloc>().add(FetchAllCategoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: Builder(
          builder:
              (context) => Container(
                decoration: BoxDecoration(
                  color: AppColors.greyBackground,
                  shape: BoxShape.circle,
                ),
                margin: EdgeInsets.only(left: 10),
                child: IconButton(
                  // style: IconButton.styleFrom(
                  //   backgroundColor: AppColors.greyBackground,
                  // ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: Icon(Icons.menu, size: appH(20)),
                ),
              ),
        ),
        actionsPadding: EdgeInsets.only(right: 20),
        actions: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: AppColors.greyBackground,
            ),
            onPressed: () {},
            icon: Icon(IconlyLight.bag, size: appW(25)),
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(color: AppColors.white),
        ),
      ),
      drawer: Container(
        width: appW(300),
        child: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                padding: EdgeInsets.only(top: appH(50)),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColors.greyBackground,
                    radius: appH(25),
                  ),
                  title: Text(
                    'Mrh Raju',
                    style: AppTextStyles.inter.medium(
                      color: AppColors.black,
                      fontSize: 17,
                    ),
                  ),
                  subtitle: Text(
                    'Verified Profile',
                    style: AppTextStyles.inter.regular(
                      color: AppColors.grey,
                      fontSize: 13,
                    ),
                  ),
                  trailing: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.greyBackground,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '3 Orders',
                      style: AppTextStyles.inter.medium(
                        color: AppColors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.sunny),
                title: Text('Dark Mode'),
                trailing: Switch(value: false, onChanged: (value) {}),
              ),
              Expanded(
                flex: 2,
                child: ListView.builder(
                  itemCount: drawerOptions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: drawerIcons[index],
                      title: Text(drawerOptions[index]),
                    );
                  },
                ),
              ),
              Spacer(),
              ListTile(
                leading: Icon(IconlyLight.logout, color: AppColors.red),
                title: Text(
                  'Logout',
                  style: AppTextStyles.inter.medium(
                    color: AppColors.red,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: appH(40)),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Text(
              'Hello',
              style: AppTextStyles.inter.semiBold(
                color: AppColors.black,
                fontSize: 28,
              ),
            ),
            Text(
              'Welcome to Laza.',
              style: AppTextStyles.inter.regular(
                color: AppColors.grey,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 25),
            Row(
              spacing: 10,
              children: [
                Container(
                  width: appW(275),
                  height: appH(50),
                  decoration: BoxDecoration(
                    color: AppColors.greyBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    spacing: 15,
                    children: [
                      SizedBox(),
                      Icon(IconlyLight.search, color: AppColors.grey),
                      Text(
                        'Search...',
                        style: AppTextStyles.inter.regular(
                          color: AppColors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    IconlyLight.voice,
                    color: AppColors.white,
                    size: 26,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.backgroundNText,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(appW(50), appH(50)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            _sectionsString('Choose Brand', () {}),
            BlocBuilder<CategoriesBloc, CategoriesState>(
              builder: (context, state) {
                if (state is CategoriesLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is CategoriesError) {
                  return Center(child: Text(state.message));
                } else if (state is CategoriesLoaded) {
                  return Expanded(
                    flex: 1,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        final allCategories = state.categories[index];
                        return SizedBox(
                          height: appH(20),
                          child: GestureDetector(
                            onTap: () {
                              AppRoute.go(
                                CategoriesPage(category: allCategories),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.greyBackground,
                              ),
                              // height: appH(10),
                              child: Center(
                                child: Text(
                                  allCategories.toUpperCase(),
                                  style: AppTextStyles.inter.medium(
                                    color: AppColors.black,
                                    fontSize: 15,
                                  ),
                                ),
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
            _sectionsString('New Arraival', () {}),
            SizedBox(height: 20),
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProductsError) {
                  return Center(child: Text('Error'));
                } else if (state is ProductsLoaded) {
                  return Expanded(
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
                  );
                }
                return Text('Wait...');
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _sectionsString(String text, VoidCallback onPressed) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: AppTextStyles.inter.medium(color: AppColors.black, fontSize: 17),
      ),
      TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: onPressed,
        child: Text(
          'View All',
          style: AppTextStyles.inter.regular(
            color: AppColors.grey,
            fontSize: 13,
          ),
        ),
      ),
    ],
  );
}
