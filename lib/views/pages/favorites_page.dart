import 'package:flutter/material.dart';
import 'package:second_food_delivary_app/models/category.dart';
import 'package:second_food_delivary_app/models/product.dart';
import 'package:second_food_delivary_app/utils/app_routes.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

  String? selectedCategoryId;
  late List<Product> filteredfavoritesProducts;

  @override
  void initState() {
    super.initState();
    filteredfavoritesProducts = favProducts;
    debugPrint('HomePage initState()');
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
   

    debugPrint('FavoritesPage build()');

    if (favProducts.isEmpty) {
      return const Center(
        child: Text('No Favorite Products!'),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              SizedBox(
                  height: 120,
                  child: ListView.builder(
                    itemCount: dummyCategories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final dummyCategory = dummyCategories[index];
                      return InkWell(
                        onTap: () {
                          setState(() {
                            // if the category is already selected, unselect it
                            if (selectedCategoryId != null &&
                                selectedCategoryId == dummyCategory.id) {
                              selectedCategoryId = null;
                              filteredfavoritesProducts = favProducts;
                              // if the category is not selected, select it
                            } else {
                              selectedCategoryId = dummyCategory.id;
                              filteredfavoritesProducts = favProducts
                                  .where((product) =>
                                      product.category.id == selectedCategoryId)
                                  .toList();
                            }
                          });
                        },
                        child: Card(
                          color: selectedCategoryId == dummyCategory.id
                              ? Theme.of(context).primaryColor
                              : null,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  dummyCategory.imgUrl,
                                  width: 50,
                                  color: selectedCategoryId == dummyCategory.id
                                      ? Colors.white
                                      : null,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  dummyCategory.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color:
                                            selectedCategoryId == dummyCategory.id
                                                ? Colors.white
                                                : null,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
              ),   
              const SizedBox(height: 12),
              Text(
                ' Products (${filteredfavoritesProducts.length})',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              if (filteredfavoritesProducts.isNotEmpty)
               ListView.builder(
                itemCount: filteredfavoritesProducts.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.productDetails,
                            arguments: filteredfavoritesProducts[index],
                          ).then((value) => setState(() {}));
                        },
                        leading: Image.network(
                          filteredfavoritesProducts[index].imgUrl,
                          height: 100,
                          width: 70,
                          fit: BoxFit.fill,
                        ),
                        title: Text(
                          filteredfavoritesProducts[index].name,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        subtitle: Text(
                          '${filteredfavoritesProducts[index].category.title} - \$${filteredfavoritesProducts[index].price}',
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        trailing: orientation == Orientation.portrait ? IconButton(
                          onPressed: () {
                            setState(() {
                              filteredfavoritesProducts.remove(filteredfavoritesProducts[index]);
                            });
                          },
                          icon: const Icon(Icons.favorite),
                          color: Theme.of(context).primaryColor,
                        ) : TextButton.icon(
                          onPressed: () {
                            setState(() {
                              filteredfavoritesProducts.remove(filteredfavoritesProducts[index]);
                            });
                          },
                          icon: const Icon(Icons.favorite),
                          label: const Text('Favorite'),
                        ),
                      ),
                    ),
                  );
                }
              ),
              if (filteredfavoritesProducts.isEmpty)
              const Center(
                child: Text('No products found'),
              ),
          ],
        ),
      ),
    );
  }
}