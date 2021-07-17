import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopping_food/app/models/produto_model.dart';
import 'package:shopping_food/app/modules/home/home_store.dart';
import 'package:shopping_food/app/shared/const/consts.dart';
import 'package:shopping_food/app/stores/cart_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final HomeStore store = Modular.get();
  final CartStore storeCart = Modular.get();
  _HomePageState() {
    store.getList();
  }
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
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
            Container(
              padding: EdgeInsets.only(left: 10),
              height: 60,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: store.categorias.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        store.setPage(index);
                        print(store.page);
                      },
                      child: Container(
                        width: 150,
                        height: 50,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              store.iconesCategorias[index],
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                store.categorias[index],
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            store.page == 0
                ? store.produtos.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: store.frutas.length,
                            itemBuilder: (context, index) {
                              ProdutoModel produtoModel = store.frutas[index];
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
                                                  storeCart.addCarrinho(
                                                      produtoModel,
                                                      storeCart
                                                          .produtosCarrinho);
                                                },
                                                child: Text(
                                                  'Add to Cart',
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
                : Container(),
            store.page == 1
                ? store.produtos.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: store.vegetais.length,
                            itemBuilder: (context, index) {
                              ProdutoModel produtoModel = store.vegetais[index];
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
                                                  storeCart.addCarrinho(
                                                      produtoModel,
                                                      storeCart
                                                          .produtosCarrinho);
                                                },
                                                child: Text(
                                                  'Add to Cart',
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
                : Container(),
            store.page == 2
                ? store.produtos.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: store.vegano.length,
                            itemBuilder: (context, index) {
                              ProdutoModel produtoModel = store.vegano[index];
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
                                                  storeCart.addCarrinho(
                                                      produtoModel,
                                                      storeCart
                                                          .produtosCarrinho);
                                                },
                                                child: Text(
                                                  'Add to Cart',
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
                : Container(),
            store.page == 3
                ? store.produtos.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: store.padaria.length,
                            itemBuilder: (context, index) {
                              ProdutoModel produtoModel = store.padaria[index];
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
                                                  storeCart.addCarrinho(
                                                      produtoModel,
                                                      storeCart
                                                          .produtosCarrinho);
                                                },
                                                child: Text(
                                                  'Add to Cart',
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
                : Container(),
            store.page == 4
                ? store.produtos.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: store.laticinios.length,
                            itemBuilder: (context, index) {
                              ProdutoModel produtoModel =
                                  store.laticinios[index];
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
                                                  storeCart.addCarrinho(
                                                      produtoModel,
                                                      storeCart
                                                          .produtosCarrinho);
                                                },
                                                child: Text(
                                                  'Add to Cart',
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
                : Container(),
            store.page == 5
                ? store.produtos.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: store.carnes.length,
                            itemBuilder: (context, index) {
                              ProdutoModel produtoModel = store.carnes[index];
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
                                                  storeCart.addCarrinho(
                                                      produtoModel,
                                                      storeCart
                                                          .produtosCarrinho);
                                                },
                                                child: Text(
                                                  'Add to Cart',
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
                : Container(),
          ],
        ),
      ));
    });
  }
}
