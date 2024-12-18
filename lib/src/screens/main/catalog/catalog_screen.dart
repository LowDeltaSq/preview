import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:preview/UI/styles/login_style.dart';
import 'package:preview/src/screens/main/catalog/product_screen.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScrennState();
}

class _CatalogScrennState extends State<CatalogScreen> {
  List<Map<String, dynamic>> products = [];
  List<Map<String, dynamic>> filteredProduct = [];
  bool isLoading = true;
  String? errorMessage;

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  //Метод получения товаров с сервера
  Future<void> fetchProduct() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final Dio dio = Dio();
      final response = await dio.get('http://10.0.2.2:53000/products');

      if (response.statusCode == 200 && response.data is List) {
        setState(() {
          products = List<Map<String, dynamic>>.from(response.data);
          filteredProduct = products;
        });
      } else {
        setState(() {
          errorMessage = 'Не удалось загрузить каталог товаров';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Ошибка ${e.toString()}';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  //Метод для фильтрации товаров по запросу
  void _filterProducts(String query) {
    setState(() {
      filteredProduct = products
          .where((product) =>
              product['name']?.toLowerCase().contains(query.toLowerCase()) ??
              false ||
                  product['description']
                      ?.toLowerCase()
                      .contains(query.toLowerCase()) ??
              false)
          .toList();
    });
  }

  //Метод для навигации к экрану товаров
  void _navigateToProductDetails(Map<String, dynamic> product) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => ProductDetailScreen(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Каталог'),
          backgroundColor: LoginStyle.backgroundColor,
        ),
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: CupertinoTextField(
                placeholder: 'Поиск',
                controller: searchController,
                obscureText: false,
                onChanged: _filterProducts,
              ),
            ),
            if (isLoading)
              const Center(
                child: CupertinoActivityIndicator(),
              )
            else if (errorMessage != null)
              Center(
                child: Text(errorMessage!),
              )
            else if (filteredProduct.isEmpty)
              const Center(
                child: Text('Нет товаров, соответстыуюзих запросу'),
              )
            else
              Expanded(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.75),
                    itemCount: filteredProduct.length,
                    itemBuilder: (context, index) {
                      final product = filteredProduct[index];
                      return CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: CupertinoColors.systemGrey6,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: CupertinoColors.systemGrey3,
                                  ),
                                  child: const Center(
                                      child: Icon(
                                    CupertinoIcons.photo,
                                    color: CupertinoColors.white,
                                    size: 40,
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product['name'] ?? '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        product['description'] ?? '',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: CupertinoColors.systemGrey),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          onPressed: () => _navigateToProductDetails(product));
                    }),
              ))
          ],
        )));
  }
}
