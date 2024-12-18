import 'package:flutter/cupertino.dart';
import 'package:preview/src/screens/main/basket/basket_model.dart';
import 'package:provider/provider.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final basket = Provider.of<BasketModel>(context);

    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Корзина'),
        ),
        child: SafeArea(
          child: basket.items.isEmpty
              ? const Center(
                  child: Text('Корзина пуста'),
                )
              : ListView.builder(
                  itemCount: basket.items.length,
                  itemBuilder: (context, index) {
                    final product = basket.items[index];
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color: CupertinoColors.systemGrey6,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(product['name']),
                          CupertinoButton(
                              padding: EdgeInsets.zero,
                              child: Icon(CupertinoIcons.delete),
                              color: CupertinoColors.systemRed,
                              onPressed: () => basket.removeItem(product))
                        ],
                      ),
                    );
                  }),
        ));
  }
}
