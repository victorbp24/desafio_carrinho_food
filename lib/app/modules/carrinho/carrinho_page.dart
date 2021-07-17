import 'package:badges/badges.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopping_food/app/models/produto_model.dart';
import 'package:shopping_food/app/modules/carrinho/carrinho_store.dart';
import 'package:flutter/material.dart';
import 'package:shopping_food/app/shared/const/consts.dart';
import 'package:shopping_food/app/stores/cart_store.dart';

class CarrinhoPage extends StatefulWidget {
  final String title;
  const CarrinhoPage({Key? key, this.title = 'CarrinhoPage'}) : super(key: key);
  @override
  CarrinhoPageState createState() => CarrinhoPageState();
}

class CarrinhoPageState extends State<CarrinhoPage> {
  final CarrinhoStore store = Modular.get();
  final CartStore storeCart = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.orange,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.all(20),
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shopping Food',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      Badge(
                        badgeColor: Colors.transparent,
                        elevation: 0,
                        badgeContent: Text(
                          '${storeCart.produtosCarrinho.length}',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        child: IconButton(
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                              size: 40,
                            ),
                            onPressed: () {
                              Modular.to.pushNamed('/carrinho');
                            }),
                      )
                    ],
                  ),
                ),
                storeCart.produtosCarrinho.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                            itemCount: storeCart.produtosCarrinho.length,
                            itemBuilder: (context, index) {
                              ProdutoModel produtoModel =
                                  storeCart.produtosCarrinho[index];
                              String urlBase = AppConsts.URL_IMAGES +
                                  '/' +
                                  produtoModel.filename;

                              return Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  padding: EdgeInsets.only(
                                      left: 20, right: 10, top: 5, bottom: 5),
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              produtoModel.title,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              produtoModel.description,
                                              style: TextStyle(
                                                fontSize: 11,
                                              ),
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  storeCart.removeCarrinho(
                                                      produtoModel,
                                                      storeCart
                                                          .produtosCarrinho);
                                                },
                                                child: Text(
                                                  'Remove to Cart',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: NetworkImage(urlBase),
                                                fit: BoxFit.cover)),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    : Expanded(
                        child: Center(
                          child: Text('Your Cart is empty'),
                        ),
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}
